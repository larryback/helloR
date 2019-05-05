library(rJava)
library(KoNLP)
library(twitteR); library(RCurl); library(RJSONIO); library(stringr)
library(streamR); library(ROAuth)

api_key = "TQA3hvxsZr2Fwfrf03slKKNxB"
api_secret = "Vzlrg6fgOQm1T8SyNRuARwhi5Z5UJP04KhhwLu4KPJ8f0WwmID"
token = "1905223106-1pUZ0Eqvz9ojDMvwVwcC4Sm8Lqs8OHkQlz3xiRn"
token_secret = "bE4hyDyB7e6ZyODJV8RTLpj3AcoqPmYk7QtI4m9XmV0YG"
setup_twitter_oauth(api_key, api_secret, token, token_secret)

# 1. twitter list → data.frame
tweets = searchTwitter(enc2utf8('미세먼지'), n=100, lan='ko', 
                       since='2019-03-11', until='2019-03-31')
tdf = twListToDF(tweets)          # cf. unlist(tweets)          # vector화

# 2. 중복 및 불량 데이터 제거
# tdf = tdf %>% filter(!isRetweet) %>% filter(favoriteCount > 2)
tdf = tdf %>% filter(regexpr('광고',text) == -1)    # 특정 단어 포함된 문서 제거
tw = unique(tdf$text)       # 중복 방지하고 text 만 남기자

# 3. 불용어 제거
tw = gsub("[[:cntrl:]]", "", tw)                      # 제어문자(\n, \t등) 제거
tw = gsub("http[s]?://[[:alnum:].\\/]+", "", tw)     # link 제거
tw = gsub("&[[:alnum:]]+;", "", tw)            # escape(&amp; &lt;등) 제거
tw = gsub("@[[:alnum:]]+[:]?", "", tw)             # 트위터 계정 부분 제거
tw = gsub("[ㄱ-ㅎㅏ-ㅣ]","",tw)                   # 한글 불용어(ㅋㅋㅎㅎ ㅠㅜ등) 제거
tw = gsub("<.*>", "", enc2native(tw))          # EMO(/U00000f등) 제거 (windows)
tw = gsub('\\p{So}|\\p{Cn}', '', tw, perl = TRUE)    # EMO(/U00000f등) 제거 (mac)
tw = gsub("\\s{2,}", " ", tw)                  # 2개이상 공백을 한개의 공백으로 처리
tw = gsub("[[:punct:]]", "", tw)               # 특수 문자 제거 (앞의 처리 때문에 마지막에 해야 
tw = gsub("RT", "", tw)


tw

Sys.setenv(JAVA_HOME="C:/Program Files/Java/jre1.8.0_201/")

# 1. install package
install.packages(c("rJava", "memoise", "KoNLP"))
# 2. load package
library(rJava)
library(KoNLP)



#########################   Twitter - wordcloud  ###################################

# 1. 명사 추출
nouns = sapply(tdf, extractNoun, USE.NAMES = F)
wc = sapply(tw, extractNoun, USE.NAMES = F)
wc1 = table(unlist(wc))
names(wc1)
length(wc1)

# 2. 상위 n 개 추출
wc2 = head(sort(wc1, decreasing = T), 100)
wc2

# 3. wordcloud
library(RColorBrewer)
library(wordcloud)
pal = brewer.pal(9, "Set1")
wordcloud(names(wc2), freq=wc2, scale=c(5,0.5), rot.per=0.25, 
          min.freq = 1, random.order = F, random.color = T, colors = pal)





#########################   Twitter - wordcloud  ###################################

# 1. 명사 추출



wc = sapply(tw, extractNoun, USE.NAMES = F)
wc1 = table(unlist(wc))
names(wc1)
length(wc1)



# 2. 상위 n 개 추출



wc2 = head(sort(wc1, decreasing = T), 200)
wc2



# 3. wordcloud



library(RColorBrewer)
library(wordcloud)
pal = brewer.pal(9, "Set1")
wordcloud(names(wc2), freq=wc2, scale=c(5,0.5), rot.per=0.25, 
          min.freq = 1, random.order = F, random.color = T, colors = pal)



################################  Text Mining  ###########################################

# 연관성 분석
install.packages(c("arules", "igraph", "combinat", "arulesViz", "visNetwork"))
library(arules); library(igraph); library(combinat)
nouns = sapply(wc, unique)
wc
nouns1 = sapply(nouns, function(x) {
Filter(function(y='') { nchar(y) <= 4 && nchar(y) > 1 && is.hangul(y) }, x)
})
wtrans = as(nouns1, "transactions")
rules = apriori(wtrans, parameter = list(supp=0.042, conf=0.5))
inspect(sort(rules))

install.packages(c("arulesViz", "visNetwork"))
library(arulesViz); library(visNetwork)
# lift 기준으로 상위 20개만을 시각화
subrules2 <- head(sort(rules, by="lift"), 20)
ig <- plot( subrules2, method="graph", control=list(type="items") )

# confidence 기준으로 상위 30개만을 시각화
subrules2 <- head(sort(rules, by="confidence"), 30)
ig <- plot( subrules2, method="graph", control=list(type="items") 
            
# interactive
ig_df <- get.data.frame( ig, what = "both" )
visNetwork(
nodes = data.frame(id = ig_df$vertices$name,
value = ig_df$vertices$support, ig_df$vertices),
edges = ig_df$edges
) %>% visEdges(ig_df$edges) %>%visOptions( highlightNearest = T )

#####################      Scrap the Naver News   ############################
install.packages(c('rvest', 'httr', 'stringr'))
library(rvest); library(httr); library(stringr); library(dplyr)
newsUrl = "https://news.naver.com/main/home.nhn"
html = read_html(newsUrl)
links = html_attr(html_nodes(html, '.newsnow div a'), 'href')
links = links[!is.na(links)]       # NA 제거
news = list()       # 변수 초기화
links

# 특정 링크 제외
news = list()
for (i in 1:length(links)) {
  try({
    if (regexpr('hotissue', links[i]) != -1 || regexpr('live', links[i]) != -1)
      next    
    print(links[i])
    html = read_html(links[i])
    comments = html_nodes(html, '#articleBodyContents')
    get_news = repair_encoding(html_text(comments))
    news[i] = str_trim(get_news)
  }, silent = F)
}
news


# news[i] = str_trim(getNewsContent(links[i]))

# 내용 수집
for (i in 1:length(links)) {
  try({
    htxt = read_html(paste0('https://news.naver.com', links[i]))
    comments = html_nodes(htxt, '#articleBodyContents')
    #repair_encoding(html_text(comments), from='utf-8')
    get_news = repair_encoding(html_text(comments))
    news[i] = str_trim(get_news)
  }, silent = F)
}




news
length(news) 
removeStopword(news)
for (i in 1:length(news)) {
  #news[[i]][1] = removeStopword(news[[i]][1])
  news[[i]][1] = gsub("flash 오류를 우회하기 위한 함수 추가function flashremoveCallback", "", news[[i]][1])
}



removeStopword = function(t) {
  t = gsub("[[:cntrl:]]", "", t) 
  t = gsub('[[:alnum:]]+@[[:alnum:].]+', '', t) #email remove
  t = gsub("http[s]?://[[:alnum:].\\/]+", "", t) 
  t = gsub("&[[:alnum:]]+;", "", t)
  t = gsub("@[[:alnum:]]+", "", t)
  t = gsub("@[[:alnum:]]+[:]?", "", t)
  t = gsub("[ㄱ-ㅎㅏ-ㅣ]","",t) 
  t = gsub("\\s{2,}", " ", t) 
  t = gsub("[[:punct:]]", "", t)  
  t = gsub("https", "", t)
  t = gsub("RT", "", t)
  t = gsub("\\s{2,}", " ", t) 
  t = gsub("// flash 오류를 우회하기 위한 함수 추가function _flash_removeCallback() {}\n\n\t\n\t", "", t)
  # mac: emo 제거
  gsub('\\p{So}|\\p{Cn}', '', t, perl = TRUE)
}

news

###################################################################################


library(rvest); library(httr); library(stringr); library(dplyr)
newsUrl = "https://news.naver.com/main/ranking/popularDay.nhn?mid=etc&sid1=111"
newsUrl
html = read_html(newsUrl)
html
links = html_attr(html_nodes(html, '.content dt a'), 'href')
links = links[!is.na(links)]
length(links)
head(links)
news = list()
for (i in 1:length(links)) {
  try({
    htxt = read_html(paste0('https://news.naver.com', links[i]))
    comments = html_nodes(htxt, '#articleBodyContents')
    get_news = repair_encoding(html_text(comments))   # repair_encoding(html_text(comments), from='utf-8')
    news[i] = str_trim(get_news)
  }, silent = F)
}
news[[28]][1]
length(news)
removeStopword(news)
for (i in 1:length(news)) {
  news[[i]][1] = removeStopword(news[[i]][1])
  news[[i]][1] = gsub("flash 오류를 우회하기 위한 함수 추가function flashremoveCallback", "", news[[i]][1])
}

news

removeStopword = function(t) {
  t = gsub("[[:cntrl:]]", "", t) 
  t = gsub("http[s]?://[[:alnum:].\\/]+", "", t) 
  t = gsub("&[[:alnum:]]+;", "", t)
  t = gsub("@[[:alnum:]]+", "", t)
  t = gsub("@[[:alnum:]]+[:]?", "", t)
  t = gsub("[ㄱ-ㅎㅏ-ㅣ]","",t) 
  t = gsub("\\s{2,}", " ", t) 
  t = gsub("[[:punct:]]", "", t)  
  t = gsub("https", "", t)
  t = gsub("RT", "", t)
  t = gsub("\\s{2,}", " ", t) 
  t = gsub('[[:alnum:]]+@[[:alnum:].]+', '', t)  # email 제거
  # mac: emo 제거s
  #gsub('\\p{So}|\\p{Cn}', '', t, perl = TRUE)
}

news[[28]][1]
news[[28]][1] = gsub("[[:cntrl:]]", "", news[[28]][1]) 
tt

#news[[28]][1] = NULL

news

########################  wordcloud  #########################################
Sys.setenv(JAVA_HOME="C:/Program Files/Java/jre1.8.0_201/")
library(rJava)
library(KoNLP)

# 1. 명사 추출
nouns = sapply(news, extractNoun, USE.NAMES = F)
wc = sapply(news, extractNoun, USE.NAMES = F)
wc1 = table(unlist(wc))
names(wc1)
length(wc1)
# 2. 상위 n 개 추출
wc2 = head(sort(wc1, decreasing = T), 100)
wc2

# 3. wordcloud
library(RColorBrewer)
library(wordcloud)
pal = brewer.pal(9, "Set1")
wordcloud(names(wc2), freq=wc2, scale=c(5,0.5), rot.per=0.25, 
            min.freq = 1, random.order = F, random.color = T, colors = pal)


###########################  연관성 분석 ##########################################

# 연관성 분석
#install.packages(c("arules", "igraph", "combinat", "arulesViz", "visNetwork"))
library(arules); library(igraph); library(combinat)
nouns = sapply(wc2, unique)
nouns1 = sapply(nouns, function(x) {
  Filter(function(y='') { nchar(y) <= 4 && nchar(y) > 1 && is.hangul(y) }, x)
})
wtrans = as(nouns1, "transactions")
rules = apriori(wtrans, parameter = list(supp=0.015, conf=0.5))
inspect(sort(rules))


###########################   연관성 시각화  ########################################

#install.packages(c("arulesViz", "visNetwork"))
library(arulesViz); library(visNetwork)
# lift 기준으로 상위 20개만을 시각화
subrules2 <- head(sort(rules, by="lift"), 20)
ig <- plot( subrules2, method="graph", control=list(type="items") )
# confidence 기준으로 상위 30개만을 시각화
subrules2 <- head(sort(rules, by="confidence"), 30)
ig <- plot( subrules2, method="graph", control=list(type="items") )
# interactive
ig_df <- get.data.frame( ig, what = "both" )
  visNetwork(
  nodes = data.frame(id = ig_df$vertices$name,
                     value = ig_df$vertices$support, ig_df$vertices),
  edges = ig_df$edges
) %>% visEdges(ig_df$edges) %>%visOptions( highlightNearest = T )

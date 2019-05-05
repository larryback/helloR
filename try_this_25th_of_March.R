####################################  Try This ###################################


#1. 본인이 원하는 검색어로 트위터 트윗을 가져와 워드클라우드를 작도하시오.
#(주의: secret key는 노출하지 마시오)


####################### Twitter - preprocessing, cleansing ######################


# 1. twitter list → data.frame
tweets = searchTwitter(enc2utf8('파이썬'), n=100, lan='ko', 
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



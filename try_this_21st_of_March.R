#1. doc 으로 wordcloud 작도 
install.packages('wordcloud')
library(tm)

getSources()
getReaders()

folder = system.file("texts", "txt", package="tm")
txtSource = DirSource(folder)   # dir 경로로 Corpus 생성
class(txtSource); str(txtSource)   
doc = VCorpus(txtSource, readerControl = list(language='lat'))
class(doc); summary(doc)

corpus_doc.txt

wordcloud(words = names(doc), freq=wFreq, min.freq = 1, scale = c(2.5, 0.5), rot.per = 0,
          random.order = F, colors = darks)

wordcloud(words = names(doc[1][1]), freq=wFreq, min.freq = 10,
          random.order = F, colors = darks)


wordcloud(words = names(crude), freq=wFreq, min.freq = 10,
          random.order = F, colors = darks)

wordcloud(words = names(chodata), freq=wFreq, min.freq = 10,
          random.order = F, colors = darks)


wordcloud(words = names(crimes), freq=wFreq, min.freq = 10,
          random.order = F, colors = darks)


wordcloud(words = names(economics), freq=wFreq, min.freq = 10,
          random.order = F, colors = darks)


###########################  강사님 풀이 ###############################################
doc = tm_map(doc, stripWhitespace)
doc = tm_map(doc, stemDocument, language="english")
doc = tm_map(doc, removeWords, stopwords("english"))
doc = tm_map(doc, stripWhitespace)
doc[[1]][1]
tdmDoc = TermDocumentMatrix(doc)
findFreqTerms(tdmDoc, 1)
docFreq = sort(rowSums(as.matrix(tdmDoc)), decreasing = T)
docFreq
docFreq = subset(docFreq, docFreq > 1)

wordcloud(words = names(docFreq), freq=docFreq, min.freq = 1, scale = c(2.5, 0.5),
          rot.per = 0, random.order = F, random.color = T, colors = darks)

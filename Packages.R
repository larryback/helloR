install.packages('stringi')
install.packages('devtools')
library(ggiraphExtra)

library(maps)
library(ggmap)
install.packages('ggiraphExtra')
install.packages('maps')
library(ggiraphExtra)
ggiraphExtra::ggChoropleth()   
library(ggiraphExtra)

library(moonBook2)

Encoding : utf-8


devtools::install_github("cardiomoon/kormaps2014")
library(kormaps2014)
library(dplyr)
library(ggplot2)
library(ggiraphExtra)
#kdata=kormaps2014::changeCode(korpop1)  # windows only
kdata = korpop1
head(kdata)
colnames(kdata)
rm(kdata)


load('data/data_eng.rda')

install.packages('dygraphs')
library(dygraphs)
library(xts)   

install.packages('sqldf')
library(sqldf)

encoding:utf-8

install.packages('RJDBC') 
library(RJDBC)

install.packages('RMySQL')
library(RMySQL)

drv = dbDriver("MySQL")
conn = dbConnect(drv, host='127.0.0.1', port=3306, dbname='dadb', user='dooo', password='1234')
dbSendQuery(conn, 'set character set utf8')


dbListTables(conn) 

library(kormaps2014)
changeCode(d)    #SQL ???글 깨질???

install.packages('tm')
library(tm)

getSources()
getReaders()

install.packages("SnowballC")

install.packages('RColorBrewer')  
library(RColorBrewer)

install.packages("wordcloud")     
library(wordcloud)


install.packages(c("rJava", "memoise", "KoNLP"))
library(rJava)
library(KoNLP)

install.packages(c("twitteR", "RCurl", "RJSONIO", "stringr", "streamR", "ROAuth"))
library(twitteR); library(RCurl); library(RJSONIO); library(stringr)
library(streamR); library(ROAuth)

Twitter API key 

api_key = "TQA3hvxsZr2Fwfrf03slKKNxB"
api_secret = "Vzlrg6fgOQm1T8SyNRuARwhi5Z5UJP04KhhwLu4KPJ8f0WwmID"
token = "1905223106-1pUZ0Eqvz9ojDMvwVwcC4Sm8Lqs8OHkQlz3xiRn"
token_secret = "bE4hyDyB7e6ZyODJV8RTLpj3AcoqPmYk7QtI4m9XmV0YG"



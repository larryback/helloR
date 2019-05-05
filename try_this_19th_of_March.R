#1. 멜론 탑 100 곡들의 장르와 랭킹간의 관계를 산점도로 작도하시오.


library(ggplot2)
library(sqldf)
library(RMySQL)

drv = dbDriver("MySQL")
conn = dbConnect(drv, host='127.0.0.1', port=3306, dbname='dadb', user='dooo', password='1234')
dbSendQuery(conn, 'set character set "utf8"')

c=dbGetQuery(conn, " select  a.genre, b.rank from Song a inner join SongRank b on a.songno = b.songno ")



ggplot(data=c, aes(x = genre, y = rank, size = rank , col = rank , alpah = 0.5)) + geom_point()


dbDisconnect(conn)

dbUnloadDriver(drv)

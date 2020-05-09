getwd()  #현재 경로 확인
setwd("/workspace/R/helloR") #경로 재설정
mtcars
dim(mtcars)
summary(mtcars)
plot(mtcars)
with(mtcars, plot(hp, mpg, xlab = 'hp', ylab = 'mpg', main = 'Correlation between hp and mpg'))

web <- "http://archive.ics.uci.edu/ml/machine-learning-databases/wine/wine.data"

winedat = read.table(web, header=FALSE, sep=",")

dim(winedat)
#변수의 개수 : V1-V14로 총 14개
#관찰치의 개수 : 178개
write.table(winedat,"c:/workspace/R/wine.txt", row.name=FALSE, col.name=FALSE, sep="\t")

scan(sep=",")

seq(from=3, to=7, by=1)

seq(to=7, from=3,  by=1)
 
seq(3, 7, 1)

seq(from=1, to=5, along=1:6)

rep(c(2,4), times=c(2,1))
?rep()
help(rep)

state.x77
summary(state.x77)
help(state.x77)

v1 <- c(11:20)
v1
v1[c(-2, -4)]

v2 <- c(3:7)
replace(v2, 2, 10)
v2
append(v2, 8, after=5)

v3 <- append(v2, 8, after=5)

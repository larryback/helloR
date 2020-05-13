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

x <- c(rep(3, 3), seq(3, 7, by=2), rev(seq(3, 7, length=3)), rep(4,3))

x

?scan()

matr <- matrix(1:9, nrow=3)

matr
length(matr)
mode(matr)
dim(matr)

r1 <- c(1, 2, 3)
r2 <- c(4, 5, 6)
r3 <- c(7, 8, 9)

rbind(r1, r2, r3)

c1 <- c(1, 2, 3)
c2 <- c(4, 5, 6)
c3 <- c(7, 8, 9)


cbind(c1, c2, c3)

m1 <- 1:9

dim(m1) <- c(3, 3)

m1

mat <- matrix(c(1,2,3,4,5,6,7,8,9), ncol=3, byrow = T)
mat

mat[1, ]
mat[ ,3]
mat[mat[,3]>4, 2]
mat[2, 3]


Height <- c(140, 15, 142, 175)

size.1 <- matrix(c(130,26,110,24,118,25,112,25), ncol=2, byrow=1, dimnames = list(c("Lee", "Kim", "Park", "Choi"), c("Weight", "Waist")))

size <- cbind(size.1, Height)

size

colmean <- apply(size, 2, mean)

colmean

rowmean <- apply(size, 1, mean)

rowmean

colvar <- apply(size, 1, var)

colvar

rowvar <- apply(size, 2, var)

rowvar

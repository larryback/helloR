# practice ####
fn3 = function(d, n=3) {
  print(head(d, n))
  print(tail(d, n))
}

fn3(data)

fn4 = function(d, n=0) {
  print(d[n,])
}

fn4(d, 5)


bt = function(n=1) {
  #return(n * 2)
  n * 2
}
bt(3)

# factor ####

f = factor(2, levels=1:3, labels=c('A', 'B', 'C'), ordered = T)
f
nlevels(f)
levels(f)
class(f)

c=c(1,2,3, 4.5, 'sss')
class(c)
c
rm(v1,v2)

as.numeric(f)
as.vector(f)
f

f2 = factor(1, levels=3:1, labels=c('A', 'B', 'C'))
f2
as.character(f2)

row.names(d) = NULL

# vector ######
v1 = c(1,2,3)
v1
v1[1] + v1[3]
length(v1)
length(data)
ncol(data)
summary(v1)
v1[4] = 4
v1
v1[6] = 6
class(v1)
v1[ c(1,3, 5) ] = 0
v1[1:3] = 0
v1[-3]
v1[-(1:3)]
length(v1)
names(v1) = LETTERS[1:length(v1)]
v1
names(v1)
names(v1) = NULL
LETTERS
letters
rm(v1)

# matrix ########
m1 = matrix(c('A', 'F', 'G', 'D', 'C', 'B'), ncol=3, byrow=T)
m1
m2 = matrix(c(LETTERS, 1, 2,3, 4), ncol=5)
m2
nrow(m2)
ncol(m2)
colnames(m2)
colnames(m2) = c('1ë¶„ë‹¨', '2ë¶„ë‹¨', '3ë¶„ë‹¨', '4ë¶„ë‹¨', '5ë¶„ë‹¨')
rownames(m2) = 1:6
rownames(m2) = 1:nrow(m2)

m2[, c(1,3)]
m2[, '5ë¶„ë‹¨']

data1 = 1:30
rowcnt = 5
m3 = matrix(data1, ncol=length(data1)/rowcnt, byrow=T)
colcnt = 5
m3 = matrix(data1, nrow=length(data1)/colcnt, byrow=T)
m3
m2
colnames(m3) = LETTERS[1:5]
rbind(m2, m3)
cbind(m2, m3)

paste('A', 10, sep='')
paste0('A', 10)
m2

# Try This ########
# 1
blood_type = function(n=1) {
  bf = factor(n, levels=1:4, labels=c('A', 'B', 'O', 'AB'))
  as.vector(bf)
}
blood_type(2)

# 2
append = function(v, val) {
  v[length(v) + 1] = val
  v
}
v1 = 1:3
v1 = append(v1, 4)
v1

# 3
m = matrix(1:(10*20), ncol=20, byrow = T)
m
colnames(m) = LETTERS[1:ncol(m)]
rownames(m) = letters[1:nrow(m)]

paste('A', 'B', sep = '')
paste0('A', 'B')

colnames(m)[10] = paste0(colnames(m)[10], 10)
colnames(m)[20] = paste0(colnames(m)[20], 20)
colnames(m[, c(10,20)])


# data.frame ######
df1 = data.frame(column1=11:15, column2=LETTERS[1:5])
df1
class(df1)
str(m)
str(df1)
m
data
str(data)
class(data)

df2 = data[1:10, 1:6]
df3 = data[1:10, c(1:3, 7,8)]
df2
df3
cbind(df2, df3)

df100 = data[101:110, 1:6]
df100
rbind(df2, df100)

# list ######
lst1 = list(a=1:3, b=4:7)
lst1
lst1$a
str(lst1)
names(lst1)

lst3 = list(1:3, LETTERS[1:3], c(2.5, 4.5, 3.7, 'Q'))
lst3
names(lst3)
str(lst3)

unlist(lst3)

m1
as.data.frame(m1)
data$?ˆ˜?•™
tbl = table(data$?ˆ˜?•™)
tbl
as.data.frame(tbl)

factor(5, levels = 1:5)
as.factor(1:5)

# Try This - chap.4 #######
# 1
df2
df3
df4 = cbind(df2, df3[, 4:5])
df4

# 2
df4[, c(1:4, 7, 6, 8, 5)]
cn = colnames(df4)
cn
df4[, c(cn[1:4], 'ê³¼í•™', '?ˆ˜?•™', '?˜ˆì²?', '?˜?–´')]

# built-in dataset ######
data()
dr = data()$result
str(dr)
head(dr)
class(dr)
dr[, 'Item']

data("AirPassengers")
class(AirPassengers)
AirPassengers

data("trees")
trees
class(trees)
head(trees)
letters
LETTERS
month.name
month.abb
pi
letters = c('AA', 'BB', 'CC')
letters
rm(letters)
ls(pattern = 'Air')

# packages ######
install.packages('data.table')

library('data.table')

start = Sys.time()
#
read.csv('data/test.csv')
#fread('data/?„±? .csv', encoding = 'UTF-8')
Sys.time() - start

head(data)

## read sep file #######
sepdata = read.delim('data/sep.txt', sep='#')
str(sepdata)
sepdata$name = as.character(sepdata$name)
View(head(sepdata))
summary(sepdata)

## read tsv ######
tsvdata = read.table("data/tcv.tsv", sep='\t', header = T, stringsAsFactors=F)
str(tsvdata)
summary(tsvdata)
View(tsvdata)

## read fwf ########
fwfdata = read.fwf('data/fwf.txt', header=F, width=c(8, 6, 5, 3, 4))
fwfdata
str(fwfdata)
summary(fwfdata)

## read excel file #########
install.packages('readxl')
library('readxl')
mtx = read_excel('data/meltop100.xlsx', sheet = 1, col_names =T)
mtx
colnames(mtx) = NULL

## Try This - read data file ######
# 1
nrow(mtx)
tail(mtx[-nrow(mtx), ])
mtx = mtx[-nrow(mtx), ]   # remove last row
tail(mtx)
mtx = mtx[, -(2:4)]
save(mtx, file = 'data/meltop_rm_last.rda')
str(mtx)
tail(mtx)
mtx$ê°€?ˆ˜
save(mtx, file = 'data/meltop100.rda')
rm(mtx)
load('data/meltop100.rda')

# 2
mtc = read.csv('data/mtc.csv')
summary(mtc)
tail(mtc)

# 3
temper = read.fwf('data/temper.txt', header=F, width=c(15, 4, 68, 5, 1))
temper  # V2, V4, V5
temper$V1 = NULL
temper$V3 = NULL
temper = temper[, c(2,4,5)]

## chap7. #########
data
boxplot(data$?ˆ˜?•™)
hist(data$?ˆ˜?•™)
data[data$?•™ë²? == 10337, ]

km = data[data$êµ??–´ > 90 & data$?ˆ˜?•™ > 90, ]
km
km[order(km$?ˆ˜?•™), ]
mean(data$?ˆ˜?•™)
sum(data$?ˆ˜?•™)
median(data$?ˆ˜?•™)

(data$êµ??–´ + data$?˜?–´ + data$?ˆ˜?•™) / 3
colnames(data)
data$ì´ì  = data[,4] + data[,5] + data[,6]
head(data)
data$ì´ì  = NULL

aggregate(data=data, ?ˆ˜?•™~ë°?, mean)
aggregate(data=data, cbind(êµ??–´,?˜?–´,?ˆ˜?•™)~ë°?, mean)

# install.packages('psych')
library('psych')
describe(data)
describe(data, IQR=T)
summary(data)
View(data)
data$avg = (data[,4] + data[,5])
head(data)
data$avg = NULL 
## Try This - Row Operator ######
# 1
km2 = data[data$ë°? == '?‚œ' & data$?„±ë³? == '?‚¨' & data$êµ??–´ > 90 & data$?ˆ˜?•™ > 90, ]
km2[order(km2$êµ??–´),]

# 2
data$?‰ê·? = (data[, 4] + data[, 5] + data[, 6] + data[, 7] + data[, 8])/5
head(data)
aggregate(data=data[data$êµ??–´ > = 80], cbind(êµ??–´, ?‰ê·?)~ë°?, mean)


library(ggplot2)
install.packages("ggplot2")
data$pass = ifelse(data$?‰ê·? >= 60, TRUE, FALSE)
head(data)
data[data$pass, ]
data$scout = ifelse(data$?‰ê·? >= 60, 
                    ifelse(data$?„±ë³? == '?‚¨', 'BoyScout', 'GirlScout'),
                    '')




qplot(data$pass)
qplot(data$scout)

gplot(data$scount = F)
qplot(km4)

#1 

qplot(data[data$scout != '',]$scout)


#2

data$?•™?  = ifelse(data$?‰ê·? >= 90, 'A',
                 ifelse(data$?‰ê·? >= 80, 'B', 
                        ifelse(data$?‰ê·? >= 70, 'C',
                               ifelse(data$?‰ê·? >= 60, 'D', 'F'))))


head(data)


#3
qplot(data$?•™? )


library(ggplot2)
mpg = as.data.frame(ggplot2::mpg)
str(mpg)
View(mpg)
summary(mpg)

midwest = as.data.frame(ggplot2::midwest)
summary(midwest)

## ggplot2::mpg####

rep(1, times=3)
rep(LETTERS[1:3], times=3)
rep(LETTERS[1:3], each=3)
rep(c('I', 'am'), times=2, length.out=7)
data.frame(customer=rep(c('ê¹€?¼?ˆ˜', 'ê¹€?´?ˆ˜'), each=2), 
           menu=rep(c('ì§œì¥', 'ì§¬ë½•'), times=2) )
-3:5
5.5:-4.5
seq(5.4, -4.5) 
seq(from=1, to=10, by=0.5)
seq(5.4, -4.5, length.out=10)
set.seed(100); sample(1:5, size=3)
runif(20) 

smdt = data.frame(stuno = 1:5, 
                  Korean=sample(60:100, 5),
                  English=sample((5:10) * 10, 5),
                  Math=sample(50:100, 5))
s = "abc,efg,abc"
nchar(s)    
toupper(s)
substr(s, 1, 5)
strsplit(s, ',')
sub('abc', 'ttt', s)
cat(s)   
print(s) 
paste('aaa-bbb', 'ccc-ddd', sep='**')
paste(data[1:3, 'ë°?'], collapse='**')paste('aaa-bbb', 'ccc-ddd', sep='**')  
outer(month.abb, 2011:2020, paste, sep='-')
outer(LETTERS, 2010:2020, paste0)
grep(pattern='^2', x=data$?•™ë²?, value = T)
for (i in 1:3) { print(i) }
for (r in 1:nrow(data)) { print (data[r, 'scout']) }
while(i < 10) { print(i); i = i + 1 }
i = 1
while(TRUE) { 
  if (i %% 2 ==0)
    next
  if (i > 10)
    break
}


while(TRUE) {
  x = as.integer(readline(prompt = "Input the number: "))
  if (x < 0) break
  
  f = 1
  
  if (x == 0)
    print("The factorial of 0 is 1")
  
  else {
    for (i in 1:x)
      f = f * i
    
    print(paste("The factorial of", x, "is", f))
  } 
}

smdt

source('factorial.R')

apply(smdt[, 2:4], MARGIN = 1, FUN = mean)
apply(smdt[, 2:4], MARGIN = 2, FUN = mean)
apply(smdt[, 2:4], MARGIN = 2, FUN = quantile)
lapply(smdt[, 2:4], FUN = mean)
unlist(lapply(smdt[, 2:4], FUN = mean))
sapply(smdt[, 2:4], FUN = mean, simplify = T)
vapply(smdt[, 2:4], FUN = mean, FUN.VALUE = 1)


library(reshape2)
install.packages('reshape2')
install.packages("rmarkdown")
Sys.sleep(10)

# practice ####
fn3 = function(d, n=3) {
  print(head(d, n))
  print(tail(d, n))
}

fn3(data)

fn4 = function(d, n=0) {
  print(d[n,])
}

fn4(d, 5)


bt = function(n=1) {
  #return(n * 2)
  n * 2
}
bt(3)

# factor ####

f = factor(2, levels=1:3, labels=c('A', 'B', 'C'), ordered = T)
f
nlevels(f)
levels(f)
class(f)

c=c(1,2,3, 4.5, 'sss')
class(c)
c
rm(v1,v2)

as.numeric(f)
as.vector(f)
f

f2 = factor(1, levels=3:1, labels=c('A', 'B', 'C'))
f2
as.character(f2)

row.names(d) = NULL

# vector ######
v1 = c(1,2,3)
v1
v1[1] + v1[3]
length(v1)
length(data)
ncol(data)
summary(v1)
v1[4] = 4
v1
v1[6] = 6
class(v1)
v1[ c(1,3, 5) ] = 0
v1[1:3] = 0
v1[-3]
v1[-(1:3)]
length(v1)
names(v1) = LETTERS[1:length(v1)]
v1
names(v1)
names(v1) = NULL
LETTERS
letters
rm(v1)

# matrix ########
m1 = matrix(c('A', 'F', 'G', 'D', 'C', 'B'), ncol=3, byrow=T)
m1
m2 = matrix(c(LETTERS, 1, 2,3, 4), ncol=5)
m2
nrow(m2)
ncol(m2)
colnames(m2)
colnames(m2) = c('1ë¶„ë‹¨', '2ë¶„ë‹¨', '3ë¶„ë‹¨', '4ë¶„ë‹¨', '5ë¶„ë‹¨')
rownames(m2) = 1:6
rownames(m2) = 1:nrow(m2)

m2[, c(1,3)]
m2[, '5ë¶„ë‹¨']

data1 = 1:30
rowcnt = 5
m3 = matrix(data1, ncol=length(data1)/rowcnt, byrow=T)
colcnt = 5
m3 = matrix(data1, nrow=length(data1)/colcnt, byrow=T)
m3
m2
colnames(m3) = LETTERS[1:5]
rbind(m2, m3)
cbind(m2, m3)

paste('A', 10, sep='')
paste0('A', 10)
m2

# Try This ########
# 1
blood_type = function(n=1) {
  bf = factor(n, levels=1:4, labels=c('A', 'B', 'O', 'AB'))
  as.vector(bf)
}
blood_type(2)

# 2
append = function(v, val) {
  v[length(v) + 1] = val
  v
}
v1 = 1:3
v1 = append(v1, 4)
v1

# 3
m = matrix(1:(10*20), ncol=20, byrow = T)
m
colnames(m) = LETTERS[1:ncol(m)]
rownames(m) = letters[1:nrow(m)]

paste('A', 'B', sep = '')
paste0('A', 'B')

colnames(m)[10] = paste0(colnames(m)[10], 10)
colnames(m)[20] = paste0(colnames(m)[20], 20)
colnames(m[, c(10,20)])


# data.frame ######
df1 = data.frame(column1=11:15, column2=LETTERS[1:5])
df1
class(df1)
str(m)
str(df1)
m
data
str(data)
class(data)

df2 = data[1:10, 1:6]
df3 = data[1:10, c(1:3, 7,8)]
df2
df3
cbind(df2, df3)

df100 = data[101:110, 1:6]
df100
rbind(df2, df100)

# list ######
lst1 = list(a=1:3, b=4:7)
lst1
lst1$a
str(lst1)
names(lst1)

lst3 = list(1:3, LETTERS[1:3], c(2.5, 4.5, 3.7, 'Q'))
lst3
names(lst3)
str(lst3)

unlist(lst3)

m1
as.data.frame(m1)
data$?ˆ˜?•™
tbl = table(data$?ˆ˜?•™)
tbl
as.data.frame(tbl)

factor(5, levels = 1:5)
as.factor(1:5)

# Try This - chap.4 #######
# 1
df2
df3
df4 = cbind(df2, df3[, 4:5])
df4

# 2
df4[, c(1:4, 7, 6, 8, 5)]
cn = colnames(df4)
cn
df4[, c(cn[1:4], 'ê³¼í•™', '?ˆ˜?•™', '?˜ˆì²?', '?˜?–´')]

# built-in dataset ######
data()
dr = data()$result
str(dr)
head(dr)
class(dr)
dr[, 'Item']

data("AirPassengers")
class(AirPassengers)
AirPassengers

data("trees")
trees
class(trees)
head(trees)
letters
LETTERS
month.name
month.abb
pi
letters = c('AA', 'BB', 'CC')
letters
rm(letters)
ls(pattern = 'Air')

# packages ######
install.packages('data.table')

library('data.table')

start = Sys.time()
#
read.csv('data/?„±? .csv')
#fread('data/?„±? .csv', encoding = 'UTF-8')
Sys.time() - start

head(data)

## read sep file #######
sepdata = read.delim('data/sep.txt', sep='#')
str(sepdata)
sepdata$name = as.character(sepdata$name)
View(head(sepdata))
summary(sepdata)

## read tsv ######
tsvdata = read.table("data/tcv.tsv", sep='\t', header = T, stringsAsFactors=F)
str(tsvdata)
summary(tsvdata)
View(tsvdata)

## read fwf ########
fwfdata = read.fwf('data/fwf.txt', header=F, width=c(8, 6, 5, 3, 4))
fwfdata
str(fwfdata)
summary(fwfdata)

## read excel file #########
install.packages('readxl')
library('readxl')
mtx = read_excel('data/meltop100.xlsx', sheet = 1, col_names =T)
mtx
colnames(mtx) = NULL

## Try This - read data file ######
# 1
nrow(mtx)
tail(mtx[-nrow(mtx), ])
mtx = mtx[-nrow(mtx), ]   # remove last row
tail(mtx)
mtx = mtx[, -(2:4)]
save(mtx, file = 'data/meltop_rm_last.rda')
str(mtx)
tail(mtx)
mtx$ê°€?ˆ˜
save(mtx, file = 'data/meltop100.rda')
rm(mtx)
load('data/meltop100.rda')

# 2
mtc = read.csv('data/mtc.csv')
summary(mtc)
tail(mtc)

# 3
temper = read.fwf('data/temper.txt', header=F, width=c(15, 4, 68, 5, 1))
temper  # V2, V4, V5
temper$V1 = NULL
temper$V3 = NULL
temper = temper[, c(2,4,5)]

## chap7. #########
data
boxplot(data$?ˆ˜?•™)
hist(data$?ˆ˜?•™)
data[data$?•™ë²? == 10337, ]

km = data[data$êµ??–´ > 90 & data$?ˆ˜?•™ > 90, ]
km
km[order(km$?ˆ˜?•™), ]
mean(data$?ˆ˜?•™)
sum(data$?ˆ˜?•™)
median(data$?ˆ˜?•™)

(data$êµ??–´ + data$?˜?–´ + data$?ˆ˜?•™) / 3
colnames(data)
data$ì´ì  = data[,4] + data[,5] + data[,6]
head(data)
data$ì´ì  = NULL

aggregate(data=data, ?ˆ˜?•™~ë°?, mean)
aggregate(data=data, cbind(êµ??–´,?˜?–´,?ˆ˜?•™)~ë°?, mean)

# install.packages('psych')
library('psych')
describe(data)
describe(data, IQR=T)
summary(data)
View(data)
data$avg = (data[,4] + data[,5])
head(data)
data$avg = NULL 
## Try This - Row Operator ######
# 1
data
km2 = data[data$ë°? == '?‚œ' & data$?„±ë³? == '?‚¨' & data$êµ??–´ > 90 & data$?ˆ˜?•™ > 90, ]
km2[order(-km2$êµ??–´),]

# 2
data$?‰ê·? = (data[, 4] + data[, 5] + data[, 6] + data[, 7] + data[, 8])/5
head(data)
aggregate(data=data[data$êµ??–´ >= 80,], cbind(êµ??–´, ?‰ê·?)~ë°?, mean)

# ifelse #########
data$pass = ifelse(data$?‰ê·? >= 60, TRUE, FALSE)
data[data$pass, ]

data$scout = ifelse(data$?‰ê·? >= 60, 
                    ifelse(data$?„±ë³? == '?‚¨', 'BoyScout', 'GirlScout'),
                    '')
head(data, 20)
library(ggplot2)

qplot(data$pass)

## Try This #######
# 1 - scout
qplot(data[data$scout != '',]$scout)

# 2
data$?•™?  = ifelse(data$?‰ê·? >= 90, 'A',
                 ifelse(data$?‰ê·? >= 80, 'B', 
                        ifelse(data$?‰ê·? >= 70, 'C',
                               ifelse(data$?‰ê·? >= 60, 'D', 'F'))))


head(data)

# 3 
qplot(data$?•™? )



## ggplot2::mpg #######
library(ggplot2)
mpg = as.data.frame(ggplot2::mpg)
summary(mpg)
colnames(mpg)
head(mpg)
mpg$fl
?mpg

library(ggplot2)
midwest = as.data.frame(ggplot2::midwest)
summary(midwest)
colnames(midwest)
head(midwest)
midwest
data
# 1
mpg$cthw = mpg$cty + mpg$hwy
head(mpg)
mpg[order(-mpg$cthw),]

# 2
x = aggregate(data=mpg, cthw~(year+fl), mean)
x[order(x$year), ]

# 3
midwest = as.data.frame(ggplot2::midwest)
midwest
summary(midwest)
library(psych)
describe(midwest)
describe(midwest[,4:27], na.rm = T)
colnames(midwest)
head(midwest)
aggregate(data=midwest, cbind(poptotal, popdensity, popasian)~state, mean)

# 4
colnames(midwest)
colnames(midwest)[5] = 'total'
colnames(midwest)[10] = 'asian'

# 5
ta = sum(midwest$asian)
midwest$asianpct = (midwest$asian / ta) * 100
sum(midwest$asianpct)
hist(midwest$asianpct)
library(ggplot2)
plot(midwest$asianpct)

# 6
midwest[order(midwest$asianpct),]
aggregate(data=midwest, asianpct~state, mean)
y = midwest[, c(2:3, 10,15,29)]
tt = y[order(-y$asianpct),]
head(tt)
tail(tt)
avg_a = mean(midwest$asianpct)
midwest$asianrate = ifelse(midwest$asianpct > avg_a, 'lg', 'sm')
head(midwest)
qplot(midwest$asianrate)

# rep & seq #######
seq(1,10, by=2)
rep(1, times=3)
rep(LETTERS[1:3], times=3)
rep(LETTERS[1:3], each=3)
rep(c('I', 'am'), each=2, length.out=7)

rep(c('ê¹€?¼?ˆ˜', 'ê¹€?´?ˆ˜'), each=2)

data.frame(customer=rep(c('ê¹€?¼?ˆ˜', 'ê¹€?´?ˆ˜'), each=2), 
           menu=rep(c('ì§œì¥', 'ì§¬ë½•'), times=2) )

1:10
-3:5
5.5:-4.5
seq(from=1, to=10, by=0.5)
seq(5.4, -8.5, length.out=10)

# runif & sample #########
runif(20) 
t = runif(n=30, min=10, max=20)
t
plot(t[order(t)])

set.seed(100); sample(1:5, size=3)
sample(1:5, size=3)

sample(1:50, size=30, replace = F)
data
data[sample(1:nrow(data), size=5),]

colnames(data)

data
print("aaaaaaaaaa")
cat(nrow(data), nrow(data[data$c1 == 'AA',]))
data$c1 = sample(c('AA', 'BB'), size=nrow(data), replace=T)
data$c1 = sample(c('AA', 'BB'), size=nrow(data), replace=T, prob = c(0.5,0.5))

set.seed(255)
smdt = data.frame(stuno = 1:5, 
                  Korean=sample(60:100, 5),
                  English=sample((5:10) * 10, 5),
                  Math=sample(50:100, 5))
smdt

## string #########
s = "abc,efg,abc"
nchar(s)
toupper(s)
substr(s, 1, 5)
x=strsplit(s, ',')
class(x)
sub('abc', 'ttt', s)
gsub('abc', 'ttt', s)
sub(pattern='abc/g', replacement='ttt', x=s)
sub(pattern='^abc/g', replacement='ttt', x=s)
s = "first\tsecond\nthird"
print(s)
cat(s)
paste0('aaa-bbb', 'ccc-ddd')
data[1:3, 'ë°?']
paste(data[1:3, 'ë°?'])
paste(data[1:3, 'ë°?'], collapse='**')

outer(month.abb, 2011:2020, paste, sep='-')
outer(LETTERS, 2010:2020, paste0)

grep(pattern='^2.+0$', x=data$?•™ë²?, value = T)
data$?•™ë²?

s = "aBc,efg,abc,"
gsub(pattern='[,]+a.+', replacement='ttt', x=s, ignore.case = T)
gsub(pattern='[,]+a(.*)', replacement='ttt', x=s, ignore.case = T)
gsub(pattern='[,]+[ae].*,', replacement='ttt', x=s, ignore.case = T)
s

Sys.time()
d1 = as.Date('2019-03-05 09:00')
class(d1)
d1
dt1 = as.POSIXct('2019-03-04 09:00')
class(dt1)
seq(dt1, as.POSIXct('2019-04-02'), by='day')
seq(dt1, as.POSIXct('2019-04-01'), by='2 hour')
seq(dt1, as.POSIXct('2019-04-01 23:59'), by='min')

install.packages('lubridate')
library(lubridate)
ymd('20190305')
mdy('03052019')
year(dt1)
day(dt1) = 15
dt1
days_in_month(1:12)
ddays(10)
duration(1000)
round(as.POSIXct('2019-03-05 18:39:45'), 'min') 
x = 5
f = function(n) {
  print(paste('x=', x, n))
}
f(x<-30)
x

for (i in 1:3) { print(i) }
switch(2, "111", "222", "333")
for (r in 1:nrow(data)) { print (data[r, 'scout']) }

while(i < 10) { print(i); i = i + 1 }

i = 0
while(TRUE) { 
  i = i + 1
  #print(i %% 2)
  if (i %% 2 == 0)
    next
  
  if (i > 10)
    break
  
  print(i)
}

x

#data = read.csv("?„±? .csv")
#options(encoding='UTF-8')
library(ggplot2)
mpg = as.data.frame(ggplot2::mpg)

t = c(5, 7, 2, 8, 20, 11, 19)
t[order(t)]
t[order(t, decreasing = T)]
smdt = data.frame(stuno = 1:5, 
                  Korean=sample(60:100, 5),
                  English=sample((5:10) * 10, 5),
                  Math=sample(50:100, 5))
smdt_new01[order(smdt_new01$avg, -smdt_new01$Korean),]
rev(t[order(t)])
sort(t)
sort(smdt$avg, decreasing=T)
t = c(1:5, NA, 7, NA, 9, 10)
m1 = m2 = m3 = matrix(c(1:3, NA, 9:3, NA, 1:3), nrow=3)
is.na(t)  
table(is.na(t))
t[is.na(t)]
mean(t)
mean(t, na.rm = T)
t = ifelse(is.na(t), 0, t)
m1[is.na(m1)] = 0  
m2[is.na(m2[,2]), 2] = 55 


##dplyr##
head(data)
library(dplyr)
dplyr::rename(data, ?ˆ˜?•™ = math)
dplyr::rename(data, êµ??–´ = kor)
library(ggplot2)
attach(data)
mean(êµ??–´)


detach(data)
with(data, mean(êµ??–´))
library(dplyr)
data = dplyr::rename(data,  math = ?ˆ˜?•™)
data %>% filter(group == 'Cì¡?')

data %>% filter(group == 'Cì¡?' & ?ˆ˜?•™ > 90)

data %>% filter(group %in% c('Aì¡?', 'Cì¡?'))


data %>% filter(math>95) %>% select(?•™ë²?, êµ??–´, ?˜?–´, math)
data %>%
  filter(math > 95) %>% 
  select(?•™ë²?, êµ??–´, ?˜?–´, math) %>%
  head
head(data)
data = dplyr::rename(data, art=?˜ˆì²?)
data = dplyr::rename(data, kor=êµ??–´, sci=ê³¼í•™, eng=?˜?–´, art=?˜ˆì²?)
data = dplyr::rename(data, stuno = ?•™ë²?, cls = ë°?, gen = ?„±ë³?)
data %>% arrange(math) %>% head
data %>% arrange(desc(math)) %>% head
data %>% arrange(math, kor,eng) %>% head
data = data %>% mutate(subTotal = kor + eng + math)
data = data %>%
  mutate(subTotal = kor + eng + math,
         subMean = round((kor + eng + math) / 3))
data %>%
  mutate(kor_eng = kor + eng) %>%
  arrange(desc(kor_eng)) %>%
  head
data %>% summarize(t = mean(math))
data %>% dplyr::summarize(t = mean(math))

data %>%
  group_by(cls) %>%
  summarise(mean_math = mean(math),
            sum_math = sum(math),
            medi_math = median(math),
            n_math = n()) %>%
  arrange(desc(mean_math))
sales = cbind( data.frame(no=1:12, year=2016:2019), 
                 matrix(round(runif(144), 3) * 100000, ncol=12, dimnames = list(NULL, month.abb)) )
left_join(sales, dfsum, by=c('year' = 'year'))
right_join(sales, dfsum, by=c('year' = 'year'))
inner_join(sales, dfsum, by=c('year' = 'year', 'no' = 'yno'))
semi_join(sales, dfsum, by=c('year' = 'year', 'no' = 'yno'))
fullanti_join(sales, dfsum, by=c('no' = 'yno'))
join(sales, dfsum, by=c('year' = 'year', 'no' = 'yno'))
anti_join(sales, dfsum, by=c('no' = 'yno'))
topsale4 = sales[1:4,] %>% select(year, Jan, Apr, Jul, Oct)
top4 = sales[5:8,] %>% 
  select(1:4, year, Jan, Apr, Jul, Oct) %>% 
  rename(yno=no, Q1=Jan, Q2=Apr, Q3=Jul, Q4=Oct)
bind_rows(dfsum, topsale4)
bind_rows(dfsum, top4)
bind_rows(dfsum, top4, .id = 'group')
bind_cols(dfsum, top4)
cbind(dfsum, top4)
bind_cols(dfsum, top4) %>% select(-year1, -yno1, -Feb)

prePar = par(col='red')



plot(smdt)
par(prePar)
plot(data$eng)


plot(x=1, y=1)
plot(x=1:10, y=1:10)
plot(sin, -pi, pi * 3)
plot(smdt$stuno, smdt$Korean)
plot(smdt$stuno, smdt$Korean, col='#0000FF')   # col='red'
colors()   

plot(x = smdt$stuno, y = smdt$Korean,
     col = '#0000FF',
     cex = 3,
     type = 'l',         # p, l, b, c, o, s
     xlim = c(-0.5, 5.5),
     ylim = c(50, 100),
     pch = 8,                         # > ?points
     xlab = '?•™ë²?', ylab = 'êµ??–´',
     main = 'ê·¸ë˜?”„ ??€?´??€')

# ë§‰ë?€ê·¸ë˜?”„

t = data %>% filter(eng > 90) %>% select('cls', 'gen') %>% table

barplot(t,
        beside = T,
        border = 'dark blue',
        density = 30,
        angle = 15 + 10*1:2,
        xlab = '?•™ê¸‰ë³„ ?„±ë³?', ylab = '?˜?–´',
        legend=rownames(t),
        col=heat.colors(4))


barplot(t,
        beside = T,
        horizon = T,
        border = 'dark blue',
        density = 30,
        las = 1,
        cex.name = 0.8,
        xlime = c(0, 13),
        main ='?˜?–´ ?„±? ?ƒ?œ„ê¶? ?•™?ƒ',
        angle = 15 + 10*1:2,
        xlab = '?•™ê¸‰ë³„ ?„±ë³?', ylab = '?˜?–´',
        legend=rownames(t),
        col=heat.colors(4))

boxplot(data$kor)
boxplot(kor~cls, data=data, col='lightblue')
boxplot(kor~gen, data=data, col='lightblue')

data


hist(data$kor, col="gray", labels=T, breaks=10)

curve(sin, -2 * pi, 3 * pi,
      xname='x', xlab = 'TT',
      n=200, type='p',
      xlim=c(-10,15), ylim=c(0,10))

      
d = data %>% filter(kor > 90) %>% select('cls')
pie(table(d))
pie(table(d), clockwise = T)
pie(table(d), clockwise = T, col=c('red', 'purple', 'green', 'cyan'))
      
#?‹œê°í™”
library(ggplot2)

ggplot(data =mpg, aes(x = displ, y = hwy)) + geom_point() + xlim(3,6) + ylim(10, 30)

ggplot(data = mpg, aes(x = cty, y = hwy)) + geom_point()

ggplot() + geom_point(data=smdt, aes(x=stuno, y=Korean))



ggplot() +
  geom_point(data=smdt,
             aes(x=stuno, y=Korean),
             color='blue', size = 5)
      

ggplot() +
  geom_point(data=smdt,
             aes(x=stuno, y=Korean,
             color='red', size = 5)

 d = data %>% filter(stuno >= 30000)
 ggplot(d, aes(cls, kor)) +
 geom_point(aes(color=cls, size=kor), 
              alpha=0.3)
 

 
             

ggplot(data=smdt) +
  geom_point(aes(x=stuno, y=Korean, 
                 color=stuno, size=stuno))

ggplot(d %>% filter(kor > 80), aes(cls,kor) ) + 
  geom_point(aes(color=cls, size=kor), alpha=0.3)

#line
d2 = mpg %>% group_by(manufacturer, displ) %>% 
  summarise(m1 = mean(cty), m2 = mean(hwy))



head(mpg)


d2
ggplot(d2, aes(x=displ)) + 
  geom_line(aes(y=m1, color='cty')) +
  geom_line(aes(y=m2, color='hwy'), size=1) +

 
  ggplot(mpg, aes(displ)) +
  geom_histogram(aes(fill=class), 
                 binwidth = .3,     # ?˜?Š”  bins = 5
                 col='black',       # line color
                 size=.1) +         # line size
  labs(title = 'Title', subtitle = 'Sub Title')



   
  
  ggplot(mpg, aes(manufacturer)) +
  geom_bar(aes(fill=class),
           width = 0.5) +
  theme(axis.text.x = element_text(angle=45,       # ê¸€?”¨?˜ ê¸°ìš¸ê¸?
                                   vjust=0.6)) +   # ê¸€?”¨?˜ ?•˜?‹¨ ë§ì¶¤(?„?š°ê¸?)
  scale_fill_discrete(name = "class") +      # legend
  labs(title = 'Title', subtitle = 'Sub Title')

  install.packages("dplyr")
  install.packages("magrittr")
  library(magrittr) # need to run every time you start R and want to use %>%
  library(dplyr)
  library(ggplot2)
  
  
  
  ggplot(mpg, aes(cty)) +
    geom_density(aes(fill=factor(cyl)), alpha=0.8) +
    labs(title="ë°€?„ê·¸ë˜?”„", subtitle = "?‹¤ë¦°ë”?ˆ˜?— ?”°ë¥? ?‹œ?‚´?—°ë¹„ì˜ ë°€?„ê·¸ë˜?”„",
         caption="Source: ggplot2::mpg",
         x = "?„?‹œ ?—°ë¹?",
         fill = "?‹¤ë¦°ë”?ˆ˜")
  
  
  install.packages('gridExtra')
  library(gridExtra)

  
  g3 = ggplot(mpg, aes(manufacturer)) +
    geom_bar(aes(fill=class),
             width = 0.7) +
    theme(axis.text.x = element_text(angle=45,
                                     vjust=0.6)) +
    labs(title = 'Title', subtitle = 'Sub Title')
  
  
  g4 = ggplot(mpg, aes(cty)) +
    geom_density(aes(fill=factor(cyl)), alpha=0.8) +
    labs(title="ë°€?„ê·¸ë˜?”„", subtitle = "?‹¤ë¦°ë”?ˆ˜?— ?”°ë¥? ?‹œ?‚´?—°ë¹„ì˜ ë°€?„ê·¸ë˜?”„",
         caption="Source: ggplot2::mpg",
         x = "?„?‹œ ?—°ë¹?",
         fill = "?‹¤ë¦°ë”?ˆ˜")
  
  
  
  g2 = ggplot(mpg, aes(manufacturer)) +
    geom_bar(aes(fill=class),
             width = 0.5) +
    theme(axis.text.x = element_text(angle=45,       # ê¸€?”¨?˜ ê¸°ìš¸ê¸?
                                     vjust=0.6)) +   # ê¸€?”¨?˜ ?•˜?‹¨ ë§ì¶¤(?„?š°ê¸?)
    scale_fill_discrete(name = "class") +      # legend
    labs(title = 'Title', subtitle = 'Sub Title')
  
  grid.arrange(g3, grid.arrange(g2, g4, ncol=2), ncol=1)
  
  
  # Try This : gglot2
  
  #1. mpg?°?´?„°?—?„œ ?—°?„ë³? ë°°ê¸°?Ÿ‰?— ?”°ë¥? ?†µ?•©?—°ë¹„ë??
  #êº½ì?€?„ ?œ¼ë¡? ê·¸ë¦¬?‹œ?˜¤.
  #(?‹¨, cty?Š” ?šŒ?ƒ‰, hwy?Š” ?ŒŒ??€?ƒ‰, 2008?…„??€ êµµì?€ ?„ ?œ¼ë¡? ?‘œ?˜„?•˜?‹œ?˜¤)
  library(ggplot2)
  
  ggplot(d2, aes(x=displ)) + 
    geom_line(aes(y=m1, color='cty')) + 
    geom_line(aes(y=m2, color='hwy'),
        size=1) +
    scale_colour_manual("", breaks = c("cty", "hwy"),
                        values = c("gray", "blue")) +
    xlab("xì¶?") +
    xlim(1, 8) +
    scale_y_continuous("yì¶?", limits = c(5, 45)) +
    labs(title = '??€?´??€', subtitle = '?„œë¸? ??€?´??€') 
  
  
  
  
  
  
  
  
  
  
  
  
  
  
  
  
  
  
  
  
  
  
  
  
  
  
  
  
  
  
  #4. midwest?°?´?„°?—?„œ ? „ì²´ì¸êµ¬ì?€  ?•„?‹œ?•„ê³? ?¸êµ¬ì˜ ê´€ê³„ë?? ?•Œ?•„ë³´ê¸° ?œ„?•œ  ê·¸ë˜?”„ë¥? ê·¸ë¦¬?‹œ?˜¤.
  #(?‹¨, ? „ì²´ì¸êµ¬ëŠ” 50ë§Œëª… ?´?•˜,    ?•„?‹œ?•„ê³„ì¸êµ¬ëŠ” 1ë§Œëª… ?´?•˜ë§? ?‘œ?‹œ?˜ê²? ?•˜?‹œ?˜¤.
  
  library(ggplot2)
  midwest = as.data.frame(ggplot2::midwest)
  ggplot(data = midwest, aes( x = poptotal, y = popasian )) +
    geom_point() +
    xlim(0, 500000) +
    ylim(0, 10000)
  
  ################perspective############################
  # outer(x, y, function(x,y) { ?€? })
   x = 1:5; y = 1:3
   z = outer(x, y, function(x,y) { x + y })   # dim(x) * dim(y)
  
 persp(x, y, z, theta = 30, phi = 30)
 
 
 
 # persp(x, y, z, theta=a, phi=a, col='..', expand=...)
  x = seq(-10, 10, length=30); y = x
  f = function(x, y) {
   r = sqrt(x^2 + y^2)
   return (10 * sin(r) / r)
 }

  
  
  z = outer(x, y, f)
  persp(x, y, z, theta = 45, phi = 30, expand = 0.5, col='lightblue',
          ltheta = 120, shade = 0.75, ticktype='detailed',
          xlab = 'X', ylab = 'Y', zlab = "Sinc(r)")
  
  ############## ?‹¨ê³? êµ¬ë¶„?„(ì§€?„?‹œê°í™”)####################
  
  head(USArrests)  
  str(USArrests)
  rownames(USArrests) 
  library(tibble) 
  chodata = rownames_to_column(USArrests, var = 'state')
  chodata$state = tolower(chodata$state)
  chodata = data.frame(state = tolower(rownames(USArrests)), USArrests)
  head(chodata)
  
  chodata = data.frame(state = tolower(rownames(USArrests)), USArrests)
  head(chodata)
  
  ##############?‹¨ê³„êµ¬ë¶„ë„##############
  library(ggplot2)
  library(maps)
  library(ggmap)
  us<- map_data("state")
  
  install.packages('ggiraphExtra')
  install.packages('maps')
  library(ggiraphExtra)
  
##############Choropleth - geom_map() ##########################
  

  
  usmap = map_data('state') 
  head(usmap)
  
  ggiraphExtra::ggChoropleth()   
   
  library(ggiraphExtra)
  library(tibble)
  library(ggplot2)
  head(usmap)
   
   
  install.packages('mapproj')
  install.packages('Rcpp')
  library('Rcpp') 
   
  ggChoropleth(data=chodata,
                aes(fill=Murder, map_id=state),
                map = usmap,
                title = '..',
                reverse = F,
                interactive = T)
   
############################ blue Choropleth - geom_map() #######################
install.packages('stringi')
library(stringi)
tooltips = stringi::stri_enc_toutf8(tooltips)

  
   
ggplot() + geom_map()

ggplot(chodata, aes(map_id = state)) + 
  geom_map(aes(fill = Murder), map = usmap) + 
  expand_limits(x = usmap$long, y = usmap$lat) +
  labs(title="USA Murder", fill = 'murder') +
scale_fill_gradient2('murder', low="blue", mid="green", high="red")




tooltips = paste0(
  sprintf("<p><strong>%s</strong></p>", as.character(chodata$state)),
  '<table>',
  '  <tr>',
  '    <td>pop(10000)</td>',
  sprintf('<td>%.0f</td>', chodata$UrbanPop * 10),
  '  </tr>',
  '  <tr>',
  '    <td>murder</td>',
  sprintf('<td>%.0f</td>', chodata$Murder),
  '  </tr>',
  '  <tr>',
  '    <td>violence</td>',
  sprintf('<td>%.0f</td>', chodata$Assault),
  '  </tr>',
  '</table>' )

chodata
save(chodata, file='data/chodata.rda')


onclick = sprintf("alert(\"%s\")", as.character(chodata$state))

install.packages("ggiraph")
# ggplot() + geom_map_interactive(tooltip=.., onclick=..) 
ggiraph()
girafe()

library(ggiraph)

ggplot(chodata, aes(data = Murder, map_id = state)) +
geom_map_interactive( 
  aes(fill = Murder,
      data_id = state,
      tooltip = tooltips,
      onclick = onclick), 
  map = usmap) +
expand_limits(x = usmap$long, y = usmap$lat) +
scale_fill_gradient2('Murder', low='red', high = "blue", mid = "green") +
labs(title="USA Murder") -> gg_map
ggiraph(code = print(gg_map))
girafe(ggobj = gg_map)

##########################################################################
install.packages('stringi')
library(stringi)
tooltips = stringi::stri_enc_toutf8(tooltips)

tooltips = paste0(
  sprintf("<p><strong>%s</strong></p>", as.character(chodata$state)),
  '<table>',
  '  <tr>',
  '    <td>?¸êµ?</td>',
  sprintf('<td>%.0f</td>', chodata$UrbanPop * 10),
  '  </tr>',
  '  <tr>',
  '    <td>?‚´?¸</td>',
  sprintf('<td>%.0f</td>', chodata$Murder),
  '  </tr>',
  '  <tr>',
  '    <td>?­? ¥</td>',
  sprintf('<td>%.0f</td>', chodata$Assault),
  '  </tr>',
  '</table>' )
tooltips1 = stringi::stri_enc_toutf8(tooltips)



onclick = sprintf("alert(\"%s\")", as.character(chodata$state))

ggplot(chodata, aes(data = Murder, map_id = state)) +
  geom_map_interactive(
    aes(fill = Murder,
        data_id = state,
        tooltip = tooltips1,
        onclick = onclick),
    map = usmap) +
  expand_limits(x = usmap$long, y = usmap$lat) +
  scale_fill_gradient2('murder', low='red', high = "blue", mid = "green") +
  labs(title="USA Murder") -> gg_map


ggiraph(code = print(gg_map))
girafe(ggobj = gg_map)

Sys.getlocale()

install.packages('stringi')

install.packages("ggiraph")
library(ggiraph)
library(ggplot2)
library(maps)

#############################?š°ë¦¬ë‚˜?¼  ?‹¨ê³? êµ¬ë¶„?„ - kormaps###########################

# ì§€?„?°?´?„°: kormap2014 (GitHub)
# install ref: stringi, devtools

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
install.packages('glue')
library(glue)



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

# kdata = kormaps2014::changeCode(korpop1)
kdata = kdata %>% rename(pop = ì´ì¸êµ?_ëª?)
kdata = kdata %>% rename(area = ?–‰? •êµ¬ì—­ë³?_?ë©´ë™)

kdata$area = stringi::stri_enc_toutf8(kdata$area)
save(kdata, file = 'data/kdata.rad')



ggChoropleth(data=kdata, 
             aes(fill = pop, 
                 map_id = code, 
                 tooltip = area),
             map = kormap1,
             interactive = T)


ggplot(kdata, aes(data = pop, map_id = code)) +
  geom_map( aes(fill = pop), map = kormap1) + 
  expand_limits(x = kormap1$long, y = kormap1$lat) +
  scale_fill_gradient2('?¸êµ?', low='darkblue') +
  xlab('ê²½ë„') + ylab('?œ„?„') + 
  labs(title="?‹œ?„ë³? ?¸êµ?")


load('data/data_eng.rda')

################  Interactive Graph - plotly  ########################



load('data/data_eng.rda')
install.packages('plotly')
library(plotly)

t = ggplot(data, aes(eng, kor)) +
   geom_point(aes(color=eng, size=kor), alpha=0.3)

ggplotly(t)


################  Interactive Time Series - dygraphs ######################

install.packages('dygraphs')
library(dygraphs)
# dataë¥? ?‹œê°? ?ˆœ?„œ(Time Series)ë¡? ë³€ê²½í•˜ê¸?
library(xts)     # R ?‚´?¥ ?•¨?ˆ˜
economics
head(economics)
ue = xts(economics$unemploy, order.by = economics$date)
head(ue)
dygraph(ue)
dygraph(ue) %>% dyRangeSelector()


# ?—¬?Ÿ¬ ê°? ?‘œ?˜„?•˜ê¸? (?‹¤?—…??ˆ˜ + ??€ì¶•ë¥ )
psave = xts(economics$psavert, order.by = economics$date)
dygraph(cbind(ue, psave))
ue2 = xts(economics$unemploy / 1000, order.by = economics$date)
pu = cbind(ue2, psave)

colnames(pu) = c('unemploy', 'saverate')
dygraph(pu) %>% dyRangeSelector()


################ Try This : choropleth ##################

kormaps2014::tbc

######################  Text Mining Database SQL  ?™œ?š©  #####################
install.packages('sqldf')
library(sqldf)

data = read.csv('?„±? .csv')
load('data/data.rda')
data 
sqldf("select stuno, kor from data where kor < 50 limit 10")
sqldf("select * from data where stuno = '20439'")
sqldf("select kor, count(*) cnt from data where kor < 30 group by kor order by cnt")
sqldf("select cls, (case when cls = 'êµ?' then '?š°ë¦¬ë°˜' else '?‚¨?˜ë°?' end) aa, 
					count(*) cnt from data where kor < 50 group by cls")
sqldf("select cls, avg(kor) from data group by cls")
sqldf("select * from data inner join data2 on data.stuno = data2.stuno")
sqldf("select b.stuno, a.kor from data a inner join data2 b on a.stuno = b.stuno")


#install.packages('RJDBC') 
#library(RJDBC)

install.packages('RMySQL')
library(RMySQL)
drv = dbDriver("MySQL")
conn = dbConnect(drv, host='127.0.0.1', port=3306, dbname='dadb', user='dooo', password='1234')
dbSendQuery(conn, 'set character set "utf8"')
options(encoding = 'UTF-8')

dbListTables(conn) 
library(kormaps2014)
d=dbGetQuery(conn, "select * from Song limit 5")
changeCode(d)
changeCode(data)
data

dbGetQuery(conn, ?€œSHOW VARIABLES LIKE ?€˜character_set_%?€?;?€?)

dbDisconnect(conn)


################### Text Mining  ##############################


install.packages('tm')
library(tm)

getSources()
getReaders()

folder = system.file("texts", "txt", package="tm")
txtSource = DirSource(folder)   # dir ê²½ë¡œë¡? Corpus ?ƒ?„±
class(txtSource); str(txtSource)   
doc = VCorpus(txtSource, readerControl = list(language='lat'))
class(doc); summary(doc)

meta(doc)
meta(doc, type = 'local')
inspect(doc)
inspect(doc[1])
doc[[1]]
doc[[1]][[1]]


writeCorpus(doc, path="data", filenames = names(doc))
writeCorpus(doc[1], path="data", filenames = "corpus_doc.txt")


############################  Corpus  ? „ì²˜ë¦¬ (tm_map)  #############################
tm_map(doc, FUN, ..)
getTransformations()
doc = tm_map(doc, stripWhitespace)

# example: crude(?›?œ  ê´€? ¨ ë¬¸ì„œ)
data("crude")
crude[[1]]
crude[[1]][1]      # ë¬¸ì„œ ?‚´?š©

crude = tm_map(crude, stripWhitespace)
crude = tm_map(crude, content_transformer(tolower))
crude = tm_map(crude, removePunctuation)
crude = tm_map(crude, removeWords, stopwords("english"))
crude = tm_map(crude, stripWhitespace)      # ?•œë²? ?”! (ìµœì¢… ? •ë¦?) 
crude = tm_map(crude, stemDocument, language="english")



# ì°¸ê³  (?Š¹? • ?‹¨?–´ ? œê±?)
crude = tm_map(crude, removeWords, c("xxx", "yyy"))

install.packages("SnowballC")


#########################  ë¶„ì„?š©  Term & Document Matrix   #########################

# ë¶„ì„?š© Matrix ?ƒ?„± (TermDocumentMatrix & DocumentTermMatrix)
tdm = TermDocumentMatrix(crude)   # ?‹¨?–´(?–‰) * ë¬¸ì„œ(?—´)
tdm  
view(tdm)
rownames(tdm)      # ?‹¨?–´ ëª©ë¡
tail(as.matrix(tdm))        # cf. head(tdm)
head(as.matrix(tdm))

tdm['year',]                # cf. tdm['the',]
View(as.matrix(tdm))        # cf. View(tdm)
dimnames(tdm)               # cf. tdm$dimnames
tdm$i                       # ?‹¨?–´ index
tdm$j                       # ë¬¸ì„œ index
tdm$v                       # ë¬¸ì„œ?—?„œ ?‹¨?–´?˜ ë¹ˆë„(?‹¨?–´ê°€ ?ˆ?Š” entryë³? ?‹¨?–´ ?‚¬?š© ?ˆ˜) 

tdm = removeSparseTerms(tdm, 0.8)  # ?¬?†Œ?„±(?¬?‚¬?š©?•ˆ?¨)?´ 80% ?´?ƒ?¸ ?‹¨?–´ ? œê±?
tdm; rownames(tdm)
dtm = t(tdm)                # ? „ì¹˜í–‰? ¬(Transpose)
inspect(tdm)                # ?‹¨?–´?˜ ë¬¸ì„œë³? ?‚¬?š© ?ˆ˜
inspect(tdm[1:5, 1:10])     # ì²? 5ê°? ?‹¨?–´ 10ê°? ë¬¸ì„œ (?•œë²ˆì— ìµœë?€ 10ê°œê¹Œì§€ ê°€?Š¥)

######################  ë¹ˆë„ ë¶„ì„  ##################################################

# findFreqTerms()  & findAssocs()
findFreqTerms(tdm, 20)   # 20?šŒ ?´?ƒ ?‚¬?š©?œ ?‹¨?–´
findFreqTerms(tdm, 20, 30)    # 20 ~ 30 ?šŒ ?‚¬?š©?œ ?‹¨?–´ 
findFreqTerms(tdm, 0, 10)     # 10?šŒ ?´?•˜ ?‚¬?š© ?‹¨?–´
findAssocs(tdm, "last", 0.5)       # `last`??€ ?—°ê´€?„±(ê°™ì´ ?‚¬?š©) 50% ?´?ƒ
findAssocs(tdm, "oil", .7)         # `oil`ê³? ?—°ê´€?„±(?•¨ê»? ?‚¬?š©) 70% ?´?ƒ

# rowSums(matrix)  ?‹¨?–´ë³? ë¹ˆë„?ˆ˜ ê³„ì‚°
rowSums(as.matrix(tdm))     
wFreq = sort(rowSums(as.matrix(tdm)), decreasing = T)     # ë¹ˆë„?ˆ˜ ?†’??€ ?ˆœ
names(wFreq)
wFreq > 10


# subset() ?Š¹? • ì¡°ê±´?œ¼ë¡? ?˜?¼?‚´ê¸?
wFreq = subset(wFreq, wFreq > 10)   # ë¹ˆë„?ˆ˜ 10?šŒ ì´ˆê³¼ ?‹¨?–´?“¤ë§?!
wFreq

###########################  Word Cloud ###########################################

# RColorBrewer - ?Œ”? ˆ?Š¸
install.packages('RColorBrewer')  
library(RColorBrewer)
display.brewer.all()            # brewer ? „ì²? ?ƒ‰?ƒ
brewer.pal.info                 # brewer palette ? •ë³?
pa = brewer.pal(8, 'Blues')     # Blues Theme?—?„œ 8ê°€ì§€ ?ƒ‰?ƒ ?„ ?ƒ
pa
darks = brewer.pal(8, 'Dark2')  # Favorite Palette
darks


# wordcloud - ?›Œ?“œ ?´?¼?š°?“œ
install.packages("wordcloud")     
library(wordcloud)
set.seed(100);
wordcloud(words = names(wFreq), freq=wFreq, min.freq = 10,
            random.order = F, colors = darks)
#################################   Try This: wordcloud #################################

wordcloud(words = names(wFreq), freq=wFreq, min.freq = 10,
          random.order = F, colors = darks)
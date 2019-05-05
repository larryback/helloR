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
colnames(m2) = c('1분단', '2분단', '3분단', '4분단', '5분단')
rownames(m2) = 1:6
rownames(m2) = 1:nrow(m2)

m2[, c(1,3)]
m2[, '5분단']

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
data$수학
tbl = table(data$수학)
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
df4[, c(cn[1:4], '과학', '수학', '예체', '영어')]

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
read.csv('data/성적.csv')
fread('data/성적.csv', encoding = 'UTF-8')
#Sys.time() - start

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
mtx$가수
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
boxplot(data$수학)
hist(data$수학)
data[data$학번 == 10337, ]

km = data[data$국어 > 90 & data$수학 > 90, ]
km
km[order(km$수학), ]
mean(data$수학)
sum(data$수학)
median(data$수학)

(data$국어 + data$영어 + data$수학) / 3
colnames(data)
data$총점 = data[,4] + data[,5] + data[,6]
head(data)
data$총점 = NULL

aggregate(data=data, 수학~반, mean)
aggregate(data=data, cbind(국어,영어,수학)~반, mean)

install.packages('psych')
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
km2 = data[data$반 == '난' & data$성별 == '남' & data$국어 > 90 & data$수학 > 90, ]
km2[order(-km2$국어),]

# 2
data$평균 = (data[, 4] + data[, 5] + data[, 6] + data[, 7] + data[, 8])/5
head(data)
aggregate(data=data[data$국어 >= 80,], cbind(국어, 평균)~반, mean)

# ifelse #########
data$pass = ifelse(data$평균 >= 60, TRUE, FALSE)
data[data$pass, ]

data$scout = ifelse(data$평균 >= 60, 
                    ifelse(data$성별 == '남', 'BoyScout', 'GirlScout'),
intall.packages("ggplot2")                    '')
head(data, 20)
library(ggplot2)

qplot(data$pass)

## Try This #######
# 1 - scout
qplot(data[data$scout != '',]$scout)

# 2
data$학점 = ifelse(data$평균 >= 90, 'A',
                 ifelse(data$평균 >= 80, 'B', 
                        ifelse(data$평균 >= 70, 'C',
                               ifelse(data$평균 >= 60, 'D', 'F'))))


head(data)

# 3 
qplot(data$학점)



## ggplot2::mpg #######
library(ggplot2)
mpg = as.data.frame(ggplot2::mpg)
summary(mpg)
colnames(mpg)
head(mpg)
mpg$fl
?mpg

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

rep(c('김일수', '김이수'), each=2)

data.frame(customer=rep(c('김일수', '김이수'), each=2), 
           menu=rep(c('짜장', '짬뽕'), times=2) )

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
data[1:3, '반']
paste(data[1:3, '반'])
paste(data[1:3, '반'], collapse='**')

outer(month.abb, 2011:2020, paste, sep='-')
outer(LETTERS, 2010:2020, paste0)

grep(pattern='^2.+0$', x=data$학번, value = T)
data$학번

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
5+5 -> x
f = function(n) {
  print(paste('x=', x, ', n=', n))
}
#f(n = 30)  vs f(n <- 30)
x=10
f2 = function(n) {
  #x = n
  x <<- n
  print(paste('x=', x, ', n=', n))
}
f2(50)
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

# apply ######
apply(smdt[, 2:4], MARGIN = 2, FUN = mean)
smdt

apply(smdt[, 2:4], MARGIN = 2, FUN = quantile)

l = lapply(smdt[, 2:4], FUN = mean)
l
unlist(l)

sapply(smdt[, 2:4], FUN = mean, simplify = T)
apply(smdt[, 2:4], MARGIN = 2, FUN = mean)

vapply(smdt[, 2:4], FUN = mean, FUN.VALUE = 10)
smdt

install.packages('reshape2')
library('reshape2')
dim(data)
data.frame(no=1:4, year=2016:2019)
list(1:4, paste0('Q', 1:4))
matrix(round(runif(16), 3) * 1000, ncol=4, dimnames = list(NULL, paste0('Q', 1:4)))

dfsum = cbind( data.frame(no=1:4, year=2016:2019), 
               matrix(round(runif(16), 3) * 1000, ncol=4, dimnames = list(NULL, paste0('Q', 1:4))) )
dfsum
melt(data=dfsum[,2:6], id.vars = "year")
meltsum = melt(dfsum[,2:6], id.vars = "year", variable.name = 'Sales')
meltsum

dcast(meltsum, Sales~year, value.var="value")
dfsum

smdt[order(smdt$Korean),]


### Try This - PF ############
# 1
data = read.csv('data/성적.csv')
data
sample(c(rep('A조', 160), rep('B조', 160), rep('C조', 160))) -> data$group
head(data, 100)

# 2
# fibonacci.R 참조

# 3
set.seed(255)
smdt = data.frame(stuno = 1:5, 
                  Korean=sample(60:100, 5),
                  English=sample((5:10) * 10, 5),
                  Math=sample(50:100, 5))
smdt
class(smdt$Korean)
class(smdt$Math)
smdt[nrow(smdt) + 1, ] = c('계', sapply(smdt[, 2:4], FUN = mean, simplify = T))

smdt$Korean = as.integer(smdt$Korean)
smdt[, 2:4] = as.integer(smdt[, 2:4])
for (i in 2:4) {
  smdt[, i] = as.integer(smdt[, i])
}
class(smdt[, 2:4])

smdt$total = apply(smdt[, 2:4], MARGIN = 1, FUN = sum)
smdt$avg = apply(smdt[, 2:4], MARGIN = 1, FUN = mean)
smdt
smdt$avg = round(smdt$avg)
matrix(round(runif(48), 3) * 100000, ncol=12, 
       dimnames = list(NULL, month.abb))
sales = cbind( data.frame(no=1:4, year=2016:2019), 
               matrix(round(runif(48), 3) * 100000, ncol=12, 
                      dimnames = list(NULL, month.abb)) )
sales
melt(data=sales[,2:ncol(sales)], id.vars = "year", variable.name = 'month', value.name = 'saleamt')


######## order, sort ###############
smdt[order(smdt$avg, -smdt$Korean),]
t = c(5, 7, 2, 8, 20, 11, 19)
t[order(t)]
rev(t)
sort(t)

#### missing values #########
t = c(1:5, NA, 7, NA, 9, 10)
mean(t, na.rm = T)
t[!is.na(t)]
mean(t[!is.na(t)])
table(data$반)
is.na(t)
table(is.na(t))
t[is.na(t)]
t = ifelse(is.na(t), 0, t)
t

m1 = m2 = m3 = matrix(c(1:3, NA, 9:3, NA, 1:3), nrow=3)
m1
m1[is.na(m1)] = 0 
m2
m2[is.na(m2[,2]), 2] = 5555

dataArray = array(1:24, dim=c(3, 4, 2)) 
dataArray
dim(dataArray)

dimnames(dataArray)
dimnames(dataArray) = list( 1:3, c('c1', 'c2', 'c3', 'c4'), c('x','y'))

ad1 = dataArray[,,1]
ad1
attr(dataArray, "dim") = c(3,8)
dataArray

#### dplyr #######
smdt
data = read.csv('data/성적.csv')
head(data)
library(dplyr)
library(ggplot2)
data = dplyr::rename(data, math=수학)
a.b = 123

attach(data)
data$국어 + data$수학
mean(국어)
sum(math)
detach(data)

with(data, mean(math))

data[data$group == 'C조',]
data %>% filter(group == 'C조') 
data %>% filter(group %in% c('A조', 'C조'))
data %>%
  filter(group == 'C조') %>%
  select(-반, -영어) %>% head

d1 = data
d1 = rename(d1, math=)
head(d1)
mean(d1$math)
d1 = rename(d1, kor=math)

select(data, math)
plot(data$math)

data = dplyr::rename(data, math=수학)
data = dplyr::rename(data, kor=국어, sci=과학, eng=영어, art=예체)
data = dplyr::rename(data, stuno=학번, cls=반, gen=성별)
head(data)

data %>% arrange(desc(math)) %>% head
data %>% arrange(math, desc(eng)) %>% head

data %>% mutate(subTotal = kor + eng + math) %>% head
data

data %>%
  mutate(kor_eng = kor + eng) %>%
  arrange(desc(kor_eng)) %>%
  head

x = data %>% summarize(t = mean(math))
class(x)
class(mean(data$math))

?summarise

data %>% group_by(cls) %>% summarise(m = mean(math))
data %>% head

data %>% 
  group_by(cls, gen) %>%
  summarise(mean_math = mean(math),
            sum_math = sum(math),
            medi_math = median(math),
            n_math = n()) %>%
  arrange(cls, gen, desc(mean_math))


data %>% 
  group_by(cls, gen) %>%
  summarise(mean_math = mean(math),
            sum_math = sum(math),
            medi_math = median(math),
            n_math = n()) %>%
  group_by(gen) %>%
  summarise(mean_gen = mean(mean_math)) %>%
  arrange(gen, desc(mean_gen))

### join ########
dfsum = cbind( data.frame(yno=1:4, year=2016:2019), 
               matrix(round(runif(16), 3) * 1000, ncol=4, dimnames = list(NULL, paste0('Q', 1:4))))
dfsum
sales = cbind( data.frame(no=1:12, year=2016:2019), 
               matrix(round(runif(144), 3) * 100000, ncol=12, dimnames = list(NULL, month.abb)) )
sales

left_join(sales, dfsum, by=c('year' = 'year'))
right_join(sales, dfsum, by=c('year' = 'year'))

inner_join(sales, dfsum, by=c('year' = 'year', 'no' = 'yno'))
semi_join(sales, dfsum, by=c('year' = 'year', 'no' = 'yno'))
full_join(sales, dfsum, by=c('year' = 'year', 'no' = 'yno'))
anti_join(sales, dfsum, by=c('no' = 'yno'))

topsale4 = sales[1:4,] %>% select(year, Jan, Apr, Jul, Oct)
top4 = sales[5:8,] %>% 
  select(1:4, year, Jan, Apr, Jul, Oct) %>% 
  rename(yno=no, Q1=Jan, Q2=Apr, Q3=Jul, Q4=Oct)

topsale4
top4
dfsum
bind_rows(dfsum, topsale4)
bind_rows(dfsum, top4)
bind_rows(dfsum, top4, .id = 'group')

bind_cols(dfsum, top4)
cbind(dfsum, top4)
bind_cols(dfsum, top4) %>% select(-year1, -yno1, -Feb)


###### Try This : dplyr #############
# 1

mpg = as.data.frame(ggplot2::mpg)
mpg
mpg %>% filter(class %in% c('suv', 'compact')) %>%
  select(model, cty, hwy) %>% head

# 2 
mpg %>% arrange(desc(hwy)) %>% head(5)

# 3
mpg %>%
  filter(class == 'suv') %>%
  group_by(manufacturer) %>%
  summarise(m = mean( (cty + hwy) / 2)) %>%
  arrange(desc(m)) %>%
  head(5)

# 4
t = table(mpg$fl)
n = names(t)
n
dput(n)


flpr = data.frame(fl = c("c", "d", "e", "p", "r"),
                  price = c(1.33, 1.02, 0.92, 1.99, 1.22), stringsAsFactors = F )
flpr
class(mpg$fl)

mpg = inner_join(mpg, flpr, by=c('fl', 'fl')) %>% rename(fl_price = price) %>% head
mpg


data
smdt
prePar = par(col='red')
plot(smdt)
par(prePar)
plot(data$eng, main='영어성적')

theme_set(theme_gray(base_family="AppleGothic"))
par(family = "AppleGothic")

plot(x=1, y=1)
plot(x=1:10, y=1:10)
plot(sin, -pi, pi * 3)
sin(30)
plot(smdt$stuno, smdt$Korean)
plot(smdt$stuno, smdt$Korean, col='lightblue') 

colors() 
?points

plot(x = smdt$stuno, y = smdt$Korean,
     col = '#0000FF',
     cex = 2,
     las = 1,
     type = 'p',         # p, l, b, c, o, s
     xlim = c(-0.5, 5.5),
     ylim = c(0, 100),
     pch = 13,                         # > ?points
     xlab = '학번', ylab = '국어',
     main = '그래프 타이틀')

xl = c(-0.5, 8.5); yl = c(0, 100)
plot(x = smdt$stuno, y = smdt$Korean,
     col='#0000FF', cex=3, pch = 8,
     xlim = xl, ylim = yl,
     xlab = '학번', ylab = '국어, 수학',
     main = '우리반 국어 / 수학 성적')
par(new = T)
plot(x = smdt$stuno, y = smdt$Math,
     col='#ff0000', cex=3, pch = 21,
     xlim = xl, ylim = yl,
     xlab = '', ylab = '')

l=legend('center',
       legend=c('국어', '수학'),
       pch=c(8, 21), col=c('blue', 'green'), bg='gray')


head(data)
t = data %>% filter(eng > 90) %>% select('cls') %>% table
t = data %>% filter(eng > 90) %>% select('cls', 'gen') %>% table
t
barplot(t,
        beside = T,
        horiz = T,
        border = 'dark blue',
        density = 50,
        las = 1, 
        cex.names = 0.8,
        xlim = c(0, 13),
        main='영어성적 상위권 학생',
        angle = 15 + 10*1:2,
        xlab = '학급별 성별', ylab = '영어',
        legend=rownames(t),
        col=heat.colors(5))

boxplot(data$kor)
boxplot(kor~cls, data=data, col='lightblue')
boxplot(kor~gen, data=data, col='lightblue')

hist(data$kor, col="gray", labels=T, breaks=10)

curve(tan, -2 * pi, 3 * pi,
      xname='국어', xlab = 'TT',
      n=200, type='p')


d = data %>% filter(kor > 90) %>% select('cls')
d
table(d)
pie(table(d))
pie(table(d), clockwise = T)
pie(table(d), clockwise = T, col=c('red', 'purple', 'green', 'cyan'))

save(data, file='data/data_eng.rda')
data


## ggplot2 ############
smdt

ggplot() + geom_line(data=smdt, aes(x=stuno, y=Korean))
smdt
ggplot() + geom_point(data=smdt, aes(x=stuno, y=Korean))

ggplot(data=smdt) +
  geom_point(aes(x=stuno, y=Korean),
             color='blue', size = 5)

ggplot(data=smdt) +
  geom_point(aes(x=stuno, y=Korean, color=stuno),
             size = 5)

ggplot(data=smdt) +
  geom_point(aes(x=stuno, y=Korean, 
                 color=stuno, size=stuno))

data
d = data %>% filter(stuno >= 30000)
d
ggplot(d %>% filter(kor > 80), aes(cls, kor)) +
  geom_point(aes(color=cls, size=kor), 
             alpha=0.3)

ggplot(mpg, aes(cty, hwy)) + geom_point() + xlim(20,25)

## line ######
mpg = as.data.frame(ggplot2::mpg)
head(mpg)
nrow(mpg)
d2 = mpg %>%
  group_by(manufacturer, displ) %>% 
  summarise(m1 = mean(cty), m2 = mean(hwy))
d2
ggplot(d2, aes(x=displ)) + 
  geom_line(aes(y=m1, color='cty')) + 
  geom_line(aes(y=m2, color='hwy'), size=1) +
  scale_colour_manual("", breaks = c("cty", "hwy"),
                      values = c("red", "blue")) +
  xlab("x축") +
  xlim(1, 8) +
  scale_y_continuous("y축", limits = c(5, 45)) +
  labs(title = '타이틀', subtitle = '서브 타이틀') 


ggplot(mpg, aes(displ)) +
  geom_histogram(aes(fill=class), 
                 # binwidth = .3,
                 bins = 5,
                 col='black',       # line color
                 size=.1) +         # line size
  labs(title = 'Title', subtitle = 'Sub Title', fill='등급')


ggplot(mpg, aes(manufacturer)) +
  geom_bar(aes(fill=class),
           width = 0.9) +
  theme(axis.text.x = element_text(angle=85,  
                                   vjust=0.6)) +  
  scale_fill_discrete(name = "class") + 
  labs(title = 'Title', subtitle = 'Sub Title')


ggplot(mpg, aes(cty)) +
  geom_density(aes(fill=factor(cyl)), alpha=0.9) +
  labs(title="밀도그래프", subtitle = "실린더수에 따른 시내연비의 밀도그래프",
       caption="Source: ggplot2::mpg",
       x = "도시 연비",
       fill = "실린더수")

midwest

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
  labs(title="밀도그래프", subtitle = "실린더수에 따른 시내연비의 밀도그래프",
       caption="Source: ggplot2::mpg",
       x = "도시 연비",
       fill = "실린더수")

g3
grid.arrange(g3, grid.arrange(g2, g4, ncol=2), ncol=1)

###########################  도수(돗수)   vs   상대도수  ##################################
#load data
options(encoding = 'UTF-8')
load('data/data02.rda')
data
colnames(c('stuno', 'cls', 'gen', 'kor', 'eng', 'math', 'sci', 'art'))

# 도수(돗수): 거듭되는 횟수, 상대도수 = (그 계급의 도수) / (도수의 합)
table(data$cls)
n.gen = table(data$gen)       # 도수
p.gen = prop.table(n.gen)     # 상대도수
# cf. 분할표
rt.gen = rbind(n.gen, p.gen)
ct.gen = cbind(n.gen, p.gen)
colnames(ct.gen) = c('도수', '상대도수')
ct.gen = addmargins(ct.gen, margin = 1)  # 1: 마지막 행에만 Sum 추가 (즉, 라인별 sum은 제외)
t.gen_cls = table(data$gen, data$cls)
p.gen_cls = prop.table(t.gen_cls)
barplot(p.gen, main='성별', xlab="gender", ylab='%', 
          col=c("red", "blue"), ylim=c(0, 0.7), legend = rownames(p.gen))
barplot(p.gen_cls, main='성별', xlab="gender", ylab='%', col=c("green", "blue"), 
          ylim=c(0, 0.2), legend = rownames(p.gen_cls), beside = T)

#######################  평균, 중앙값, 최빈값  #################################################

# 산술 평균
- 모집단 평균(ᘈ)
- 표본 평균(  )
mean(data$kor)
mean(data[data$cls == '매', ]$kor)
# 중앙값(Median)
- 자료를 크기순으로 나열했을 때 가장 가운데 오는 값
- 홀수개 = 가운데, 짝수개 = 가운데2개 / 2
median(data$kor)
# 최빈값(Mode)
- 자료중 발생빈도가 가장 높은 값
- 질적 자료에 대한 대표값, 쉽게 구할 수 있지만 유일하지 않을 수 있다.

library(dplyr)    # alternative, this also loads %>%

data %>% filter(cls == '매') %>% select(kor) %>% summarise(m = mean(kor), n = n())

############################  평균, 중앙값, 최빈값   ############################################
#install.packages("magrittr") # only needed the first time you use it
#install.packages("dplyr")    # alternative installation of the %>%
library(magrittr) # need to run every time you start R and want to use %>%
library(dplyr)    # alternative, this also loads %>%


# 산술 평균
- 모집단 평균(ᘈ)
- 표본 평균(  )
mean(data$kor)
mean(data[data$cls == '매', ]$kor)
# 중앙값(Median)
- 자료를 크기순으로 나열했을 때 가장 가운데 오는 값
- 홀수개 = 가운데, 짝수개 = 가운데2개 / 2
median(data$kor)
# 최빈값(Mode)
- 자료중 발생빈도가 가장 높은 값
- 질적 자료에 대한 대표값, 쉽게 구할 수 있지만 유일하지 않을 수 있다.
data %>% group_by(cls) %>% summarise(m = mean(kor), n = n())
data %>% filter(cls == '매') %>% select(kor) %>% summarise(m = mean(kor), n = n())


############################### 가중(Weighted) 평균  ###################################

# 각 항의 수치에 중요도(영향도, 가중치)에 비례하는 계수를 곱한 다음 산출한 평균
# 확률을 수반하는 평균
# 들어온 데이터에 비중을 두어 계산해야 할 경우 사용 (ex. 남,여 역도경기)
# 학급별 학생수 가중치 적용
data2 = data %>% filter(stuno < 10300 | stuno > 30000) %>%
group_by(cls) %>% summarise(m = mean(kor), n = n())
w = data2$n / sum(data2$n)
# 가중평균 계산
weighted.mean(data2$m, w)
#cf. mean(data2$m)


###############################  기하(Geometric) 평균  #################################

# 기하평균 (Geometric Averate)
- 수익률(CAGR, Compound Average Growth Rate) 계산시 사용  (평균 증가율)




# ex. 처음 1,000에서 매해 → 10% 증가 → 20% 증가 → 15% 감소 했다면 매해 평균 증가율은??
→ (1.1 × 1.2 × 0.85)1/3 = 1.0391...
즉, 3년동안 평균 3.91%씩 증가한 셈
# psych::geometric.mean() - 1
library(psych)
gmdata = c(1100/1000, 1320/1100, 1122/1320)
geometric.mean(gmdata) - 1


#########################   조화(harmonic) 평균  ########################################

# 여러 단위가 결합되었을 때의 평균
- 주어진 수들에 대한 '역수의 산술 평균'의 역수




# 거리는 동일, 속도가 다름
→ 속도 = 거리 / 시간 = 400 / 6 = 66.66667
즉, 평균 66.66667 Km/H 속도로 달렸다!
psych::harmonic.mean
library(psych)
harmonic.mean(c(100, 50))


##########################   절사(Trimmed) 평균,  boxplot, stem, 분산, 편차  ################

# 극단치 값을 제외한 평균
- 스포츠 경기(피겨스케이팅) 스코어 계산
# 최저, 최고 10% 제외 평균
t = c(20, 70, 60, 78, 69, 72, 79, 75, 65, 99)
t2 = c(70, 60, 78, 69, 72, 79, 75, 65)
mean(t); mean(t2)
mean(t, trim=0.10)          # cf.   mean(t[t < 90 & t > 20])
# 극단치를 시각적으로 보기
boxplot(t)                  # cf.  boxplot(kor~cls, data=data)
stem(t, scale = 2)
# 분산(variance), 표준편차(standard deviation)
var(t);  var(t2)
sd(t); sd(t2)
# cf. IQR(Inter-Quantitle Range)
summary(t)
IQR(t)           # Q3 - Q1


#########################  범위, 왜도, 첨도  ########################################

# 범위: 데이터의 범위(최소 ~ 최대)
range(t)
min(t)
max(t)

# 왜도(Skewness) : 대칭성 측정
hist(t, breaks = 10)
skew(t)      # psych
# 첨도(Kurtosis): 평균의 몰림 측정
kurtosi(t)    # psych
# 정규분포 보다 뾰족(양수), 완만(음수)
skewness > 0                skewness < 0
kurtosi > 0                 kurtosi > 0
# 종합 보기(summary, describe)
summary(t)
describe(t)         # psych


################## 이항확률 분포  ######################################################

# n개가 당첨 될 확률 계산
dbinom(3, size=3, prob = .9)
dbinom(0, size=3, prob = .9)
dbinom(2, size=3, prob = .9) # 2개(0.081 * 3 = 0.243) ← 3: 당-당-꽝, 당-꽝-당, 꽝-당-당

# c명중 당첨확률 p에 대해 n개 이하/초과 당첨 될 확률 계산
# = pbinom(n, size = c, prob = p, lower.tail = T/F)


# 3명중 `1명 이하` (0명, 1명) 당첨 될 누적 확률 
pbinom(1, size=3, prob = .9, lower.tail = T)
# 3명중 `2명 이상`(2명, 3명) 당첨 될 확률 === 1명 초과
pbinom(1, size=3, prob = .9, lower.tail = F)

options(encoding='utf-8')

# 확률 분포
plot(0:10, 
       dbinom(0:10, size=10, prob=0.7),  # pbinom(0:10, size=10, prob=0.7),
       type = 'h', lwd = 10, col = 'blue',
       xlab = '성공확률', ylab = '확률',
       main = '이항 분포 샘플')

#####################  이산 확률 분포 > 포(푸)아송 분포  #######################################

#   포아송 분포 (Poission Distribution)
#- 임의로 선택한 일정한 단위(시간, 공간)내에 발생하는 사건의 수
#- 보통은 단위시간당 도착(사건 발생)에 대한 모델에 사용
#- 지수분포의 역
#- 즉, 단위 시간당 몇건 발생의 확률은 포아송 분포를,
# 몇건이 발생하는데 걸리는 시간은 지수 분포를 사용


# 단위 시간당 l번 발생한다고 했을 때, n번 발생할 확률
# = dpois(x = n, lambda = l)


dpois(1, lambda = 10)   # 단위 시간당 10번 발생한다고 했을 때, 1번 발생할 확률
# 단위 시간당 3.5회 발생한다고 했을 때, 1번 이하로 발생할 확률과 1회 초과로 발생할 확률
ppois(1, lambda = 3.5, lower.tail = T)     # 1회 이하
ppois(1, lambda = 3.5, lower.tail = F)     # 1회 초과 (2회 이상)


# 포아송 확률 분포
plot(0:10, 
       dpois(0:10, lambda = 3.5),
       type = 'h', lwd = 10, col = 'blue',
       xlab = '성공확률', ylab = '확률',
       main = '포아송 분포(건당)')


# 포아송 누적 확률 분포
plot(0:10, 
       ppois(0:10, lambda = 3.5),
       type = 'h', lwd = 10, col = 'blue',
       xlab = '성공확률', ylab = '확률',
       main = '포아송 누적 분포(이하)')


plot(0:10, 
     ppois(0:10, lambda = 3.5, lower.tail = F),
     type = 'h', lwd = 10, col = 'blue',
     xlab = '성공확률', ylab = '확률',
     main = '포아송 누적 분포(초과)')


##########################  연속 확률 분포 > 지수 분포  #################################


#  지수 분포 (Exponential Distribution)
#- 두 사건의 사이의 시간에 대한 확률
#- 경영학의 대기시간 모형에서 많이 사용 (ex. 손님이 5분에 2명온다고 했을 때, 직원의 대기시간이 1분 이내일 확률)
#- 포아송 분포의 역
# 단위 시간 t 시간 당 r회 발생한다고 했을 때, 대기 시간이 n 시간 이내/초과일 확률
#= pexp(q = n/t, rate = r, lower.tail = T/F)
# ex. 콜센터에서 5분에 3.5회 콜이 온다고 했을 때, 대기 시간이 1분 이내 - 1분 이내에 콜이 올 - 확률은?
pexp(q=1/5, rate=3.5, lower.tail = T)     # 0.5034147

# 콜센터에서 5분에 3.5회 콜이 온다고 했을 때, 50%의 확률로 콜을 받을 시간?
qexp(p=0.5, rate=3.5, lower.tail = T)     # 0.1980421


#################################  연속 확률 분포 > 정규 분포  ################################

#  정규 분포 (Normal Distribution)
#- 평균을 중심으로 좌우 대칭을 이루는 종모양 확률 분포
#- Sample을 추출해서 모집단의 모수를 예측할 때 사용
#- 통계 분석시 모집단의 분포를 정규분포라고 가정 한 후 분석
#- 1 표준편차에 몇 %가 모여(확률이 분포)있는지를 계산 ⇐ 적분으로 계산하기 불편
# cf. 표준 정규 분포 (Standard Normal Distribution)
#- 정규 분포에서 평균을 0으로 변경한 것!

# 우리반 100명의 학생, 평균 85점, 표준편차 10 인 정규 분포 데이터
m = 85; sd = 10
sort(rnorm(100, m, sd)) -> rn  # 정규분포 → 고른 라인을 위해 sort
plot(rn, dnorm(rn, m, sd), type='l')     # cf. plot(rn, type='l')


# dnorm(확률 밀도 함수), pnorm(누적분포함수:점수), qnorm(누적분포함수:확률) 
dnorm(90, 85, 10)    # 90점 받을 확률
pnorm(90, 85, 10, lower.tail = T/F)   # 90점 이하/초과로 받을 확률 (F: 0.30 → 상위 30%)
qnorm(0.35, 85, 10, lower.tail = F)   # 상위 35%에 들기위한 점수


abline(v=m, lty=3)                           # 평균
abline(v=m + 1.96 * sd, col='red', lty=3)    # 상위 95% (1.96 → 약 2표준편차)
abline(v=m - 1.96 * sd, col='red', lty=3)    # 하위 95% 확률 구간


################################  통계 분석(검정)  #############################################

#### 통계 분석 [검정]
#(평균) 차이 검정
#- t-검정(t-test)
#- 일표본(One Sample) t-test
#- 독립표본(Independent Samples) t-test
#- Paired Samples t-test

#- 분산분석(ANOVA, ANalysis Of VAriation)
#- One-way ANOVA
#- Repeated Measure ANOVA
#- Two-way ANOVA


#관계 검정
#- 상관분석(Corelation)
#- 회귀분석(Regression)
#- (Multiple) Linear Regression
#- Logistic Regression
#- 교차 분석


############################### 통계 분석(검정) > 평균 차이 검정 ######################

### 평균 차이 검정
#- 집단간 평균 차이를 검정하는 방법
#- t-test, ANOVA

### t-test
#- 집단이 2개 이하
#- 일표본(One Sample) t-test: 집단 1개  (ex. 삼겹살 1인분, g)
#- 독립표본(Independent Samples) t-test: 집단 2개   (ex. A,B 회사 타이어 수명, 시간)
#- Paired Samples t-test: 시간의 변화(이전 집단 vs 이후 집단)   (ex. 투약 전/후, )
### ANOVA
#- 집단이 3개 이상


##############################  평균 차이 검정 > One Sample t-test  #####################

### One sample t-test (일 표본 검정)
#- 집단이 1개
#- 예시) A 프랜차이즈 식당의 삼겹살 1인분 무게는 320g 이다. (귀무가설)
#그러나 노원점의 경우 고객들이 양에 대한 불만이 있다. → 소비자 단체에서 320g이 맞는지 검사하고자 한다.
#⇒ 변수(무게), 정의(노원점 삼겹살 1인분 무게), 척도(연속)

### 실습) 통계치 (측정치) 
#  대립가설: 우리 학교의 학생들의 `평균 점수가 65점`이 아니다.
#- 모평균(점수): 65점
#- 표본(n): 120명
#- 표본 평균: 62.79
#- 표본 평균 오차(s): 9.8  (표준 편차)
#- 표준 오차(s/sqrt(n)): 0.89  (1.96이 95%므로 오차범위는 약 1표준편차 이하 떨어짐)
#- 판단 기준
#⇒ p-value = 0.000.. [대립가설 기각역이 0, 귀무가설이 맞을 확률이 0, 즉 귀무가설 기각]    
### 일 표본(One Sample) Test : `기각역`의 위치로 본 일표본의 종류
#- 우측 검정(Right-sided test): 기각역이 우측 (ex. KTX 서울 → 부산 소요시간은 2시간 이상이다)
#- 좌측 검정(Left-sided test): 기각역이 좌측 (ex. 엔진오일의 교체주기는 1만키로 이하이다)
#- 양측 검정(Two-sided test): 이다/아니다 (ex. 1인분의 무게,  H0: ᘈ=320, H1: ᘈ≠320)

#################################  평균 차이 검정 > One Sample t-test   (Cont'd) ################

# 표본 및 기술 통계 확인

library(dplyr)
library(psych)

#options(encoding = 'UTF-8')
load('data/data02.rda')
data

data$avg = apply(data[, 4:8], MARGIN = 1, FUN = mean)
s = data %>% filter(cls == '매') %>% select(avg)         # 군집 추출
describe(s)       # psych

# 표본 데이터 확인 (boxplot & hist)
orgpar = par(no.readonly = T)     # 기존 화면 분할 설정 저장 (cf. gridExtra)
par(mfrow=c(1,2))                 # 1행 2열로 plot을 그려라
boxplot(s); hist(s$avg)
par(orgpar) # par 설정 원위치
mean(s$avg)

# 검정(t.test) ⇒ 결과의 p-value가 0.000...이면 귀무가설은 기각!
# 가설: 평균 점수가 63점이다.
t.test(s, alternative = c("two.sided"),    # cf. c("greater"), c("less")
         mu=65, conf.level = 0.95)  # 검증값(평균), 신뢰구간(95%)




t.test(s, alternative = c("two.sided"),    # cf. c("greater"), c("less")
       mu=62.7, conf.level = 0.95)  # 검증값(평균), 신뢰구간(95%)


t.test(s, alternative = c("two.sided"),    # cf. c("greater"), c("less")
       mu=64.5, conf.level = 0.95)  # 검증값(평균), 신뢰구간(95%)  (채택가능)



mu = 65; se = 0.89; rn = sort(rnorm(1000, mu, se))  ## 기각 (평균 65 아니다.)
plot(rn, dnorm(rn, mu, se), type = 'l', main = '평균점수')
abline(v=mu + 1.96 * se, col="blue", lty=3)
abline(v=mu - 1.96 * se, col="blue", lty=3)
abline(v=62.785, col='red', lty=5)

mu = 64.5; se = 0.89; rn = sort(rnorm(1000, mu, se)) ## 채택
plot(rn, dnorm(rn, mu, se), type = 'l', main = '평균점수')
abline(v=mu + 1.96 * se, col="blue", lty=3)
abline(v=mu - 1.96 * se, col="blue", lty=3)
abline(v=62.785, col='red', lty=5)

####################################  평균 차이 검정 > Independent Sample t-test  ################


### Independent samples t-test (독립 표본 검증)
#- 집단이 2개 (두 집단의 평균 차이를 검정)
#- 판단기준: p-value >= 0.010 이면 귀무가설 기각
### 1. 데이터 준비 ⇐ ⇐ [가설: 매반과 난반의 국어성적은 차이가 없다.]
mnkor = data %>% filter(cls %in% c('매', '난')) %>% select(cls, kor)
# cf. 2개만 남기기> mnkor$cls = factor(mnkor$cls, levels=c('매','난'), labels=c('매', '난'))
mnkor$cls = factor(mnkor$cls, levels=c('매','난'), labels=c('매', '난'))
# 2. 기술 통계 확인(데이터 확인)
describeBy(mnkor$kor, mnkor$cls, mat = T)
layout(matrix(c(1,1,2,3), 2, 2, byrow = T))    # 2행 2열 중 첫번째, 첫번째, 두번째, 세번째 순
boxplot(mnkor$kor ~ mnkor$cls)
hist(mnkor$kor[mnkor$cls == '매'])
hist(mnkor$kor[mnkor$cls == '난'])
par(orgpar)  # 설정 원위치
### 3. 등분산(분산의 동질성) 검증
#  → p-value: 동질한 정도 (만약 5% 미만이면 이분산) ]
var.test(mnkor$kor ~ mnkor$cls, data = mnkor)  # ==> 약90% 동일

# 4. 독립 표본 검증

t.test(mnkor$kor ~ mnkor$cls, data = mnkor,
       alternative = c("two.sided"),
       var.equal = T,                 # 등분산검증의 p-value < 0.05 이면 False로!
       conf.level = 0.95)
#==> 결론: p-value >= 0.010 이므로 둘은 같지 않다 (귀무가설은 틀렸다)!!
  
# 5. 결과 graph 작도
mu = 59.4; se = 1.975140; rn = sort(rnorm(1000, mu, se))  #describeBy의 첫번째 그룹의 mean, se
plot(rn, dnorm(rn, mu, se), col='green', type = 'l', main = '평균점수',
       xlim = c(50, 80), ylim = c(0, 0.25)) 
abline(v=mu, col="green", lty=5)  # 매반에 대한 그림
par(new = T)          # 겹쳐 그리기

mu = 64.28; se = 1.952381; rn = sort(rnorm(1000, mu, se)) #describeBy의 두번째 그룹의 mean, se
plot(rn, dnorm(rn, mu, se), col='red', type = 'l', main = '평균점수',
       xlim = c(50, 80), ylim = c(0, 0.25))
abline(v=mu, col="red", lty=5)
# FYI: 겹쳐서 찍을것이므로 좌표(xlim, ylim)를 맞춘다!!

#####################  평균 차이 검정 > ANOVA (분산분석) ###########################################

## 분산분석(ANOVA, ANalysis Of VAriation)
#- 그룹이 3개 이상
#- One-way ANOVA
#- Repeated Measure ANOVA
#- Two-way ANOVA
#- 기각 기준: p-value(Pr) < 0.0163

## 1. 데이터 준비
#- 귀무 가설: 4개반 국어성적은 동일하다.
#- 대립(연구) 가설: 4개반 국어 성적은 적어도 한 쌍은 같지 않다.

## 2. 기술 통계 확인
describeBy(data$kor, data$cls, mat = T)

## 3. 그래프로 데이터 확인하기 (ggplot2)
library(ggplot2)
ggplot(data, aes(x=cls, y=kor)) +
  geom_boxplot(outlier.color = 'blue') +
  ggtitle("각반 국어 성적")

ggplot(data, aes(x=kor)) +
  geom_histogram(binwidth = 10, col='white') +
  facet_grid(. ~ data$cls)   # 그룹별로 그려라!


# 4. 통계 분석 (등분산 검정 --> ANOVA 분석)
# 4-1. 등분산(분산의 동질성) 검정 (p-value > 0.05 면 등분산)
bartlett.test(data$kor ~ data$cls, data=data)  # ⇒ p-value = 0.8497 ⇒ 약 85% 동질하다
# 4-2. ANOVA 분석 (등분산)  cf. 만약 이분산이면 Welch's ANOVA test

aaa = aov(data$kor ~ data$cls, data=data)
summary(aaa)   


# FYI: Welch's ANOVA One-way test (이분산)
oneway.test(data$kor ~ data$cls, data=data, var.equal = F)
# 5. 사후 분석(뭐가 차이가 있는데?) ← 그룹별 표본수가 같을 때(Tukey HSD, Duncan LSR), 다를 때(Scheffe)
TukeyHSD(aaa)
# 6. 동질성 결과 그래프
plot(TukeyHSD(aaa))       # 가운데 선이 0이면 일치


############################## 평균 차이 검정 > ANOVA (최종 결과 리포트) ################

# plot 함수 작성 (반복 제거)
draw = function(rn, mu, se, col) {
  plot(rn, dnorm(rn, mu, se), col=col, type = 'l',
       xlim = c(50, 80), ylim = c(0, 0.25))
  abline(v=mu, col=col, lty=5)
}

# 4개 한번에 그리기
mu = 62.6; se = 2.097331; rn = sort(rnorm(1000, mu, se))
draw(rn, mu, se, 'red')
par(new = T)
mu = 59.4; se = 1.975140; rn = sort(rnorm(1000, mu, se))
draw(rn, mu, se, 'blue')
par(new = T)
mu = 64.2833; se = 1.9523; rn = sort(rnorm(1000, mu, se))
draw(rn, mu, se, 'green')
par(new = T)
mu = 66.6; se = 1.964653; rn = sort(rnorm(1000, mu, se))
draw(rn, mu, se, 'black')


# (참고) 범례
legend('topright',
         legend=c('국', '난', '매', '죽'),
         pch=8,
         col=c('red', 'blue', 'green', 'black'),
         bg='gray')


##################  관계 검정 > Correlation (상관분석)  #############################

## 상관 분석(Correlation)
#- 두 변수간의 상관(연관) 정도 분석
#- 즉, x에 의해 y가 영향을 받는다.
# 1. 데이터 준비 (배기량과 도시연비의 연관성 분석)
library(ggplot2)
library(dplyr)
mpg %>% select(displ, cty) -> cdata
# 2. 기술 통계 확인
library(psych)
describe(cdata)
# 3. 그래프로 데이터 확인하기
pairs.panels(cdata)          # 연관계수 확인
# 4. 상관분석
cor(cdata, use = "complete.obs",   # 결측치(NA) 제외
      method = c("pearson"))         # 모수 통계  cf. 비모수(30개 미만)의 경우 spearman)
# 5. 결과 그래프     x(displ)에 의해 y(cty)가 영향을 받는다
plot(cty ~ displ, data=cdata)
abline(lm(cty ~ displ, data=cdata), col='red')


##############################   Regression (회귀분석)  ###########################

## 회귀분석(Regression)
#- 평균에 대한 Error(편차)를 줄여주는 선을 찾아, 예측 또는 설명(어떤 요인이 영향을 주는가)
#- 최소제곱법: 잔차 제곱의 합을 최소화
## 단순 회귀분석(Simple Regression) : 평면
#- 종속변수 y에 영향을 미치는 독립 변수 x가 1개 (y = ax + b)
## 다중 회귀분석(Multiple Linear Regression) : 공간
#- y에 영향을 미치는 독립 변수가 여러개 (Y = B0 + B1X1 + B2X2 + ... + BnXn)
## 로지스틱 회귀분석(Logistic Regression)
#- 영향을 미치는 독립 변수가 여러개면서 종속변수가 범주형

## 다중 공선성(multicollinearity) 
#- 값이 비슷한 변수가 여러개면 복잡도만 올라가고 회귀계수는 신뢰못함
#- 검정 방법: 공차한계(Tolerance), VIF(Variance Inflation Factor)


#######################   Simple Regression (단순 회귀분석)  #####################


## 상관분석(Correlation)  vs  단순 회귀분석(Simple Regression)
#- 상관분석: 독립변수와 종속변수의 영향도와 분포 파악 (분포와 기울기 분석)
#- 단순 회귀분석: 분포의 선형성 체크 (선형성이 높을수록 신뢰)
# 1. 데이터 준비
mpg %>% select(displ, cty) -> cdata
# 2. 기본 통계치 확인
lm(cty ~ displ, data=cdata) -> lmdata
summary(lmdata)  
# Estimate: 기울기, Pr: '상관없음'의 정도(0.05보다 작으면 영향을 준다)
orgpar = par(no.readonly = T)
par(mfrow=c(2,2))
pairs.panels(cdata)
# 3. 분석 및 결과 그래프
plot(lmdata)      # 4개 그래프(선형성, 정규성, 등분산성, 이상치검정)      cf. par(mfrow=c(2,2))
par(orgpar)

# 이상치 검정 (lm선을 기준으로 정규분포의 정도 측정)
shapiro.test(lmdata$residuals)    
# p-value 정규 분포의 정도(0.05 초과면 정규분포를 따른다는 귀무가설을 기각할 수 없다)


#############################  Multiple Linear Regression (다중 회귀분석)   ######################

## 1. 데이터 준비
mpg %>% select(displ, year, cyl, cty) -> cdata2
## 2. 기본 통계치 확인
describe(cdata2)
pairs.panels(cdata2)
## 3. 독립 변수 선택
lmdata2 = lm(cty ~ displ+cyl+year, data=cdata2)    
lmdata2 = lm(cty ~ displ+cyl, data=cdata2)       # year는 무관하므로 제거
summary(lmdata2)         # Estimate: 기울기, Pr: '상관없음'의 정도(0.05보다 작으면 영향을 준다)
## 4. 다중공선성 체크  install.packages('car')
install.packages('car')
library(car)
vif(lmdata2)      # 다중공선성 체크(기준 10 보다 크면 제거 대상)
## 5. 분석 및 결과 그래프
orgpar = par(no.readonly = T)
par(mfrow=c(2,2))
plot(lmdata)      # 4개 그래프(선형성, 정규성, 등분산성, 이상치검정)
par(orgpar)


##############################  Logistic Regression (로지스틱 회귀분석)  ###########################

## 1. 데이터 준비 : 1999년과 2008년 두 해의 만족도가 0과 1 → 영향을 준 요인은??
unique(mpg$trans); unique(mpg$year);
cdata3 = mpg %>%
  mutate(trs = ifelse(substr(trans, 1, 4) == 'auto', 1, 0), 
         y = ifelse(year == 1999, 0, 1)) %>%
  select(y, displ, cyl, trs, cty, hwy)
## 2. 기본 통계치 확인
describe(cdata3)
pairs.panels(cdata3)
## 3. 분석
glmdata = glm(y ~ displ+cyl+cty+hwy+trs, family = binomial, data=cdata3)
summary(glmdata)  # Estimate: 기울기(비례/반비례), Pr: 0.05보다 작으면 영향이 있다
orgpar = par(no.readonly = T)
par(mfrow=c(2,2))
plot(glmdata)
par(orgpar)
## 4. coefficients(기울기+절편)와 confint(신뢰구간)로 LOR(Log Odd Ratio) 구하기
round(exp(cbind(LOR = coef(glmdata), confint(glmdata))), 2)


###################   Crosstabulation, Crosstable (교차분석, 카이제곱) ################


# 교차분석(Crosstabluation, CrossTable, 교차분석, 카이제곱 / 카이스퀘어 분석)
#- 범주형(성별, 지역별, 직업별, 교육수준별, 연령별, 순위, 찬반등) 데이터의 성향을 갖고 있는
#사회의 가치 내용을 분석하기 위해 사용되는 분석기법
#- 명목 및 서열척도의 범주형 변수(Categorical variables)를 분석하기 위해 
#한 변수의 범주를 다른 변수의 범주에 따라 빈도를 교차분석하는 교차표(CrossTable)를 작성하고
#두 변수간의 독립성과 관련성을 분석하는데 이용

# 예시
#- 작년과 올해 학생들의 수학 성적 향상 정도를 성별, 거주지, 학원 여부에 따라 비교 분석
#- 연령과 시간대에 따른 게임 몰입도 비교 분석	

# 요가와 골다공증(노화)의 관계 검증
#- 귀무가설: 요가와 골다공증은 관계가 없다. (p-value >= 0.05)
#- 연구가설: 요가와 골다공증은 관계가 있다. (p-value < 0.05)

# 사전 설계  vs  사후 설계
#- 사전 설계: 사전 계획을 하고 실험 및 분석 실시
#- 사후 설계: 이미 나타난 결과를 토대로 분석 실시

########################  교차분석 : 요가와 골다공증의 관계 분석  ################################

# 예시: 요가와 골다공증의 관계 검증
#- 귀무가설: 요가와 골다공증은 관계가 없다. (p-value >= 0.05)
#- 3개월 이내 발병대상 환자 100명 기준 요가 여부에 따른 골다공증 발병율 분석
# 1. 데이터 준비 (가상)
kdata = data.frame(group=rep(c('YogaO', 'YogaO', 'YogaX', 'YogaX'), each=25), 
                     golda=rep(c('GoldaO', 'GoldaX','GoldaO', 'GoldaX'), times=c(19,31,32,18)) )


# 2. 데이터 확인 (분할표, 그래프)
nkdata = table(kdata); addmargins(nkdata)# cf. 상대도수 prop.table(nkdata)
addmargins(nkdata)
addmargins(prop.table(nkdata))

barplot(nkdata, beside = T, legend = T)
mosaicplot(nkdata, shade = F,  color = c('red', 'green'))

# 3. 카이제곱 분석
chisq.test(nkdata)   # p-value 체크


# 4. 교차표(CrossTable) 작성  (install.packages('gmodels'))
#install.packages('gmodels')
library(gmodels)
CrossTable(nkdata, expected = T, chisq = T)

# 5. 상대비율
0.373/0.627
[1] 0.5948963



















 



















                                                          
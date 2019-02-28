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

f = factor(2, levels=1:3, labels=c('A', 'B', 'C'))
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
colnames(m[, c(10,20)]
         
         df1 = data.frame(column1=11:15, column2=LETTERS[1:5])         
df1         
str(df1)
data
class(data)
df2 = data[1:10, 1:6]
df2
df3 = data[1:10, c(1:3, 7,8)]
df3
df100 = data[101:110, 1:6]
df100
#list ####
lst1 = list(a=1:3, b=4:6)
lst1
lst1$a
lst1['a']
lst2 = list(a=1:3, b=c(4, '5', 6))
lst2
str(lst2)
names(lst2)
lst3 = list(1:3, LETTERS[1:3], c(2.5, 4.5, 3.7))
lst3
lst3[1]
unlist(lst3)    
unlist(lst1)
s = "123"
i = as.numeric(s)
as.character(i)
m2df = as.data.frame(m2)
class(m2df)
str(m2)
str(m2df)
tbl = table(data$수학)
dft = as.data.frames(tbl)
as.factor(1:5)
cbind(df2, df3)
df = merge(x = df2, y = df3, by = "학번", by ="반", by ="성별" , all = TRUE)
df
df$반.y = NULL
df$성별.y = NULL
data = data[c("학번", "반x", "성별x", "국어", "영어", "수학", "과학", "예체")]
#2
df4 [,c(1:4, 7, 6, 8, 5)]
cn = colnames()
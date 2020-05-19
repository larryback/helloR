sweep(size, 2, colmean)

sweep(size, 1, rowmean)

sweep(size, 1, c(1, 2, 3, 4), "+")

sweep(size, 1, c(1, 2, 3, 4), "-")

m1 <- matrix(1:4, nrow=2)

m1

m2 <- matrix(5:8, nrow=2)

m2

m1%*%m2

solve(m1)

t(m1)

arr <- array(1:24, c(3,3,2))
dimnames(arr) <- list(paste ("row", c(1:3)), paste("col", c(1:3)), paste("ar", c(1:2)))

arr

length(arr)

mode(arr)

dimnames(arr)

dim(arr)

array(1:6)

array(1:6, c(2,3))

array(1:8, c(2,2,2))

arr <- c(1:24)

dim(arr) <- c(3,4,2)

arr

arr1 <- array(1:8, dim = c(2,2,2))
arr2 <- array(8:1, dim = c(2,2,2))

arr1

arr2

arr1 + arr2

arr1 * arr2

arr1 %*% arr2

sum(arr1 * arr2)

arr1 [, , 1]

arr1[1,1,]

arr1[1,,-2]

?array

a <- 1:10 

b <- 11:15

klist <- list(vec1=a, vec2=b, descrip="example")

length(klist)

mode(klist)

names(klist)

list1 <- list("A", 1:8)

list1

list1[[3]] <- list(c(T,F))

list1[[2]][9] <- 9

list1

list1[3] <- NULL

list1[[2]] <- list1[[2]][-9]

list1

a <- 1:10

b <- 11:15

nlist <- list(vec1=a, vec2=b, descrip = "example")

nlist

nlist[[2]][5]

nlist$vec2[c(2, 3)]

d2 <- "D:/exam/story.txt"

d2 <- matrix( c('Lee', 55, 'M', 'Park', 47, 'F', 'So', 37, 'M', 'Kim', 26, 'F', 'Yoon', 29, 'M'), ncol = 3, byrow = T, dimnames = , c("name", "age", "sex"))


char1 <- rep(LETTERS[1:3], c(2, 2, 1))

char1

num1 <- rep(1:3, c(2,2,1))

num1

test1 <- data.frame(char1, num1)

test1

name <- c("Lee", "Park", "So","Kim", "Yoon")

name

age <- c(55, 47, 35, 26, 29)

sex <- c("M", "F", "M", "F", "M")

num <- c(1,2,3,4,5)

d2 <- data.frame(num, name, age, sex)

d2

data("state")

data

state.x77[4, 7]

state.x77[c(7,17,28), c(2,5,7)]

state.x77[-c(5:50),c(3:5)]

state.x77["Population">4000,c("Income")]

x <- c(23,34,35,46,55,13,26,34,35,75)

sum <- 0

for (i in x){
  sum <- sum + i
 } 
print(sum/length(x))  


mean(x)

k = 7

for (i in c(5, 3, 1, 1, 3, 5)) {
  
  k = k - 1
  print( rep(k, i) )
  
} 

x <- c(6,5,4,3,2,1)
y <- c(5,3,1,1,3,5)
i = 0 

while(i<6){
  i = i + 1
  z <- c(rep(x[i], y[i]))
  print(z)
}


x <- c(6,5,4,3,2,1)
y <- c(5,3,1,1,3,5)
i = 0 

repeat{i = i + 1
       z <- c(rep(x[i], y[i]))
       print(z)
       if(i > 5){
         break
       }
       
       }

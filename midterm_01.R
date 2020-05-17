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

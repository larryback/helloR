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

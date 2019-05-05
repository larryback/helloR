data("mtcars")
help(mtacars)
??mtacars
head(mtcars)
head(mtcars, 10)
str(mtcars)
summary(mtcars)
mtcars$mpg
stem(mtcars$mpg)
hist(mtcars$mpg)
boxplot(mtcars$mpg)

fit = lm(mpg ~ wt, data = mtcars)
summary(fit)

coef(summary(fit))

co = coef(summary(fit))

co[, 1]

co[, 4]

predict(fit)

summary(fit)

37.2851 + (-5.3445)*4.5

newcar = data.frame(wt=4.5)
predict(fit, newcar)

library(ggplot2)
ggplot(mtcars, aes(x=wt, y=mpg)) + geom_point() + geom_smooth(method = "lm")

#3

mpg = as.data.frame(ggplot2::mpg)
library(dplyr)
library(ggplot2)
summary(mpg)

library(dplyr)
library(ggplot2)
midwest = as.data.frame(ggplot2::midwest)
head(midwest)
tail(midwest)
View(midwest)
dim(midwest)
str(midwest)
summary(midwest)






#4 
midwest = as.data.frame(ggplot2::midwest)
midwest_new = midwest
midwest_new = rename(midwest_new, total = poptotal )
midwest_new = rename(midwest_new, asian = popasian )

v <- c(20, 18, 15, 17, 18, 21, 25, 28, 24, 25, 280)

mean(v)

median(v)

boxplot(v)

range(v)

summary(v)


city <- c(22, 24, 24, 30, 21, 28, 33, 24, 28, 26)

attach(chest)

mean(city)

median(city)

range(city)

summary(city)


country <- c(20, 21, 24, 26, 28, 22, 20, 24, 25, 29)

mean(country)

median(country)

range(country)

summary(country)


par(mfrow = c(1, 2))

boxplot(city, main="city")

boxplot(country, main="country")

t.test(city, country ,mu=0,var.equal = F,conf.level = 0.95,alternative = "two.sided")

m <- c(34, 45, 49, 55, 58, 59, 60, 62, 86)

s <- c(5, 8, 18, 24, 60, 84, 96)


t.test(m, s , mu=0,  var.equal = F, conf.level = 0.95, alternative = "two.sided")


#데이터
catdata <- data.frame(sex = c(rep("F", 25), rep("M", 50)), smoke = c(rep("N", 13), rep("Y", 12), rep("N", 20), rep("Y", 30)))

#분할표
table(catdata)

# 독립성 검정
chisq.test(catdata$sex, catdata$smoke, correct = FALSE)
# correct = FALSE 기대도수가 5이하여도 보정하지 않는다.

y1 <- c(22.5, 97.8, 29.1, 97.0, 35.8, 44.2, 82.0, 56.0, 9.3, 19.9, 39.5, 12.8, 37.4) # SRRS 점수 저 <= 54 (==1)

y2 <- c(15.1, 23.2, 10.5, 13.9, 9.7, 19.0, 19.8, 9.1, 30.1, 15.5, 10.3, 11.0 ) # SRRS 점수 중  55 ~ 99(==2)

y3 <- c(10.2, 11.3, 11.4, 5.3, 14.5, 11.0, 13.6, 33.4, 25.0, 27.0, 36.3, 17.7) # SRRS 점수 중  >= 100(==3)

y <- c(y1, y2, y3)

group <- c(rep(1, 13), rep(2, 12), rep(3, 12)) 

group_df <- data.frame(y, group)

group_df

sapply(group_df, class)

group_df <- transform(group_df, group = factor(group))

sapply(group_df, class)

attach(group_df)


boxplot(y ~ group,  main = "Boxplot of NK cell activity by SRSS condition y1/y2/y3", 
                xlab = "Factor Levels : SRSS condition y1/y2/y3", 
                 ylab = "NK cell activity")

tapply(y, group, summary)

detach(group_df)

aov(y ~ group, data = group_df)

summary(aov(y ~ group, data = group_df))

bartlett.test(y ~ group, data = group_df)

install.packages("UsingR")



library(UsingR)


shapiro.test(group_df$y)

hist(group_df$y)


kruskal.test(y ~ group, data = group_df)

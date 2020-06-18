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

y1 <- c(22.5, 97.8, 29.1, 97.0, 35.8, 44.2, 82.0, 56.0, 9.3, 19.9, 39.5, 12.8, 37.4) # SRRS 점수 저 <= 54

y2 <- c()

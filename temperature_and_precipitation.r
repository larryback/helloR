#########################  미국 각 주의 평균기온과  강수량과  밀 산출량과의 관계 ############

########################## 캔사스 주의  평균기온과  밀 산출량과의 관계 ############


library(ggplot2)
options(scipen = 100)
library(gridExtra)
library(plotly)

data04 = read.csv("data/kansas_annual_average_temperature.csv", sep = ",", stringsAsFactor = FALSE)

#setwd("/workspace/R/helloR")
head(data04, 10)
str(data04)
summary(data04)


stem(data04$production)
hist(data04$production)
boxplot(data04$production)

library(ggplot2)

Null Hypothesis( 귀무가설: Ho 라고  쓴다. 검정 당사자가 타파하거나 기각시키려고 하는 가설입니다.)

Alternative Hypothesis (대립가설: Ha 라고 쓴다. 귀무가설에 반대되는 가설로 연구와 실험을 통해서 입증, 규명하고자 하는 가설이다. 즉, 대립 가설은 검정 당사자가 참이라고 믿거나 참으로 증명되기를 바라는 것입니다.)

귀무가설과 대립가설은  수학적으로 완전히 반대 상태에 있다.  즉, 두 가지의 가능성 만이 있고  하나가 참이면 다른 하나는 자동적으로 거짓이 된다. 

#### Level of Confidence(신뢰도): 신뢰도(C)란  일관되고 재현이 가능한(replicable) 측정이 존재하는지 평가하는 기준이다. C-95%, C-99% 라는 식으로 표현한다. 

#### Level of Significance(유의수준): 유의수준(알파a)이란 오류를 허용할 범위를 말하며 α = 1 – C 가 성립한다.  그래서 LOC(신뢰도)가 95% 일 때 α = 1 – C → α = 1 – 0.95 따라서 α = 0.05 가 된다.


#### Ho(귀무가설): 캔사스 주의  평균기온과 캔사스 주의 밀 생산량은 비례하지 않는다. 

#### Ha(대립가설): 캔사스 주의  평균기온과 캔사스 주의 밀 생산량은 비례한다.



fit = lm(production ~ temperature, data = data04)

summary(fit)

회귀분석 결과  Coefficients: 부분을 살펴보자. y절편(Intercept)은  25.245, 기울기는  5.751  이다. p값(p-value)은 0.0474 로  낮다. 즉 production 와 temperature 는 다음과 같은 관계가 성립한다.

production = 25.245 + 5.751  × temperature

기울기의 값이 플러스이므로 그래프로 그리면 우상향하는 직선일 것이다.  그리고 밀의 생산량과 평균기온 사이에는 비례 관계가 성립한다.

cor.test(data04$production, data04$temperature)


#library(ggplot2)
ggplot(data04, aes(x=temperature, y=production)) + geom_point() + stat_smooth(method = "lm")
# 95% 신뢰구간

library(plotly)

t = ggplot(data04, aes(x=temperature, y=production)) + geom_point() + stat_smooth(method = "lm", level = 0.95)

# level = 0.99  95% 신뢰구간 

ggplotly(t)


########################## 노스 다코타 주의  평균기온과   밀 산출량과의 관계 ############

data05 = read.csv("data/north_dakota_annual_average_temperature.csv", sep = ",", stringsAsFactor = FALSE)

head(data05, 10)
str(data05)
summary(data05)


stem(data05$production)
hist(data05$production)
boxplot(data05$production)

library(ggplot2)

fit = lm(production ~ temperature, data = data05)

summary(fit)

coef(summary(fit))

co = coef(summary(fit))

co[, 1]

co[, 4]

predict(fit)

summary(fit)


#library(ggplot2)
ggplot(data05, aes(x=temperature, y=production)) + geom_point() + stat_smooth(method = "lm")
# 95% 신뢰구간

#install.packages("plotly")

library(plotly)

t = ggplot(data05, aes(x=temperature, y=production)) + geom_point() + stat_smooth(method = "lm", level = 0.95)

# level = 0.99  99% 신뢰구간 

ggplotly(t)


########################## 몬타나 주의  평균기온과  밀 산출량과의 관계 ############

data06 = read.csv("data/montana_annual_average_temperature.csv", sep = ",", stringsAsFactor = FALSE)

head(data06, 10)
str(data06)
summary(data06)


stem(data06$production)
hist(data06$production)
boxplot(data06$production)

library(ggplot2)

fit = lm(production ~ temperature, data = data06)

summary(fit)

coef(summary(fit))

co = coef(summary(fit))

co[, 1]

co[, 4]

predict(fit)

summary(fit)


#library(ggplot2)
ggplot(data06, aes(x=temperature, y=production)) + geom_point() + stat_smooth(method = "lm")
# 95% 신뢰구간

#install.packages("plotly")

library(plotly)

t = ggplot(data06, aes(x=temperature, y=production)) + geom_point() + stat_smooth(method = "lm", level = 0.95)

# level = 0.99  99% 신뢰구간 

ggplotly(t)


########################## 워싱턴 주의  평균기온과  밀 산출량과의 관계 ############


data07 = read.csv("data/washington_annual_average_temperature.csv", sep = ",", stringsAsFactor = FALSE)

head(data07, 10)
str(data07)
summary(data07)


stem(data07$production)
hist(data07$production)
boxplot(data07$production)

library(ggplot2)

fit = lm(production ~ temperature, data = data07)

summary(fit)

coef(summary(fit))

co = coef(summary(fit))

co[, 1]

co[, 4]

predict(fit)

summary(fit)


#library(ggplot2)
ggplot(data07, aes(x=temperature, y=production)) + geom_point() + stat_smooth(method = "lm")
# 95% 신뢰구간

#install.packages("plotly")

library(plotly)

t = ggplot(data07, aes(x=temperature, y=production)) + geom_point() + stat_smooth(method = "lm", level = 0.95)

# level = 0.99  99% 신뢰구간 

ggplotly(t)


########################## 오클라호마 주의  평균기온과  밀 산출량과의 관계 ############


data08 = read.csv("data/oklahoma_annual_average_temperature.csv", sep = ",", stringsAsFactor = FALSE)

head(data08, 10)
str(data08)
summary(data08)


stem(data08$production)
hist(data08$production)
boxplot(data08$production)

library(ggplot2)

fit = lm(production ~ temperature, data = data08)

summary(fit)

coef(summary(fit))

co = coef(summary(fit))

co[, 1]

co[, 4]

predict(fit)

summary(fit)


#library(ggplot2)
ggplot(data08, aes(x=temperature, y=production)) + geom_point() + stat_smooth(method = "lm")
# 95% 신뢰구간

#install.packages("plotly")

library(plotly)

t = ggplot(data08, aes(x=temperature, y=production)) + geom_point() + stat_smooth(method = "lm", level = 0.95)

# level = 0.99  99% 신뢰구간 

ggplotly(t)


########################## 캔사스 주의  강수량과  밀 산출량과의 관계 ############

data09 = read.csv("data/kansas_annual_average_precipitation.csv", sep = ",", stringsAsFactor = FALSE)

head(data09, 10)
str(data09)
summary(data09)


stem(data09$production)
hist(data09$production)
boxplot(data09$production)

library(ggplot2)

fit = lm(production ~ precipitation, data = data09)

summary(fit)

coef(summary(fit))

co = coef(summary(fit))

co[, 1]

co[, 4]

predict(fit)

summary(fit)


#library(ggplot2)
ggplot(data09, aes(x=precipitation, y=production)) + geom_point() + stat_smooth(method = "lm")
# 95% 신뢰구간

#install.packages("plotly")

library(plotly)

t = ggplot(data09, aes(x=precipitation, y=production)) + geom_point() + stat_smooth(method = "lm", level = 0.95)

# level = 0.99  99% 신뢰구간 

ggplotly(t)


########################## 노스 다코타 주의  강수량과  밀 산출량과의 관계 ############

data10 = read.csv("data/north_dakota_annual_average_precipitation.csv", sep = ",", stringsAsFactor = FALSE)

head(data10, 10)
str(data10)
summary(data10)


stem(data10$production)
hist(data10$production)
boxplot(data10$production)

library(ggplot2)

fit = lm(production ~ precipitation, data = data10)

summary(fit)

coef(summary(fit))

co = coef(summary(fit))

co[, 1]

co[, 4]

predict(fit)

summary(fit)


#library(ggplot2)
ggplot(data10, aes(x=precipitation, y=production)) + geom_point() + stat_smooth(method = "lm")
# 95% 신뢰구간

#install.packages("plotly")

library(plotly)

t = ggplot(data10, aes(x=precipitation, y=production)) + geom_point() + stat_smooth(method = "lm", level = 0.95)

# level = 0.99  99% 신뢰구간 

ggplotly(t)


########################## 몬타나 주의  강수량과  밀 산출량과의 관계 ############

data11 = read.csv("data/montana_annual_average_precipitation.csv", sep = ",", stringsAsFactor = FALSE)

head(data11, 10)
str(data11)
summary(data11)


stem(data11$production)
hist(data11$production)
boxplot(data11$production)

library(ggplot2)

fit = lm(production ~ precipitation, data = data11)

summary(fit)

coef(summary(fit))

co = coef(summary(fit))

co[, 1]

co[, 4]

predict(fit)

summary(fit)


#library(ggplot2)
ggplot(data11, aes(x=precipitation, y=production)) + geom_point() + stat_smooth(method = "lm")
# 95% 신뢰구간

#install.packages("plotly")

library(plotly)

t = ggplot(data11, aes(x=precipitation, y=production)) + geom_point() + stat_smooth(method = "lm", level = 0.95)

# level = 0.99  99% 신뢰구간 

ggplotly(t)


########################## 워싱턴 주의  강수량과  밀 산출량과의 관계 ############

data12 = read.csv("data/washington_annual_average_precipitation.csv", sep = ",", stringsAsFactor = FALSE)

head(data12, 10)
str(data12)
summary(data12)


stem(data12$production)
hist(data12$production)
boxplot(data12$production)

library(ggplot2)

fit = lm(production ~ precipitation, data = data12)

summary(fit)

coef(summary(fit))

co = coef(summary(fit))

co[, 1]

co[, 4]

predict(fit)

summary(fit)


#library(ggplot2)
ggplot(data12, aes(x=precipitation, y=production)) + geom_point() + stat_smooth(method = "lm")
# 95% 신뢰구간

#install.packages("plotly")

library(plotly)

t = ggplot(data12, aes(x=precipitation, y=production)) + geom_point() + stat_smooth(method = "lm", level = 0.95)

# level = 0.99  99% 신뢰구간 

ggplotly(t)



########################## 오클라호마 주의  강수량과  밀 산출량과의 관계 ############

data13 = read.csv("data/oklahoma_annual_average_precipitation.csv", sep = ",", stringsAsFactor = FALSE)

head(data13, 10)
str(data13)
summary(data13)


stem(data13$production)
hist(data13$production)
boxplot(data13$production)

library(ggplot2)

fit = lm(production ~ precipitation, data = data13)

summary(fit)

coef(summary(fit))

co = coef(summary(fit))

co[, 1]

co[, 4]

predict(fit)

summary(fit)


#library(ggplot2)
ggplot(data13, aes(x=precipitation, y=production)) + geom_point() + stat_smooth(method = "lm")
# 95% 신뢰구간

#install.packages("plotly")

library(plotly)

t = ggplot(data13, aes(x=precipitation, y=production)) + geom_point() + stat_smooth(method = "lm", level = 0.95)

# level = 0.99  99% 신뢰구간 

ggplotly(t)

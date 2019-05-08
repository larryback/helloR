#################  미국 주요 밀생산 5개주의 밀 생산량 총합과  미국 전체 생산량 산점도 분석 #################
library(ggplot2)
options(scipen = 100)
library(gridExtra)
library(plotly)


data03 = read.csv("data/historical_wheat_production_by_state.csv", sep = ",", stringsAsFactor = FALSE)

head(data03, 10)
str(data03)
summary(data03)

#setwd("/workspace/R/helloR")

stem(data03$five.state.total)
hist(data03$five.state.total)
boxplot(data03$five.state.total)

stem(data03$total.wheat.production)
hist(data03$total.wheat.production)
boxplot(data03$total.wheat.production)



fit = lm(total.wheat.production ~ five.state.total, data = data03)

summary(fit)

coef(summary(fit))

co = coef(summary(fit))

co[, 1]

co[, 4]

predict(fit)

summary(fit)


#library(ggplot2)
ggplot(data03, aes(x=five.state.total, y=total.wheat.production)) + geom_point() + stat_smooth(method = "lm")
# 95% 신뢰구간

library(plotly)

t = ggplot(data03, aes(x=five.state.total, y=total.wheat.production)) + geom_point() + stat_smooth(method = "lm", level = 0.99)

# level = 0.99  99% 신뢰구간 

ggplotly(t)

###########################  미국 전체의 밀생산량과  밀가격의 산점도 분석 #################  
library(ggplot2)
options(scipen = 100)
setwd("/workspace/R/helloR")

data01 = read.csv("data/price_table04.csv", sep = ",", stringsAsFactor = FALSE)



head(data01, 10)
str(data01)
summary(data01)

stem(data01$annual.avg.price.per.bushel)
hist(data01$annual.avg.price.per.bushel)
boxplot(data01$annual.avg.price.per.bushel)

library(gridExtra)


g1=ggplot(data=data01, aes(x=year, y=annual.avg.price.per.bushel)) + geom_line()+geom_point()
g2=ggplot(data=data01, aes(x=year, y=wheat.production.by.thousand.bushel)) + geom_line() + geom_point()
grid.arrange(g1, g2, ncol=2)

install.packages('dygraphs')
library(dygraphs)
library(xts) 

ue1 = xts(data01$annual.avg.price.per.bushel, order.by = data01$year)%>% dyRangeSelector()

dygraph(ue1)

ue2 = xts(data01$wheat.production.by.thousand.bushel, order.by = data01$year)%>% dyRangeSelector()

dygraph(ue2)

grid.arrange(ue1, ue2, ncol=2)



cor.test(data01$wheat.production.by.thousand.bushel, data01$annual.avg.price.per.bushel)

library(ggplot2)

#fit = lm(annual.avg.price.per.bushel ~ Baltic.Dry.Index, data = data01)

#plot (data01$annual.avg.price.per.bushel ~ data01$Baltic.Dry.Index)
#lines(lowess(data01$annual.avg.price.per.bushel ~ data01$Baltic.Dry.Index))

fit = lm(annual.avg.price.per.bushel ~ wheat.production.by.thousand.bushel, data = data01)


summary(fit)

coef(summary(fit))

co = coef(summary(fit))

co[, 1]

co[, 4]

predict(fit)

summary(fit)


#37.2851 + (-5.3445)*4.5

#newcar = data.frame(wt=4.5)
#predict(fit, newcar)

#library(ggplot2)
#ggplot(data01, aes(x=Baltic.Dry.Index, y=annual.avg.price.per.bushel)) + geom_point() + stat_smooth(method = "lm")

ggplot(data01, aes(x=annual.avg.price.per.bushel, y=wheat.production.by.thousand.bushel)) + geom_point() + stat_smooth(method = "lm")

# 95% 신뢰구간  

# + theme(axis.text.x = element_text(angle=45, vjust=0.6) # 글씨의 기울기

library(plotly)

#t = ggplot(data01, aes(x=Baltic.Dry.Index, y=annual.avg.price.per.bushel)) + geom_point() + stat_smooth(method = "lm", level = 0.99)

t = ggplot(data01, aes(x=annual.avg.price.per.bushel, y=wheat.production.by.thousand.bushel)) + geom_point() + stat_smooth(method = "lm", level = 0.99)

# level = 0.99  99% 신뢰구간 

ggplotly(t)

###########################  캔사스주 밀생산량과  미국 전체 생산량 산점도 분석 #################  

data02 = read.csv("data/historical_wheat_production_by_state.csv", sep = ",", stringsAsFactor = FALSE)

head(data02, 10)
str(data02)
summary(data02)


stem(data02$total.wheat.production)
hist(data02$total.wheat.production)
boxplot(data02$total.wheat.production)


library(ggplot2)

fit = lm(total.wheat.production ~ Kansas, data = data02)

summary(fit)

coef(summary(fit))

co = coef(summary(fit))

co[, 1]

co[, 4]

predict(fit)

summary(fit)


#library(ggplot2)
ggplot(data02, aes(x=Kansas, y=total.wheat.production)) + geom_point() + stat_smooth(method = "lm")
# 95% 신뢰구간

library(plotly)

t = ggplot(data02, aes(x=Kansas, y=total.wheat.production)) + geom_point() + stat_smooth(method = "lm", level = 0.99)

# level = 0.99  99% 신뢰구간 

ggplotly(t)


#################  미국 주요 밀생산 5개주의 밀 생산량 총합과  미국 전체 생산량 산점도 분석 #################

data03 = read.csv("data/historical_wheat_production_by_state.csv", sep = ",", stringsAsFactor = FALSE)

head(data03, 10)
str(data03)
summary(data03)


stem(data03$total.wheat.production)
hist(data03$total.wheat.production)
boxplot(data03$total.wheat.production)

library(ggplot2)

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


#########################  미국 각 주의 평균기온과  강수량과  밀 산출량과의 관계 ############

########################## 캔사스 주의  평균기온과  밀 산출량과의 관계 ############

data04 = read.csv("data/kansas_annual_average_temperature.csv", sep = ",", stringsAsFactor = FALSE)

head(data04, 10)
str(data04)
summary(data04)


stem(data04$production)
hist(data04$production)
boxplot(data04$production)

library(ggplot2)

fit = lm(production ~ temperature, data = data04)

summary(fit)

coef(summary(fit))

co = coef(summary(fit))

co[, 1]

co[, 4]

predict(fit)

summary(fit)


#library(ggplot2)
ggplot(data04, aes(x=temperature, y=production)) + geom_point() + stat_smooth(method = "lm")
# 95% 신뢰구간

library(plotly)

t = ggplot(data04, aes(x=temperature, y=production)) + geom_point() + stat_smooth(method = "lm", level = 0.99)

# level = 0.99  99% 신뢰구간 

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

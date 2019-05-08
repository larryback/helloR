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

회귀분석 결과  Coefficients: 부분을 살펴보자. y절편(Intercept)은  25.245, 기울기는  5.751  이다. p값(p-value)은 0.0474 로  낮은편이다. 즉 production 와 temperature 는 다음과 같은 관계가 성립한다.

production = 25.245 + 5.751  × temperature

기울기의 값이 플러스이므로 그래프로 그리면 우상향하는 직선일 것이다.  그리고 밀의 생산량과 평균기온 사이에는 비례 관계가 성립한다.

cor.test(data04$production, data04$temperature)

상관분석 결과 상관계수(r) 값은0.3778536  이며 이 값의 제곱은 0.1428 로 회귀분석결과에서 나온 Multiple R-squared 값과 정확히 일치한다. P-Value 는 0.04743 로  작은편이다.  0.05보다 작으므로 귀무가설을 기각하고 대립가설을 채택한다. 따라서 밀의 생산량과 평균기온 사이에는 비례 관계가 성립한다.

#library(ggplot2)
ggplot(data04, aes(x=temperature, y=production)) + geom_point() + stat_smooth(method = "lm")
# 95% 신뢰구간

library(plotly)

t = ggplot(data04, aes(x=temperature, y=production)) + geom_point() + stat_smooth(method = "lm", level = 0.95)

# level = 0.99  95% 신뢰구간 

ggplotly(t)

이제 위에서 분석한 결과를 그림으로 그려보면 위와 같이 나오는데 예상한 대로 우상향하는 직선으로 비례 관계를 보여주고 있다. 아래 그림은 인터액티브 그래프로 그렸다.  짙은 회색으로 된 구간이 그려져 있는데,  모수(평균)가 구간에 있을 확률이 95%이다. (95% 신뢰구간)

########################## 노스 다코타 주의  평균기온과   밀 산출량과의 관계 ############

data05 = read.csv("data/north_dakota_annual_average_temperature_revised.csv", sep = ",", stringsAsFactor = FALSE)

head(data05, 10)

head는 상위 10개의 데이터를 항목별로 보여준다. 노스 다코타 주의 해당년도의 평균기온과 밀 생산량을 보여주고 있는데 단위는 백만 bushel 이다.

str(data05)

str()은 각 변수의 속성에 대해서 알려준다. data05은 데이터 프레임이고 , 22개의 관측치, 5개 변수로 구성되어 있다는 걸 알 수 있다.

summary(data05)

눈여겨 볼 것은 노스 다코타 주의  강수량과 밀의 최소 생산량, 제1사분위수, 제2사분위수(중앙값), 평균, 제3사분위수 , 최고생산량이다.

stem(data05$temperature)
hist(data05$temperature)
boxplot(data05$temperature)


stem(data05$production)
hist(data05$production)
boxplot(data05$production)

temperature 과 production 의  stem() , hist(), boxplot() 을 살펴 봤지만 temperature 는 정상으로 보이고 production 에는 극단치가 4개 있었다. (370, 363.4, 252, 199.8)

library(ggplot2)

#### Ho(귀무가설): 노스 다코타 주의  평균기온과 노스 다코타 주의 밀 생산량은 비례하지 않는다. 

#### Ha(대립가설): 노스 다코타 주의  평균기온과 노스 다코타 주의 밀 생산량은 비례한다.


fit = lm(production ~ temperature, data = data05)

summary(fit)

회귀분석 결과  Coefficients: 부분을 살펴보자. y절편(Intercept)은  199.9683, 기울기는   2.2745  이다. p값(p-value)은0.000001516538 로  매우 낮다. 즉 production 와 temperature 는 다음과 같은 관계가 성립한다.

production = 199.9683 + 2.2745 × temperature


cor.test(data05$production, data05$temperature)


상관분석 결과 상관계수(r) 값은 0.8795517 이며 이 값의 제곱은  0.7736 로 회귀분석결과에서 나온 Multiple R-squared 값과 정확히 일치한다. P-Value 는 0.000001516538 로  매우 작은편이다.  0.05보다 작으므로 귀무가설을 기각하고 대립가설을 채택한다. 따라서 밀의 생산량과 평균기온 사이에는 비례 관계가 성립한다.

#library(ggplot2)
ggplot(data05, aes(x=temperature, y=production)) + geom_point() + stat_smooth(method = "lm")
# 95% 신뢰구간

#install.packages("plotly")

library(plotly)

t = ggplot(data05, aes(x=temperature, y=production)) + geom_point() + stat_smooth(method = "lm", level = 0.95)

# level = 0.99  95% 신뢰구간 

ggplotly(t)

이제 위에서 분석한 결과를 그림으로 그려보면 위와 같이 나오는데 예상한 대로 우상향하는 직선으로 비례 관계를 보여주고 있다. 아래 그림은 인터액티브 그래프로 그렸다.  짙은 회색으로 된 구간이 그려져 있는데,  모수(평균)가 구간에 있을 확률이 95%이다. (95% 신뢰구간)

########################## 몬타나 주의  평균기온과  밀 산출량과의 관계 ############

data06 = read.csv("data/montana_annual_average_temperature.csv", sep = ",", stringsAsFactor = FALSE)

head(data06, 10)

head는 상위 10개의 데이터를 항목별로 보여준다. 몬타나 주의 해당년도의 평균기온과 밀 생산량을 보여주고 있는데 단위는 백만 bushel 이다.

str(data06)

str()은 각 변수의 속성에 대해서 알려준다. data05은 데이터 프레임이고 , 23개의 관측치, 5개 변수로 구성되어 있다는 걸 알 수 있다.

summary(data06)

눈여겨 볼 것은 몬타나 주의  강수량과 밀의 최소 생산량, 제1사분위수, 제2사분위수(중앙값), 평균, 제3사분위수 , 최고생산량이다.

stem(data06$temperature)
hist(data06$temperature)
boxplot(data06$temperature)

stem(data06$production)
hist(data06$production)
boxplot(data06$production)

temperature 과 production 의  stem() , hist(), boxplot() 을 살펴 봤지만 정상으로 보이고 극단치는 없었다. 

library(ggplot2)


#### Ho(귀무가설): 몬타나 주의  평균기온과 몬타나 주의 밀 생산량은 비례하지 않는다. 

#### Ha(대립가설): 몬타나 주의  평균기온과 몬타나 주의 밀 생산량은 비례한다.


fit = lm(production ~ temperature, data = data06)

summary(fit)

회귀분석 결과  Coefficients: 부분을 살펴보자. y절편(Intercept)은  -233.500, 기울기는  9.188 이다.
p값(p-value)은 0.0275 로  낮은편이다. 즉 production 와 temperature 는 다음과 같은 관계가 성립한다.

production = -233.500 + 9.188 × temperature


cor.test(data06$production, data06$temperature)

상관분석 결과 상관계수(r) 값은 0.4693677  이며 이 값의 제곱은  0.2203 로 회귀분석결과에서 나온 Multiple R-squared 값과 정확히 일치한다. P-Value 는 0.02754 로   작은편이다.  0.05보다 작으므로 귀무가설을 기각하고 대립가설을 채택한다. 따라서 밀의 생산량과 평균기온 사이에는 비례 관계가 성립한다.

#library(ggplot2)
ggplot(data06, aes(x=temperature, y=production)) + geom_point() + stat_smooth(method = "lm")
# 95% 신뢰구간

#install.packages("plotly")

library(plotly)

t = ggplot(data06, aes(x=temperature, y=production)) + geom_point() + stat_smooth(method = "lm", level = 0.95)

# level = 0.99  95% 신뢰구간 

ggplotly(t)

이제 위에서 분석한 결과를 그림으로 그려보면 위와 같이 나오는데 예상한 대로 우상향하는 직선으로 비례 관계를 보여주고 있다. 아래 그림은 인터액티브 그래프로 그렸다.  짙은 회색으로 된 구간이 그려져 있는데,  모수(평균)가 구간에 있을 확률이 95%이다. (95% 신뢰구간)


########################## 워싱턴 주의  평균기온과  밀 산출량과의 관계 ############


data07 = read.csv("data/washington_annual_average_temperature.csv", sep = ",", stringsAsFactor = FALSE)

head(data07, 10)

head는 상위 10개의 데이터를 항목별로 보여준다. 워싱턴 주 주의 해당년도의 평균기온과 밀 생산량을 보여주고 있는데 단위는 백만 bushel 이다.

str(data07)

str()은 각 변수의 속성에 대해서 알려준다. data05은 데이터 프레임이고 , 22개의 관측치, 5개 변수로 구성되어 있다는 걸 알 수 있다.

summary(data07)

눈여겨 볼 것은 워싱턴 주의  강수량과 밀의 최소 생산량, 제1사분위수, 제2사분위수(중앙값), 평균, 제3사분위수 , 최고생산량이다.


stem(data07$temperature)
hist(data07$temperature)
boxplot(data07$temperature)


stem(data07$production)
hist(data07$production)
boxplot(data07$production)

temperature 과 production 의  stem() , hist(), boxplot() 을 살펴 봤지만 정상으로 보이고 극단치는 없었다.

library(ggplot2)

#### Ho(귀무가설): 워싱턴 주의  평균기온과 워싱턴 주의 밀 생산량은 비례하지 않는다. 

#### Ha(대립가설): 워싱턴 주의  평균기온과 워싱턴 주의 밀 생산량은 비례한다.


fit = lm(production ~ temperature, data = data07)

summary(fit)

회귀분석 결과  Coefficients: 부분을 살펴보자. y절편(Intercept)은  -171.736, 기울기는  6.631  이다.
p값(p-value)은 0.00511 로  낮은편이다. 즉 production 와 temperature 는 다음과 같은 관계가 성립한다.

production = -171.736 +  6.631 × temperature

cor.test(data07$production, data07$temperature)

상관분석 결과 상관계수(r) 값은 0.575106   이며 이 값의 제곱은  0.3307 로 회귀분석결과에서 나온 Multiple R-squared 값과 정확히 일치한다. P-Value 는 0.00511  로   작은편이다.  0.05보다 작으므로 귀무가설을 기각하고 대립가설을 채택한다. 따라서 밀의 생산량과 평균기온 사이에는 비례 관계가 성립한다.

#library(ggplot2)
ggplot(data07, aes(x=temperature, y=production)) + geom_point() + stat_smooth(method = "lm")
# 95% 신뢰구간

#install.packages("plotly")

library(plotly)

t = ggplot(data07, aes(x=temperature, y=production)) + geom_point() + stat_smooth(method = "lm", level = 0.95)

# level = 0.99  95% 신뢰구간 

ggplotly(t)

이제 위에서 분석한 결과를 그림으로 그려보면 위와 같이 나오는데 예상한 대로 우상향하는 직선으로 비례 관계를 보여주고 있다. 아래 그림은 인터액티브 그래프로 그렸다.  짙은 회색으로 된 구간이 그려져 있는데,  모수(평균)가 구간에 있을 확률이 95%이다. (95% 신뢰구간)

########################## 오클라호마 주의  평균기온과  밀 산출량과의 관계 ############


data08 = read.csv("data/oklahoma_annual_average_temperature_revised.csv", sep = ",", stringsAsFactor = FALSE)

head(data08, 10)

head는 상위 10개의 데이터를 항목별로 보여준다. 워싱턴 주 주의 해당년도의 평균기온과 밀 생산량을 보여주고 있는데 단위는 백만 bushel 이다.

str(data08)

str()은 각 변수의 속성에 대해서 알려준다. data05은 데이터 프레임이고 , 22개의 관측치, 6개 변수로 구성되어 있다는 걸 알 수 있다.

summary(data08)

눈여겨 볼 것은 오클라호마 주의  강수량과 밀의 최소 생산량, 제1사분위수, 제2사분위수(중앙값), 평균, 제3사분위수 , 최고생산량이다.

stem(data07$temperature)
hist(data07$temperature)
boxplot(data07$temperature)

stem(data08$production)
hist(data08$production)
boxplot(data08$production)

temperature 과 production 의  stem() , hist(), boxplot() 을 살펴 봤지만 temperature 는 정상으로 보이고 production 에는 극단치가 1개 있었다. (198.9)

library(ggplot2)

#### Ho(귀무가설): 오클라호마 주의  평균기온과 오클라호마 주의 밀 생산량은 비례하지 않는다. 

#### Ha(대립가설): 오클라호마 주의  평균기온과 오클라호마 주의 밀 생산량은 비례한다.



fit = lm(production ~ temperature, data = data08)

summary(fit)


회귀분석 결과  Coefficients: 부분을 살펴보자. y절편(Intercept)은 -469.987, 기울기는  9.804  이다.
p값(p-value)은 0.00717 로  낮은편이다. 즉 production 와 temperature 는 다음과 같은 관계가 성립한다.


production = -469.987 +  9.804 × temperature


cor.test(data08$production, data08$temperature)

상관분석 결과 상관계수(r) 값은 0.5684504    이며 이 값의 제곱은  0.3231 로 회귀분석결과에서 나온 Multiple R-squared 값과 정확히 일치한다. P-Value 는 0.007173로   작은편이다.  0.05보다 작으므로 귀무가설을 기각하고 대립가설을 채택한다. 따라서 밀의 생산량과 평균기온 사이에는 비례 관계가 성립한다.

#library(ggplot2)
ggplot(data08, aes(x=temperature, y=production)) + geom_point() + stat_smooth(method = "lm")
# 95% 신뢰구간

#install.packages("plotly")

library(plotly)

t = ggplot(data08, aes(x=temperature, y=production)) + geom_point() + stat_smooth(method = "lm", level = 0.95)

# level = 0.99  95% 신뢰구간 

ggplotly(t)

이제 위에서 분석한 결과를 그림으로 그려보면 위와 같이 나오는데 예상한 대로 우상향하는 직선으로 비례 관계를 보여주고 있다. 아래 그림은 인터액티브 그래프로 그렸다.  짙은 회색으로 된 구간이 그려져 있는데,  모수(평균)가 구간에 있을 확률이 95%이다. (95% 신뢰구간)

#### 요약 : 5개 주  모두 연평균 기온과 밀 생산량은 비례한다. 

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

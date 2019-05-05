## 1. 밀의 생산량과 가격의 상관관계  -  " 밀의 가격과 공급 사이에는 수요/공급의 법칙이 적용될까?


library(ggplot2)
options(scipen = 100)

data01 = read.csv("data/price_table04.csv", sep = ",", stringsAsFactor = FALSE)

head(data01, 10)

head는 상위 10개의 데이터를 항목별로 보여줍니다. 

str(data01)

str()은 각 변수의 속성에 대해서 알려줍니다. data01은 데이터 프레임이고 , 30개의 관측치, 11개 변수로 구성되어 있다는 걸 알 수 있습니다.  두 번째 행의 year number 는 세 번째 행의 year 에 대한 id 이고 네 번째 행은 bushel(27.2kg) 당 밀의 연평균 가격을, 다섯 번째 행은 매년 미국 전체의 밀 생산량을 나타내는 단위로 1000부터 시작한다.  2059557은 실제로 2,059,557,000 bushel을 가리킨다. 

summary(data01$annual.avg.price.per.bushel)

annual.avg.price.per.bushel은  부셸당 밀의 연평균 가격을 뜻하고  최저가격은 112달러, 제1사분위수는 146.5달러, 제2사분위수는 167달러이며 중앙값이다. 평균은 189.7달러, 제3사분위수는 219.5달러, 최고가격은 326달러이다.

사분위수란(Quartile)?
  
자료를 크기 순으로 배열하고, 누적 백분율을 4 등분한 각 점에 해당하는 값을 말한다. 제1사분위수(1st quartile)는 누적 백분율이 25%에 해당하는 점수이고, 제2사분위수(2nd quartile)는 누적 백분율이 50%, 제3사분위수(3rd quartile)는 75%, 제4사분위수(4th quartile)는 100%에 해당하는 점수이다. 특히 제2사분위수는 누적 백분율이 50%이므로 개념적으로 중앙값과 동일하다.


summary(data01$wheat.production.by.thousand.bushels)

wheat.production.by.thousand.bushels 은 매년 미국 전체의 밀 생산량을 뜻하고 최저생산량은 1,993,111,000 부셸, 제1사분위수는 2,092,732,000 부셸, 제2사분위수는 2,159,907,000 부셸이며 중앙값이다. 평균은 2,178,819,000 부셸, 제3사분위수는 2,298,589,000 부셸, 최고생산량은 2,364,627,000 부셸 이다.


stem(data01$annual.avg.price.per.bushel)

stem함수는 자료값을  나무의 줄기와 잎처럼 그려줍니다. 

hist(data01$annual.avg.price.per.bushel)

히스토그램은 값의 빈도를 막대길이로 표현한 그래프입니다. 히스토그램을 보면 어떤 값을 지닌 데이터가 많은지 전반적인 분포를 알 수 있습니다.  X축에는 변수의 값이 표현되어 있고 Y축에는 각 계급구간의 빈도가 표현되어 있습니다.  위 히스토그램의 경우 100~200달러 사이에 자료값이 집중되어 있다.

boxplot(data01$annual.avg.price.per.bushel)



library(gridExtra)


g1=ggplot(data=data01, aes(x=year, y=annual.avg.price.per.bushel)) + geom_line()+geom_point()
g2=ggplot(data=data01, aes(x=year, y=wheat.production.by.thousand.bushels)) + geom_line() + geom_point()
grid.arrange(g1, g2, ncol=2)


library(dygraphs)
library(xts) 

ue = xts(data01$annual.avg.price.per.bushel, order.by = data01$year)%>% dyRangeSelector()

dygraph(ue)

ue2 = xts(data01$wheat.production.by.thousand.bushels, order.by = data01$year)%>% dyRangeSelector()

dygraph(ue2)

grid.arrange(ue1, ue2, ncol=2)



cor.test(data01$wheat.production.by.thousand.bushels, data01$annual.avg.price.per.bushel)

library(ggplot2)

#fit = lm(annual.avg.price.per.bushel ~ Baltic.Dry.Index, data = data01)

#plot (data01$annual.avg.price.per.bushel ~ data01$Baltic.Dry.Index)
#lines(lowess(data01$annual.avg.price.per.bushel ~ data01$Baltic.Dry.Index))

fit = lm(annual.avg.price.per.bushel ~ wheat.production.by.thousand.bushels, data = data01)


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

ggplot(data01, aes(x=annual.avg.price.per.bushel, y=wheat.production.by.thousand.bushels)) + geom_point() + stat_smooth(method = "lm")

# 95% 신뢰구간  

# + theme(axis.text.x = element_text(angle=45, vjust=0.6) # 글씨의 기울기

library(plotly)

#t = ggplot(data01, aes(x=Baltic.Dry.Index, y=annual.avg.price.per.bushel)) + geom_point() + stat_smooth(method = "lm", level = 0.99)

t = ggplot(data01, aes(x=annual.avg.price.per.bushel, y=wheat.production.by.thousand.bushels)) + geom_point() + stat_smooth(method = "lm", level = 0.99)

# level = 0.99  99% 신뢰구간 

ggplotly(t)

## 1. 밀의 생산량과 가격의 상관관계  -  " 밀의 가격과 공급 사이에는 수요/공급의 법칙이 적용될까?


library(ggplot2)
options(scipen = 100)

data01 = read.csv("data/price_table04.csv", sep = ",", stringsAsFactor = FALSE)

head(data01, 10)

head는 상위 10개의 데이터를 항목별로 보여준다. 

str(data01)

str()은 각 변수의 속성에 대해서 알려준다. data01은 데이터 프레임이고 , 30개의 관측치, 11개 변수로 구성되어 있다는 걸 알 수 있다.  두 번째 행의 year number 는 세 번째 행의 year 에 대한 id 이고 네 번째 행은 bushel(27.2kg) 당 밀의 연평균 가격을, 다섯 번째 행은 매년 미국 전체의 밀 생산량을 나타내는 단위로 1000 bushel부터 시작한다.  2059557은 실제로 2,059,557,000 bushel을 가리킨다. 

summary(data01$annual.avg.price.per.bushel)

annual.avg.price.per.bushel은  부셸당 밀의 연평균 가격을 뜻하고  최저가격은 112달러, 제1사분위수는 146.5달러, 제2사분위수는 167달러이며 중앙값이다. 평균은 189.7달러, 제3사분위수는 219.5달러, 최고가격은 326달러이다.

사분위수란(Quartile)?
  
자료를 크기 순으로 배열하고, 누적 백분율을 4 등분한 각 점에 해당하는 값을 말한다. 제1사분위수(1st quartile)는 누적 백분율이 25%에 해당하는 점수이고, 제2사분위수(2nd quartile)는 누적 백분율이 50%, 제3사분위수(3rd quartile)는 75%, 제4사분위수(4th quartile)는 100%에 해당하는 점수이다. 특히 제2사분위수는 누적 백분율이 50%이므로 개념적으로 중앙값과 동일하다.


summary(data01$wheat.production.by.thousand.bushels)

wheat.production.by.thousand.bushels 은 매년 미국 전체의 밀 생산량을 뜻하고 최저생산량은 1,993,111,000 부셸, 제1사분위수는 2,092,732,000 부셸, 제2사분위수는 2,159,907,000 부셸이며 중앙값이다. 평균은 2,178,819,000 부셸, 제3사분위수는 2,298,589,000 부셸, 최고생산량은 2,364,627,000 부셸 이다.


stem(data01$annual.avg.price.per.bushel)

stem함수는 자료값을  나무의 줄기와 잎처럼 그려준다. 

hist(data01$annual.avg.price.per.bushel)

히스토그램은 값의 빈도를 막대길이로 표현한 그래프이다. 히스토그램을 보면 어떤 값을 지닌 데이터가 많은지 전반적인 분포를 알 수 있다.  X축에는 변수의 값이 표현되어 있고 Y축에는 각 계급구간의 빈도가 표현되어 있다.  위 히스토그램의 경우 100~200달러 사이에 자료값이 집중되어 있다.

boxplot(data01$annual.avg.price.per.bushel)

박스플롯(상자그림)은 데이터의 분포를 직사각형의 상자 모양으로 표현한 그래프이다. 상자 그림을 보면 데이터의 분포를 한 눈에 알 수 있다. 상자 그림에는 중심에서 멀리 떨어진 극단치가 점으로 표현되는데, 이를 이용해서 극단치의 기준을 정할 수 있다.  

[상자 그림]	              [값]	          [설명]
상자 아래 세로 점선 	    아랫수염	      하위0~25% 내에 해당하는 값
상자 밑면	                1사분위수(Q1)	  하위 25% 위치 값
상자 내 굵은 선	          2사분위수(Q2)	  하위 50% 위치 값(중앙값)
상자 윗면	                3사분위수(Q3)	  하위 75% 위치 값
상자 위 세로 점선	        윗수염	        하위75~100% 내에 해당하는 값
상자 밖 가로선	          극단치 경계	    Q1, Q3 밖 1.5 IQR 내 최대값
상자 밖 점 표식	          극단치	        Q1, Q3 밖 1.5 IQR을 벗어난 값

※ 1.5 IQR은 사분위 범위(Q1~Q3 간 거리)의 1.5배를 의미한다.




library(gridExtra)
library(plotly)

g1=ggplot(data=data01, aes(x=year, y=annual.avg.price.per.bushel)) + geom_line(color="blue")+geom_point()

ggplotly(g1)

위 그림은 시간의 흐름에 따른 부셸당 밀의 연평균 가격을 파란색의 꺾은선 그래프로 나타내었다. 인터액티브 그래프로 그려졌기 때문에 검은색 점에 커서를 갖다 대면  해당년도의 밀의 연평균 가격을 알 수 있다.  단위는 US dollar 이다.


g2=ggplot(data=data01, aes(x=year, y=wheat.production.by.thousand.bushels)) + geom_line(color="red") + geom_point()

ggplotly(g2)


위 그림은 시간의 흐름에 따른 매년 미국 전체의 밀 생산량을 빨간색의 꺾은선 그래프로 나타내었다. 인터액티브 그래프로 그려졌기 때문에 검은색 점에 커서를 갖다 대면  해당년도의 미국 전체의 밀 생산량을 알 수 있다.  단위는 1000 bushel 이다.









library(ggplot2)

선형모형을 사용하여 회귀분석을 해보면 다음과 같다.

fit = lm( annual.avg.price.per.bushel ~ wheat.production.by.thousand.bushels, data = data01)
summary(fit)

회귀분석 결과: Coefficients 부분을 살펴보자. y절편(Intercept)은 1003.06553546, 기울기는 -0.00037331 이다. p값(p-value)은 0.000193 로 매우 낮다. 즉 몸무게(파운드)와 키(인치)는 다음과 같은 관계가 성립한다.

annual.avg.price.per.bushel = 1003.06553546  -0.00037331 × wheat.production.by.thousand.bushels

기울기의 값이 마이너스이므로 그래프로 그리면 우하향하는 직선일 것이다.  그리고 밀의 생산량과 가격 사이에는 반비례 관계가 성립한다. 즉, 수요/공급의 법칙이 성립한다.  


cor.test(data01$wheat.production.by.thousand.bushels, data01$annual.avg.price.per.bushel)

상관분석 결과: 상관계수(r) 값은 -0.6295909이며 이 값의 제곱은 0.3964로 회귀분석결과에서 나온 Multiple R-squared 값과 정확히 일치한다. 


ggplot(data01, aes(x=wheat.production.by.thousand.bushels, y=annual.avg.price.per.bushel)) + geom_point() + stat_smooth(method = "lm")



library(plotly)


t=ggplot(data01, aes(x=wheat.production.by.thousand.bushels, y=annual.avg.price.per.bushel)) + geom_point() + stat_smooth(method = "lm", level=0.95)

ggplotly(t)

이제 위에서 분석한 결과를 그림으로 그려보면 위와 같이 나오는데 예상한 대로 우하향하는 직선으로 반비례 관계를 보여주고 있다.  짙은 회색으로 된 구간이 그려져 있는데,  모수(평균)이 이 구간에 있을 확률이 95%이다. (95% 신뢰구간) 

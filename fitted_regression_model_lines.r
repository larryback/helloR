library(ggplot2)
#install.packages("gcookbook")
library(gcookbook) #예제 자료

#예자 자료를 활용해서 산점도를 그리고 그위에 회귀 모델 선을 추가해 보자.

sp=ggplot(heightweight, aes(x=ageYear, y=heightIn))

sp+geom_point()+stat_smooth(method=lm) 

#ggplot() 주체에 해당하는 부분을 sp<-에 할당하고, 할당된 객체 sp를 이용해서 손쉽게 ggplot()정보를 재사용 #가능하다.

#그리고 +geom+point()라는 행동과, stat_smooth(method=lm)행동이 추가 되어 그래프를 형성한다.

#geom_point()는 산점도를 그리는 명령어 이고, stat_smooth()는 굴곡선을 그리는 옵션이고, 그안에 method=lm을 #함으로써 회귀식 모델 선을 추가하라는 의미가 된다.

#그리고, 선을 중심으로 그려지는 음영지역은 기본값이 95%신뢰 영역이다.



#99%신뢰 구간 - level을 이용하여 조정가능

sp+geom_point()+stat_smooth(method=lm, level=0.99)

#신뢰구간을 표시하지 않는 방법

sp + geom_point() + stat_smooth(method=lm, se=FALSE)

sp + geom_point() + stat_smooth(method=lm, level=FALSE)

sp + geom_point() + stat_smooth(method=lm, level=0)


#색갈 표현

sp + geom_point(colour="grey60") +
  stat_smooth(method=lm, se=FALSE, colour="black")

#ggplot2에 속해 있는 대부분에 geom_**(), stat_*** 은 colour 옵션을 가지고 있다.

#산점도에 선을 피팅하는 방법이 회귀선만 있는 것은 아니다.


sp + geom_point(colour="grey60") + stat_smooth(method=loess)

#loess방법은 비모수적 방법의 회귀 분석 방법이다. 선형회귀가 아닌 비선형 회귀 분석 방법이다.

#하지만 loess의 경우에는 회귀식을 구할 수 없다.(loess에 대한 자세한 설명은 다른 통계책 참조 바람)


#이번엔 로지스틱 모델을 피팅하기 위해서 library(MASS)에 예제를 사용하여 구현해 보자.

#우선 0과 1을 결과값으로 갖는 데이터로 변환 시킨다.

#install.packages("MASS")
library(MASS)

b = biopsy
b$classn[b$class=="benign"] = 0
b$classn[b$class=="malignant"] = 1


#분석할 데이터는 b, x축은 v1이며, y축은 classn으로 설정하고, stat_smooth()에 method=glm과 family=binomial을 #사용한다.

ggplot(b, aes(x=V1, y=classn)) +
  geom_point(position=position_jitter(width=0.3, height=0.06), alpha=0.4,
             shape=21, size=1.5) +
  stat_smooth(method=glm, family=binomial)

#이번에는 그룹에 따라서 두가지의 회귀 식이 생성된다.



sps = ggplot(heightweight, aes(x=ageYear, y=heightIn, colour=sex)) +
  geom_point() +scale_colour_brewer(palette="Set1")

sps+geom_smooth()


#sps는 gpplot()과, geom_point(),scale_colour_brewer()까지 할당 시켜서 사용했다.
#colour=sex를 통해 성별에 따른 그룹에 색이 다르게 표현 되게 하였고,
#geom_smooth()또한 나누어진 그룹별로 선이 생성됨을 보인다.

#geom_smooth()안에 아무것도 넣지않으면, 자동적으로 loess선이 생성된다.



sps+geom_smooth(method=lm, se=FALSE, fullrange=TRUE)


#산점도위에 피팅하는 방법들이 어느 것이 제일 좋은 가를 따지기 보다는 어떠한 상황에서
#어떠한 피팅 방법들이 더 효과적이게 데이터를 설명할 수 있는지 고민하고 결정하는 것이 바람직 하다.

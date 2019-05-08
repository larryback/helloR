# 분석의 배경과 방식 


## 1. 배경 

심심찮게 국제뉴스를 통해서 가뭄이 들거나 폭염이 심해지면 국제 곡물가격의 폭등을 예상하는 것을 들을 수 있다. 하지만 뉴스들의 공통적인 특징은 대개 그 뉴스가 발표 될 시점이면 이미 그 자연 현상이 시장에 반영되어서 그 뉴스 보고 나서 곡물 펀드나 ETF 또는 선물에 투자한 일반투자자들은 대개 꼭지점을 물리고서 보초를 서거나 선물의 경우 만기일에 청산된다. 

그래서 과연 온도나 강수량에 곡물 중 많은 비중을 차지하는 밀의 작황에 얼마나 영향을 미치고 이것이 어느 정도 시장에 반영되는지 알아보고자 분석을 시작하게 되었다. 


## 2. 방식

분석 방식은 상관분석을 통해서 두 변수가 서로 관련이 있는지 확인해 볼 것이다. 또한 상관 분석을 통해 도출한 상관계수(Correlation Coefficient)로 두 변수 사이가 얼마나 관련되어 있는지 , 관련성의 정도를 파악할 것이다.  상관계수(r)는 -1 ~ +1 사이의 값을 지니고 있고 1에 가까울수록 관련성이 크다는 것을 의미한다.  

•	Exactly –1. A perfect downhill (negative) linear relationship
•	–0.70. A strong downhill (negative) linear relationship
•	–0.50. A moderate downhill (negative) relationship
•	–0.30. A weak downhill (negative) linear relationship
•	0. No linear relationship
•	+0.30. A weak uphill (positive) linear relationship
•	+0.50. A moderate uphill (positive) relationship
•	+0.70. A strong uphill (positive) linear relationship
•	Exactly +1. A perfect uphill (positive) linear relationship


## 3. 기본가정

(1). 선형성 
선형성은 "선형" 회귀분석에서 중요한 기본가정으로, 당연히 "비선형" 회귀분석에서는 해당하지 않는다. 선형성이란, 예측하고자 하는 종속변수 y와 독립변수 x 간에 선형성을 만족하는 특성을 의미한다.

(2). 등분산성
등분산성이란 분산이 같다는 것이고, 분산이 같다는 것은 특정한 패턴 없이 고르게 분포했다는 의미이다.

(3). 정규성
정규성은 또한 잔차(residual)가 정규성을 만족하는지 여부로, 정규분포를 띄는지 여부를 의미한다.


## 4. 모형

통계학에서, 선형 회귀(線型回歸, 영어: linear regression)는 종속 변수 y와 한 개 이상의 독립 변수 (또는 설명 변수) X와의 선형 상관 관계를 모델링하는 회귀분석 기법이다. 한 개의 설명 변수에 기반한 경우에는 단순 선형 회귀, 둘 이상의 설명 변수에 기반한 경우에는 다중 선형 회귀라고 한다.

선형 회귀는 선형 예측 함수를 사용해 회귀식을 모델링하며, 알려지지 않은 파라미터는 데이터로부터 추정한다. 이렇게 만들어진 회귀식을 선형 모델이라고 한다.

분석의 편의를 위해 단순 선형회귀 방식을 선택했고 밀의 산출량과 기상요인의 상관관계를 나타내기 위해서 일차방정식을 사용하였다. 

Y = aX + b + e (오차, 기술변화, 천재지변 등 관찰되지 않는 변수) 
위 식은 Y = aX + c 로 바꾸어 쓸 수 있다. 

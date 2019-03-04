#3 midwest 데이터를 data.frame으로 불러온 후, 데이터의 특징을 설명하시오.

mpg = as.data.frame(ggplot2::mpg)
library(dplyr)
library(ggplot2)
summary(mpg)

library(dplyr)
library(ggplot2)
midwest = as.data.frame(ggplot2::midwest)

head(midwest) # Raw 데이터 앞부분 확인. 6행의 데이타와 28개 필드로 구성
tail(midwest) # Raw 데이터 뒷부분 확인. 6행의 데이타와 28개 필드로 구성

View(midwest) # View 창을 통해서 원자료를 직접 보여 준다. 
dim(midwest)  # 데이타 프레임이 437행 28열로 구성 되어 있다. 

str(midwest)  # midwest 데이터가 데이터 프레임이고 437개 관측치, 28개 변수로 구성되어 있다. PID는 변수값이 int 이고 연속된 숫자로 되어 
# 있는 것으로 봐서 primary key 로 생각된다. county는 변수값이 character 이고 "ADAMS"로 부터 시작된다. 그 밑으로도 같은 방식으로 각 변수
#들의 속성과 몇개의 값을 보여 주고 있다. chr은 문자, num 은 소수점이 있는 실수, int 는 소수점이 없는 정수를 나타낸다.

summary(midwest) # summary는 28개 변수의 요약 통계량을 보여준다. 숫자로된 여섯가지의 요약 통계량을 보여주고 , 문자로 된 변수는 
#요약 통계량을 구할 수 없으니 값의 개수와 변수의 속성을 보여준다. 인구밀도를 나타내는 popdensity를 보면 최소값은 85.05,
#최대값은 88018.40, 평균은 3097.74, 중위값 1156.21을 중심으로 1st Quantile  622.41 과  3rd Quantile  2330.00 사이에 인구밀도 값이 
#몰려 있다.  



#options(encoding='-8')



#4 poptotal 변수(컬럼)를 total로, popasian 변수를 asian으로 변수명을 변경하는 코드를 작성하시오.

midwest = as.data.frame(ggplot2::midwest)
midwest_new = midwest
midwest_new = rename(midwest_new, total = poptotal )
midwest_new = rename(midwest_new, asian = popasian )

#5 total, asian 변수를 이용해 `전체 인구 대비 아시아계 인구 백분율` 파생변수(asianpct)를 추가하고, 히스토그램을 그려, 주들이 어떻게 분포하는지 설명하시오.

midwest_new$asianpct = midwest_new$asian/midwest_new$total * 100
hist(midwest_new$asianpct)
qplot(midwest_new$asianpct)
#일리노이주 Du Page 와 Champaign county에 각각 5.070%, 4.642% 로 아시아계 사람들이 몰려 있다.  



#6 아시아계 인구 백분율(asianpct)의 전체 평균을 구하고, 평균을 초과하면 "lg", 그 외는 "sm"을 부여하는 파생변수(asianrate)를 추가하는 코드를 작성하시오.

mean(midwest_new$asianpct)
##[1] 0.4872462
midwest_new$group = ifelse(midwest_new$asianpct > 0.4872462, "lg", "sm")

#7 "lg"와 "sm"에 해당하는 지역이 얼마나 되는지 빈도 막대그래프(qplot)을 그려보시오.

table(midwest_new$group)

##  lg   sm
##  119  318

library(ggplot2)
qplot(midwest_new$group)

#1 mpg 데이터에서 통합 연비(도시와 고속도로)가 높은 순으로 출력하시오.

mpg = as.data.frame(ggplot2::mpg)
library(ggplot2)
library(dplyr)

?mpg
mpg$total = (mpg$cty + mpg$hwy)/2  # 통합연비 변수

mpg %>% arrange(desc(mpg$total)) # 통합연비가 높은 순으로 출력


#2 mpg 데이터에서 생산연도별 연료 종류에 따른 통합연비를 연도순으로 출력하시오.

mpg = as.data.frame(ggplot2::mpg)
library(ggplot2)
library(dplyr)

mpg$total = (mpg$cty + mpg$hwy)/2  # 통합연비 변수

aggregate(total ~ (mpg$year + mpg$fl))

##
x = aggregate(data=mpg, cthw-(year+fl), mean)
x[order(x$year)]












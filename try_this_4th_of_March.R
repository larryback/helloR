#3 midwest 데이터를 data.frame으로 불러온 후, 데이터의 특징을 설명하시오.

mpg = as.data.frame(ggplot2::mpg)
library(dplyr)
library(ggplot2)
summary(mpg)

library(dplyr)
library(ggplot2)
midwest = as.data.frame(ggplot2::midwest)
head(midwest)
tail(midwest)
View(midwest)
dim(midwest)
str(midwest)
summary(midwest)






#4 poptotal 변수(컬럼)를 total로, popasian 변수를 asian으로 변수명을 변경하는 코드를 작성하시오.

midwest = as.data.frame(ggplot2::midwest)
midwest_new = midwest
midwest_new = rename(midwest_new, total = poptotal )
midwest_new = rename(midwest_new, asian = popasian )

#5 total, asian 변수를 이용해 `전체 인구 대비 아시아계 인구 백분율` 파생변수(asianpct)를 추가하고, 히스토그램을 그려, 도시들이 어떻게 분포하는지 설명하시오.

midwest_new$asianpct = midwest_new$asian/midwest_new$total * 100
hist(midwest_new$asianpct)


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

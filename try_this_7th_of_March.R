#1. mpg데이터에서 차종(class)가 suv, compact인 자동차의 모델과 연비관련 변수만 출력하세요.

library(dplyr)
library(ggplot2)
mpg %>%
  filter(class == c('compact' & 'suv')) %>% 
  select(cty,hwy) %>%
  head




#2. mpg데이터에서 고속도로연비(hwy) 1 ~ 5위에 해당하는 자동차의 데이터를 출력하세요.

mpg %>% arrange(desc(hwy)) %>% slice(1:5)


###### Try This : dplyr #############
# 1 mpg데이터에서 차종(class)가 suv, compact인 자동차의 모델과 연비관련 변수만 출력하세요.


mpg = as.data.frame(ggplot2::mpg)
mpg
mpg %>% filter(class %in% c('suv', 'compact')) %>%
  select(model, cty, hwy) %>% head

# 2 mpg데이터에서 고속도로연비(hwy) 1 ~ 5위에 해당하는 자동차의 데이터를 출력하세요.

mpg %>% arrange(desc(hwy)) %>% head(5)

# 3회사별로 suv 차들의 통합연비(회사 평균) 구해 회사들의 1 ~ 5위를 출력하세요.

mpg %>%
  filter(class == 'suv') %>%
  group_by(manufacturer) %>%
  summarise(m = mean( (cty + hwy) / 2)) %>%
  arrange(desc(m)) %>%
  head(5)

# 4 다음과 같이 연료별 가격이 정해져 있을 때, mpg에 fl_price라는 컬럼을 추가하세요.

t = table(mpg$fl)
n = names(t)
n
dput(n)


flpr = data.frame(fl = c("c", "d", "e", "p", "r"),
                  price = c(1.33, 1.02, 0.92, 1.99, 1.22), stringsAsFactors = F )
flpr
class(mpg$fl)

mpg = inner_join(mpg, flpr, by=c('fl', 'fl')) %>% rename(fl_price = price) %>% head
mpg

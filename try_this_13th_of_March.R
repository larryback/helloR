# Try This : gglot2

#1. mpg데이터에서 연도별 배기량에 따른 통합연비를
#꺽은선으로 그리시오.
#(단, cty는 회색, hwy는 파란색, 2008년은 굵은 선으로 표현하시오)
<<<<<<< HEAD

library(ggplot2)
library(dplyr)

d2 = mpg %>% group_by(manufacturer, year, displ) %>% 
  summarise(m1 = mean(cty), m2 = mean(hwy))



ggplot(d2, aes(x=displ)) + 
  geom_line(aes(y=m1, color='cty' )) + 
  geom_line(aes(y=m2, color='hwy' ), size = 1) +
 
  #geom_line(aes(y=m3, color='hwy' ), size = 1) +
  
  scale_colour_manual("color", breaks = c("cty", "hwy" ),
                      values = c("gray", "blue")) +
  xlab("배기량(cc)") +
  xlim(1, 8) +
  scale_y_continuous("연비(M/h)", limits = c(5, 45)) +
=======
library(ggplot2)
library(dplyr)
mpg = as.data.frame(ggplot2::mpg)



d2 = mpg %>% group_by(year, displ) %>% 
  summarise(m1 = mean(cty), m2 = mean(hwy))


ggplot(d2, aes(x=displ)) + 
  geom_line(aes(y=m1, color='cty' )) + 
  geom_line(aes(y=m2, color='hwy' )) +
 
  ggplot(d2, aes(x=dcpl, y=m1+m2, colour=year, group=year)) + 
  +   geom_line() + 
  
  
  #geom_line(aes(y=m3, color='hwy' ), size = 1) +
  
 
  scale_colour_manual("color", breaks = c("cty", "hwy"),
                      values = c("gray", "blue")) +
  xlab("배기량") +
  xlim(1, 8) +
  scale_y_continuous("연비", limits = c(5, 45)) +
>>>>>>> c4f9cde25e524ebf327f3be2b20fc44de2e45d4c
  labs(title = '연도별 통합연비', subtitle = '굵은선은 2008년') 






<<<<<<< HEAD
#2. data(성적.csv) 데이터에서 국어 성적이 80점 이상인  학생들의 수를 성비가 보이도록 학급별로 막대그래프를 그리시오.

library(ggplot2)
#data = read.csv("성적.csv")
load("data/data.rda")
=======
#2. data(성적.csv) 데이터에서 국어 성적이 80점 이상인  학생들의 수를 성비가 보이도록 학급별로 막대그래프를 그리시오
library(ggplot2)
data = read.csv("성적.csv")
>>>>>>> c4f9cde25e524ebf327f3be2b20fc44de2e45d4c
options(encoding='utf-8')
library(ggplot2)
library(dplyr)

<<<<<<< HEAD
d3=data %>%
   filter(국어 > 80) %>% 
=======
d4=data %>%
   filter(국어 > 95) %>% 
>>>>>>> c4f9cde25e524ebf327f3be2b20fc44de2e45d4c
   select(학번,반, 국어, 성별) 

ggplot(d3, aes(반)) +
  geom_bar(aes(fill=성별),
           width = 0.5) +
  theme(axis.text.x = element_text(angle=45,       # 글씨의 기울기
                                   vjust=0.6)) +   # 글씨의 하단 맞춤(띄우기)
  scale_fill_discrete(name = "성별") +      # legend
<<<<<<< HEAD
  labs(title = '국어우수학생', subtitle =  '80점이상')
=======
  labs(title = '국어성적 80점이상인 학생 그래프', subtitle = '남녀 성별 구분')
>>>>>>> c4f9cde25e524ebf327f3be2b20fc44de2e45d4c






#3. 국어 성적이 95점 이상인 학생들의학급별 밀도그래프를 그리시오.

library(ggplot2)
<<<<<<< HEAD
#data = read.csv("성적.csv")
load("data/data.rda")
options(encoding='utf-8')
=======

options(encoding='utf-8')
data = read.csv("성적.csv")
>>>>>>> c4f9cde25e524ebf327f3be2b20fc44de2e45d4c
library(ggplot2)
library(dplyr)


d4=data %>%
  filter(국어 > 95) %>% 
<<<<<<< HEAD
  select(학번,반, 성별, 국어, 영어, 수학, 과학, 예체) 

ggplot(d4, aes(국어)) +
  geom_density(aes(fill=factor(반)), alpha=0.8) +
  labs(title="반별국어우수학생", subtitle = "(국어성적A+)",
       caption="기준점수 = 95",
       x = "성적",
       fill = "학급")
=======
  select(학번,반, 국어, 성별) 

ggplot(d4, aes(반)) +
  geom_density(aes(fill=factor(반)), alpha=0.8) +
  labs(title="국어성적 밀도그래프", subtitle = "국어점수95점 이상인 학생들의 학급별 밀도그래프",
       caption="Source: d4",
       x = "국어점수 95점이상 학생들 반",
       fill = "반종류")
>>>>>>> c4f9cde25e524ebf327f3be2b20fc44de2e45d4c









#4. midwest데이터에서 전체인구와  아시아계 인구의 관계를 알아보기 위한  그래프를 그리시오.
#(단, 전체인구는 50만명 이하,    아시아계인구는 1만명 이하만 표시되게 하시오.

library(ggplot2)
midwest = as.data.frame(ggplot2::midwest)
ggplot(data = midwest, aes( x = poptotal, y = popasian )) +
  geom_point() +
  xlim(0, 500000) +
<<<<<<< HEAD
  ylim(0, 10000)









 # ggplot(data = homicide_1980, aes(map_id = state)) + 
  #  geom_map(aes(fill = n),  color= "black", map = fifty_states) + 
   # expand_limits(x = fifty_states$long, y = fifty_states$lat) +
#    coord_map() +
#    geom_text(data = fifty_states %>%
#                group_by(id) %>%
#                summarise(lat = mean(c(max(lat), min(lat))),
#                          long = mean(c(max(long), min(long)))) %>%
#                mutate(state = id) %>%
#                left_join(homicide_1980, by = "state"), aes(x = long, y = lat, label = n))+
#    scale_x_continuous(breaks = NULL) + scale_y_continuous(breaks = NULL) +
#    labs(x = "", y = "") + theme(legend.position = "bottom", 
 #                                panel.background = element_blank())
=======
  ylim(0, 10000)
>>>>>>> c4f9cde25e524ebf327f3be2b20fc44de2e45d4c

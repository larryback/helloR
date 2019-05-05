# 1. 다음과 같이 미국의 범죄율을 한번에 작도하시오.
head(USArrests)    # 미국 범죄율 1973 (R 내장 데이터)    cf. USAccDeaths
str(USArrests)   
rownames(USArrests)
# state 변수가 없이 rownames가 state!!
install.packages('stringi')
library(stringi)
library(tibble) 
library('dplyr')
chodata = rownames_to_column(USArrests, var = 'state')
<<<<<<< HEAD
=======

>>>>>>> c4f9cde25e524ebf327f3be2b20fc44de2e45d4c
chodata$state = tolower(chodata$state)

usmap = map_data('state') 
head(usmap)

<<<<<<< HEAD
=======
install.packages("ggiraphExtra")

>>>>>>> c4f9cde25e524ebf327f3be2b20fc44de2e45d4c
ggiraphExtra::ggChoropleth()   
devtools::install_github("cardiomoon/moonBook2")
library(ggiraphExtra)

head(usmap)


install.packages('mapproj')
<<<<<<< HEAD


library(ggiraphExtra)
library(ggplot2)


b1 = ggChoropleth(data=chodata,
             aes(fill=Murder, map_id=state),
             map = usmap,
             title = '..',
             reverse = F,
             interactive = T)

b2 = ggChoropleth(data=chodata,
             aes(fill=Rape, map_id=state),
             map = usmap,
             title = '..',
             reverse = F,
             interactive = T)

b3 = ggChoropleth(data=chodata,
             aes(fill=Assault, map_id=state),
             map = usmap,
             title = '..',
             reverse = F,
             interactive = T)

b4 = ggChoropleth(data=chodata,
             aes(fill=UrbanPop, map_id=state),
             map = usmap,
             title = '..',
             reverse = F,
             interactive = T)
=======
install.packages('maps')

library(ggiraphExtra)
library(ggplot2)
library('mapproj')

ggChoropleth(data=chodata,
                  aes(fill=Murder, map_id=state),
                  map = usmap,
                  title = '..',
                  reverse = F,
                  interactive = T)

b2 = ggChoropleth(data=chodata,
                  aes(fill=Rape, map_id=state),
                  map = usmap,
                  title = '..',
                  reverse = F,
                  interactive = T)

b3 = ggChoropleth(data=chodata,
                  aes(fill=Assault, map_id=state),
                  map = usmap,
                  title = '..',
                  reverse = F,
                  interactive = T)

b4 = ggChoropleth(data=chodata,
                  aes(fill=UrbanPop, map_id=state),
                  map = usmap,
                  title = '..',
                  reverse = F,
                  interactive = T)
>>>>>>> c4f9cde25e524ebf327f3be2b20fc44de2e45d4c
install.packages('gridExtra')
library(gridExtra)
library(grid)
library(ggplot2)


grid.arrange(b1, b2, b3, b4, ncol=2)

ggChoropleth(data=chodata,
             aes(fill=c(Murder, Assault, UrbanPop,Rape), map_id=state),
             map = usmap, interactive = T)


#2. 미국 범죄율의 Rape부분을 단계 구분도로 작성하시오.(단, 툴팁은 그림과 같이 표현하고, 클릭시 해당 state의 wikipedia 페이지를
#  보이도록 HTML로 저장하시오) http://en.wikipedia.org/wiki/wisconsin
install.packages('stringi')
library(stringi)
tooltips = stringi::stri_enc_toutf8(tooltips)

onclick = sprintf("alert(\"%s\")", as.character(chodata$state))

install.packages("ggiraph")


# customize data color
ggiraph()
girafe()
library(ggiraph)

tooltips = paste0(
  sprintf("<p><strong>%s</strong></p>", as.character(chodata$state)),
  '<table>',
  '  <tr>',
  '    <td>pop(만)</td>',
  sprintf('<td>%.0f</td>', chodata$UrbanPop * 10),
  '  </tr>',
  '  <tr>',
  '    <td>murder</td>',
  sprintf('<td>%.0f</td>', chodata$Murder),
  '  </tr>',
  '  <tr>',
  '    <td>violence</td>',
  sprintf('<td>%.0f</td>', chodata$Assault),
  '  </tr>',
  '</table>' )

ggplot() + geom_map()


ggplot(chodata, aes(data = Rape, map_id = state)) +
  geom_map_interactive( 
    aes(fill = Murder,
        data_id = state,
        tooltip = tooltips,
        onclick = onclick), 
    map = usmap) +
  expand_limits(x = usmap$long, y = usmap$lat) +
  scale_fill_gradient2('Rape', low='blue',  mid = 'blue', high = 'blue') +
  labs(title="USA Murder") -> gg_map

ggiraph(code = print(gg_map))
girafe(ggobj = gg_map)


ggplot(chodata, aes(data  = Murder, map_id = state)) + 
  geom_map_interactive(aes(fill = Murder), map = usmap) + 
  expand_limits(x = usmap$long, y = usmap$lat) +
  labs(title="USA Murder", fill = 'Murder')

ggChoropleth(data = chodata, aes(fill= Rape, map_id = state), map=usmap, interactive = T)



scale_fill_gradient2('Murder', low="blue", mid='green',high='red')

#3. 시도별 결핵환자수(kormaps::tbc)를 단계 구분도로 작성하시오.(우리나라) (단, 환자수는 2006년부터 2015년 총합,  NA인 지역은 0으로
# 표시할 것)

install.packages('stringi')
library(stringi)

install.packages("devtools")
devtools::install_github("cardiomoon/kormaps2014")

library(kormaps2014)

<<<<<<< HEAD
=======
library(moonBook2)
>>>>>>> c4f9cde25e524ebf327f3be2b20fc44de2e45d4c
str(changeCode(korpop1))

str(changeCode(kormap1))

str(changeCode(tbc))

tbc

<<<<<<< HEAD
=======

>>>>>>> c4f9cde25e524ebf327f3be2b20fc44de2e45d4c
str(changeCode(tbc))

ggChoropleth(data = tbc, aes(fill = NewPts, map_id = code, tooltip = name), map = kormap1, interactive = T)

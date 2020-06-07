
library(xlsx)

library(lattice)

libarary(dplyr)

library(ggplot2)

olympic88 = read.xlsx("C:/Users/Administrator/Desktop/기말시험 문제지 폴더/데이터정보처리 입문 과제물/문제5_태능선수촌 남녀 선수들의 측정치.xlsx", header=T, 1)

as.numeric(unlist(olympic88))

as.numeric(gender)

attach(olympic88)

names(olympic88)

mean(height)

mode(gender)

tapply(height, gender, mean)

tapply(height, gender, sd)

tapply(height, gender, summary)


tapply(weight, gender, mean)

tapply(weight, gender, sd)

tapply(weight, gender, summary)


tapply(leg, gender, mean)

tapply(leg, gender, sd)

tapply(leg, gender, summary)


tapply(sprint50m., gender, mean)

tapply(sprint50m., gender, sd)

tapply(sprint50m., gender, summary)


table(gender)

table(height)

gender.height.male = c( gender =1, height ,header = F)

gender.height.female = c(gender =2, height)

gender.height.male 

hist(gender.height.female, nclass=6 )

as.numeric(gender.height)

par(mfrow = c(1, 2))

hist(height, xlab="선수키", ylab="분포도", main="선수키 히스토그램")


gender.height.male = 

attach(gender.height)

gendername = gender

gendername[gendername == 1] = "남"

gendername[gendername == 2] = "여"

gendername

par(mfrow = c(1, 2))

par(mfrow = c(1, 1))


#barplot(gender.height ~gendername)

gender.height

rownames(gender.height) = c("남", "여")

hist(height~gender.height$gender)



olympic88_male <- olympic88 %>% filter(gender==1) # 남성은 1번

olympic88_female <- olympic88 %>% filter(gender==2)  # 여성은 2번

attach(olympic88)

olympic88_male

olympic88_female 


stem(olympic88_male$height)

stem(olympic88_female$height)


stem(olympic88_male$weight)

stem(olympic88_female$weight)


stem(olympic88_male$leg)

stem(olympic88_female$leg)


stem(olympic88_male$sprint50m.)

stem(olympic88_female$sprint50m.)


par(mfrow = c(1, 2))

hist(olympic88_male$weight)

hist(olympic88_female$weight)


hist(olympic88_male$height)

hist(olympic88_female$height)


hist(olympic88_male$leg)

hist(olympic88_female$leg)


hist(olympic88_male$sprint50m.)

hist(olympic88_female$sprint50m.)


boxplot(height~gender, main="남녀별 신장")


boxplot(weight~gender, main="남녀별 몸무게")


boxplot(leg~gender, main="남녀별 다리길이")


boxplot(sprint50m.~gender, main="남녀별 50m달리기")



boxplot(height~gendername, main="남녀별 신장")


plot(height, sprint50m., type = "n")
points(height[sex==1], sprint50m.[sex==1], pch="M", col="BLUE")
points(height[sex==2], sprint50m.[sex==2], pch="F", col="RED")

ggplot( olympic88, aes(x=height, fill= gender,  color=gender))  + geom_histogram(fill="#F8766D",  colour="black", bins = 4,position = "dodge", binwidth = 0.5)

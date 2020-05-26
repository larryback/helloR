t <- c(70, 65, 63, 72, 81, 83, 66, 75, 80, 75, 79, 76, 76, 69, 75, 74, 85, 86, 71, 64, 78, 80, 74, 72, 77, 81, 82, 80, 80, 80, 87)

table(t)

hist(t, main = "수목원 나무 히스토그램" )

stem(t, 1)

man <-c(49, 58, 62, 86, 82, 72, 40, 52, 65, 45, 56, 60, 48, 50, 64, 93, 85, 70, 97, 80, 78, 58, 60, 67, 58, 62, 69, 98, 80, 88)

hist(man, main = "남자 입사시험 성적")

woman <-c(60, 68, 72, 72, 66, 67, 65, 61, 75, 62, 78, 72, 62, 79, 64, 71, 74, 74, 58, 73)

hist(woman, main="여자 입사시험 성적")

mean(man)

sd(man)

cv1 = 100*sd(man)/mean(man) # 남자 입사시험 성적의 변이계수

print(cv1)

mean(woman)
sd(woman)
cv2 = 100*sd(woman)/mean(woman) # 여자 입사시험 성적의 변이계수
print(cv2)


x <- c(68, 70, 70, 71, 69, 74, 71, 72, 70, 73)
mean(x)
sd(x)
t.test(x, conf.level = 0.95)[["conf.int"]]
t.test(x, conf.level = 0.99)[["conf.int"]]

score <- C(54, 57, 55, 23, 51, 64, 90, 51, 52, 43, 15, 10, 82, 74, 54, 78, 37, 73, 52, 48, 41, 33, 52, 30, 41, 51, 18, 39, 46, 28, 53, 44, 46, 56, 28, 58, 29, 58, 67, 35, 25, 38, 61, 53, 23, 73, 69, 47, 41, 45, 77, 56, 89, 28, 54, 99, 10, 43, 35, 24, 21, 23, 67, 14, 53)

score <- read.table(file="/workspace/R/score.txt", header=FALSE, sep="")

score

score1 <- as.numeric(score)

score1

mean(score1)

median(score1)

var(score1)

sd(score1)

cv <- sd(score1) / mean(score1)

cv

# 평균과 중앙값이 거의 일치하므로 자료가 평균을 중심으로 모여 있고 

names(score1)[which(score1==max(score1))] # 최빈값

max(score1)

stem(score1)

hist(score1)

boxplot(score1)

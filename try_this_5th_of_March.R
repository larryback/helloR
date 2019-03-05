# 1. data$group 컬럼에 A조~C조 랜덤으로 160명씩 고르게 분포시키시오.
#data_new = data.frame('group', 'A', 'B', 'C')
#data_new$A = runif(n=160, mind = 10101, max = )
data$group = sample(c('A', 'B', 'c'), size=nrow(data), replace=T)

#2. fibonacci.R 파일을 작성하고 console에서 실행하시오.

#source('fibonacci.R')

#3. apply를 이용하여 smdt에 과목별 (총)평균점수 행을 추가하고, 
#   총점과 평균 변수(컬럼)을 추가하시오.
#계 = apply(smdt[, 2:4], MARGIN = 2, FUN = mean)
smdt_new01 = rbind(smdt, list("게", 80, 74, 79, 80))
#계 = apply(smdt[, 2:4], MARGIN = 1, FUN = sum)
smdt_new01 = cbind(smdt_new01, total = c("total", 267, 207, 237, 214, 240))
#계 = apply(smdt[, 2:4], MARGIN = 1, FUN = mean)
smdt_new01 = cbind(smdt_new01, avg = c("avg", 89, 69, 79, 71.3, 80))

#4. 2016~2019년 연도별 1월(Jan) ~ 12월(Dec) 매출액 데이터를
#`no year Jan Feb … Dec` 형태로 만든 다음, 아래와 같이 출력하시오.

# 1. data$group 컬럼에 A조~C조 랜덤으로 160명씩 고르게 분포시키시오.
#data_new = data.frame('group', 'A', 'B', 'C')
#data_new$A = runif(n=160, mind = 10101, max = )
data$group = sample(c('A', 'B', 'c'), size=nrow(data), replace=T)

#2. fibonacci.R 파일을 작성하고 console에서 실행하시오.

source('fibonacci.R')

#3. apply를 이용하여 smdt에 과목별 (총)평균점수 행을 추가하고, 
#   총점과 평균 변수(컬럼)을 추가하시오.
계 = apply(smdt[, 2:4], MARGIN = 2, FUN = mean)
smdt_new01 = rbind(smdt, list("계", 87.4, 78, 68.6))
apply(smdt_new01[, 2:4], MARGIN = 1, FUN = sum)
total = c(216, 203, 254, 233, 264, 234)
smdt_new01["total"] = total
#smdt_new01 = cbind(smdt_new01, total = c("total", 216, 203, 254, 233, 264, 234))
apply(smdt_new01[, 2:4], MARGIN = 1, FUN = mean)
avg = c(72, 67.66667, 84.66667, 77.66667, 88, 78 )
smdt_new01["avg"] = avg
#smdt_new01 = cbind(smdt_new01, avg = c("avg", 89, 69, 79, 71.3, 80))

#4. 2016~2019년 연도별 1월(Jan) ~ 12월(Dec) 매출액 데이터를
#`no year Jan Feb … Dec` 형태로 만든 다음, 아래와 같이 출력하시오.
library('reshape2')
dfsum_1 = cbind( data.frame(no=1:4, year=2016:2019), 
               matrix(round(runif(n = 48, min = 10000, max = 90000)) , ncol=12, dimnames = list(NULL, paste0('month', 1:12)))) 

melt(data=dfsum_1[,2:14], id.vars = "year")
#melt(data=dfsum[,2:6], id.vars = "year")
meltsum_1 = melt(dfsum_1[,2:14], id.vars = "year", variable.name = 'month', value.name = "saleamt")
#dcast(meltsum, Sales~year, value.var="value")

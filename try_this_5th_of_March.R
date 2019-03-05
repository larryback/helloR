# 1. data$group 컬럼에 A조~C조 랜덤으로 160명씩 고르게 분포시키시오.
#data_new = data.frame('group', 'A', 'B', 'C')
#data_new$A = runif(n=160, mind = 10101, max = )
data$group = sample(c('A', 'B', 'c'), size=nrow(data), replace=T)

#2. fibonacci.R 파일을 작성하고 console에서 실행하시오.

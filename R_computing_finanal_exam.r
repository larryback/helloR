sink("C:/data/R_exam/Orange1.txt")

setwd("C:/data/R_exam")

getwd()

data("Orange")


Orange1<- as.numeric(unlist(Orange))

Orange1

mean(Orange1)

sd(Orange1)

var(Orange1)

median(Orange1)

range(Orange1)

summary(Orange1)

sink()



x<-sample(1:10,5)

x

#sum(x)

y<-sample(2:11,5)

y

#sum(y)

if(sum(x) > sum(y)) {
  print(sum(x))
}else{
  print(sum(y))
}

gugu <- matrix(0, ncol = 9, nrow = 9)

for(i in 1:9) {
  for(j in 1:9) {
    gugu[i, j] <- i * j
  }
}

gugu

gugu1 <- matrix(0, ncol=9, nrow=9)
l <- 1
k <- 1
while (l <= 9) {
  while (k <= 9) {
    gugu1[l,k] <- l*k
    k <- k+1
  }
  k=1
  l <- l+1
}

gugu1

#install.packages("igraph")
library(igraph)

#g4 <- graph(c("home","workplace","workplace","school","school","home"))

g4 <- graph(c("home(500000)","workplace(300000)","workplace(300000)","school(200000)","school(200000)","home(500000)"))

E(g4)

V(g4)$name

V(g4)$stay_time <- c(10, 9, 2)

E(g4)$traffic <- c("subway","bus","bicycle")

E(g4)$traffic_time <- c(1,1,1)

V(g4)$spending <- c(500000, 300000, 200000)




(E(g4)$width <- E(g4)$traffic_time)



# 교통수단 색지정 지하철:1(black), 버스:2(maroon), 자전거:3(blue)
te <- c("subway", "bus", "bicycle")
line.col <- ifelse(te=="subway", 1, ifelse(te=="bus",2,3))
colrs <- c("black", "maroon", "blue")
mycolrs <- c("gold", "lightpink", "tomato")

#plot(g4, edge.arrow.size=1.5, vertex.frame.color="gray", vertex.label.color="black", vertex.label.dist=2, edge.curved=0.2, vertex.size=V(g4)$stay_time*10, vertex.label.cex=1.2, edge.color=colrs[line.col], vertex.color=c("pink", "peru", "skyblue"))
#legend("topleft", c("home","workplace","school"), pch=21, pt.bg=c("gold","tomato","lightpink" ), bty="n", ncol=1)
#legend(x=-1.5, y=-1.5, c("subway", "bus", "bicycle"), lty=1, lwd=2, col=colrs, bty = "n", ncol = 3)

plot(g4, edge.arrow.size=1.5, vertex.frame.color="gray", vertex.label.color="black", vertex.label.dist=2, edge.curved=0.2, vertex.size=V(g4)$stay_time*10, vertex.label.cex=1.2, edge.color=colrs[line.col], vertex.color=c("pink", "peru", "skyblue"))
legend("topleft", c("home","workplace","school"), pch=21, pt.bg=c("gold","tomato","lightpink" ), bty="n", ncol=1)
legend(x=-1.5, y=-1.5, c("subway", "bus", "bicycle"), lty=1, lwd=2, col=colrs, bty = "n", ncol = 3)




state.x77

summary(state.x77)

head(state.x77)

state.income <- state.x77[,"Income"]

hist(state.income)

normdist <- density(state.income)

plot(normdist)

qqnorm(state.income)

qqline(state.income, col='orange')

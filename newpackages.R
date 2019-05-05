# installing/loading the package:
if(!require(installr)) {
  install.packages("installr"); 
  require(installr)
} #load / install+load installr

install.packages("glue")
install.packages("devtools")
devtools::install_github("cardiomoon/kormaps2014")
devtools::install_github("cardiomoon/moonBook2")



library("Rcpp")

options(encoding = 'UTF-8') 
Sys.setenv(LANG = "en_US.UTF-8")
devtools::session_info()
localeToCharset(locale = Sys.getlocale("LC_CTYPE"))
getOption("encoding")
Sys.setlocale("LC_CTYPE","ko_KR.UTF-8")

uninstall.packages("Rcpp")


install.packages("extrafont")
library(extrafont) ## 잊지마세요 package 불러오기!
font_import()  ##설치된 모든 폰트 가져오기
y

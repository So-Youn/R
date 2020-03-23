install.packages("N2H4")
library(N2H4)
library(stringr)
library(dplyr)
# 네이버에서 뽑을 때는 라이브러리를 이용
url <- "https://news.naver.com/main/read.nhn?mode=LSD&mid=shm&sid1=100&oid=018&aid=0004603232"
getAllComment(url) %>% select(userName,contents) ->mydata
mydata

mycomments <- mydata$contents
mycomments

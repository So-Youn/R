# csv는 기본 패키지로 사용 가능
#csv를 읽기
mdf <- read.csv("csv_exam.csv")
mdf

mdf[2,2]
mdf[2,]
#dataframe에서 조건에 만족하는 데이터를 조회
m <- matrix(1:20,ncol=4)
m
d <- data.frame(m)
d
# 13보다 큰 데이터 출력
myresult <- d[d$X3>=13,]
myresult 

# 조건에 만족하는 데이터를 result.csv로 저장
write.csv(myresult,file="result.csv")


mysc <- mdf[mdf$science>=80,]



myscr <- data.frame(mysc) 
myscr
mytest <-myscr(c(3:5),)

mytotal <- c(sum(myscr[1,3:5]),sum(myscr[2,3:5]),sum(myscr[3,3:5]),sum(myscr[4,3:5]))
mytotal
myscr
myavg <- c(mean(mytotal[1]),mean(mytotal[2]),mean(mytotal[3]),mean(mytotal[4]))
myavg

rownames(myscr) <- c(1,2,3,4)
myscr$mytotal <- mytotal
myscr$myavg <- myavg
myscr

write.csv(myscr,file="csv_exma_result.csv")

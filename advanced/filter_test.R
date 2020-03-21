# 주어진 데이터에서 원하는 데이터만 추출
#dplyr은 문자열에 대한 작업에 특화된 기능이 많은 패키지
#c++로 구현되어 있어 가장 빠르다
#dplyr라이브러리는 실핼할 때 코드 전체를 범위지정해서 실행
library("dplyr")
data("airquality")
head(airquality)

df2 <- airquality
df2 

#필터링 - 벡터연산
head(df2[,1:4])
df2_data1 <-  df2[1:5,]
df2_data1
df2[df2$Day==1,]   
df2[df2$Day!=1,]
df2[df2$Day<=2,]
df2[df2$Day==1&df2$Day==2,]
df2[df2$Day==1|df2$Day==2,]

sum(df2$Day %in% 1:2)

df2_data2 <- df2[df2$Day %in% 1:2,]
nrow(df2_data2)
df2_data2
#dplyr패키지에서 지원하는  필터 관련 함수
filter(df2,Day==1 & Month==5)
filter(df2,Day %in% c(1,3,5))

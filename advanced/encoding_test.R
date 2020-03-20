# library 는 꼭 맨 위에 놓기 - 어떤 라이브러리를 썼는지 확인하기 편하다

install.packages("data.table")
library("data.table")


df <- data.frame(mydata1 = 1:5 , 
                 mydata2=letters[1:5], 
                 mydata3=c("이민호","android","@한글%","test","한글"))       

letters

df
####파일 write####
write.csv(df,"encoding_test.csv",row.names = FALSE)
write.csv(df,"encoding_test_euckr.csv",row.names = FALSE, fileEncoding = "euc-kr")
write.csv(df,"encoding_test_cp949.csv",row.names = FALSE, fileEncoding = "cp949")
write.csv(df,"encoding_test.csv_utf8.csv",row.names = FALSE, fileEncoding = "utf8")





####깨진파일 처리하기####
read.csv("encoding_test.csv_utf8.csv")
readLines("encoding_test.csv_utf8.csv")
readLines("encoding_test.csv_utf8.csv", encoding = "UTF-8")


# data.table - dataframe 보다 강력
dftable <- fread('encoding_test.csv_utf8.csv')
head(dftable)  # 데이턱 잘 들어갔는 지 확인 (with readLine)

#인코딩함수
Encoding(dftable$mydata3)  = "UTF-8"
head(dftable)

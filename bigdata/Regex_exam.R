# 정규 표현식
install.packages("stringr")
library("stringr")

#### 패턴####
mytext <- "     test$uuuuu"
mytext2 <- "https://cran.r-project.org/"

# str_extract : 패턴 실행해주는 function
#패턴과 일치하는 문자열도 리턴
str_extract(mytext2,".+(:)")   
#패턴과 일치하는 문자를 찾아 일치문자 바로 전까지 리턴
str_extract(mytext2,".+(?=:)")

str_extract(mytext,".+(?=\\$)")  #전방탐색(?=)
str_extract(mytext,"(?=\\$).*") #후방탐색(?<=)
# ()는하나로 묶어주는 용도


#문자열 관련 function
# paste - 벡터를 연결해서 하나의 문자열로 생성
# paste0 - 여러개를 연결해서 보여준다.
str <- c("java","hadoop","R","mongodb") # 문자열 생성

paste(str,collapse = " ")
paste(str,collapse = ",")

paste0(mytext,mytext2)

#특정 문자를 치환하고 싶을 때
# 즉, 문자열 안의 특정 문자열을 replace
data <- gsub("u","U",mytext)
data <- gsub("u","",mytext)  # 자르기
data

str_trim(data) #trim()과 동일
 
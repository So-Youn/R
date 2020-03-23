#mongodb 연동
install.packages("mongolite")  
library("stringr")    
library(mongolite)

#mongodb에 저장하기 위해서는 크롤링을 해야한다.
con <- mongo(collection = "crawl",
             db = "bigdata",
             url = "mongodb://127.0.0.1")

url <-'https://www.clien.net/service/group/community'
# readLines : url 접속 가능 
#( 사이트에 있는 데이터, csv 등 파일을 받아오는 것 가능)
url_data <- readLines(url,encoding = "UTF-8") 
url_data
# 정보 확인=========================
#class(url_data)
#length(url_data)
#head(url_data)
#tail(url_data)
#==============================================
url_data[200]
# 조건에 만족하는 데이터를 필터링
# str_detect() : 문자열에 패턴을 적용해서 일치여부를 TRUE와 FALSE로 리턴
#### 데이터 필터링 : title####
# 1. str_detect(패턴을 검사할 문자열, 패턴)을 이용해서
# 웹 페이지 전체에서 필요한 데이터만 먼저 추출
filter_data <- url_data[str_detect(url_data,"subject_fixed")]   # 클래스명 추출

# 2. 추출한 데이터 전체에서 내가 필요한 문자열만 추출
# str_extract() -> 패턴에 일치하는 문자열을 리턴
# 후방, 전방 탐색 정규 표현식
title <- str_extract(filter_data,"(?<=\">).*(?=</span>)")
title

#### 데이터 필터링 : hit ####
hit_data <- url_data[str_detect(url_data,"<span class=\"hit\">")]    # 태그 추출
hit_data

hit <- str_extract(hit_data,"(?<=\">).*(?=</span>)")[-1]
hit

#### 데이터 필터링 : url ####
# which 이용 시 데이터의 순서를 이용해서 추출 가능.
str_detect(url_data,"subject_fixed")
(which(str_detect(url_data,"subject_fixed"))-3)
myurl <- url_data[(which(str_detect(url_data,"subject_fixed"))-3)]    # 태그 추출
myurl

url_Val <- str_extract(myurl,"(?<=href=\").*(?=data-role)")
url_Val
#필요없는 문자열 잘라내기 
#end = 3 : 뒤에서  3개를 잘라내기
url_Val <- str_sub(url_Val,end = -3)
url_Val <- paste0("http://www.clien.net",url_Val)
url_Val

#### csv파일 생성####
final_data <- cbind(title,hit,url_Val)
final_data
write.csv(final_data, "crawl_data.csv")
#R에서 사용하는 데이터 : RData
# csv 보다 처리속도가 빠르다.
save(final_data,file = "craw_data.RData")
length(title)
length(hit)
length(url_Val)


####mongodb에 저장하기####
if(con$count()>0){
  con$drop()
}
final_data
class(final_data)
#insert가 되기 위해서는 data.frame으로 만들어주어야 한다.
#즉, mongodb에 데이터를 저장하기 위해서 dataframe으로 변환
final_data <- data.frame(final_data)
class(final_data)
con$insert(final_data)








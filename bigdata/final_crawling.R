#### 모두의 광장의 1페이지 : 10페이지의 모든 게시글을 크롤링####
# # 1.모든 페이지의 title, hit,url,content까지 추출
# # 2. crawl_result.csv , crawl_result , RData 저장
# # 3. mongodb 저장 (300개 저장)
# 4. for문 if 를 적절하게 활용

library(stringr)
library(mongolite)
con <- mongo(collection = "crawl",
             db = "bigdata",
             url = "mongodb://127.0.0.1")
#0번부터 9번 페이지까지 반복 작업
final_data_list = NULL
for (i in 0:9) {
  #페이지마다 연결할 주소가 달라지므로 변수로 처리
  myurl <-  paste0("https://www.clien.net/service/group/community?&od=T31&po=",i)
  url_data <- readLines(myurl,encoding = "UTF-8") 
 
  ####title 추출####
  final_filter_data <- url_data[str_detect(url_data,"subject_fixed")]   # 클래스명 추출
  title <- str_extract(final_filter_data,"(?<=\">).*(?=</span>)")
  ####hit 추출####
  final_hit_data <- url_data[str_detect(url_data,"<span class=\"hit\">")]    # 태그 추출
  hit <- str_extract(final_hit_data,"(?<=\">).*(?=</span>)")[-1]
  ####url추출####
  (which(str_detect(url_data,"subject_fixed"))-3)
  myurl <- url_data[(which(str_detect(url_data,"subject_fixed"))-3)]    # 태그 추출
  
  url_Val <- str_extract(myurl,"(?<=href=\").*(?=data-role)")
  url_Val <- str_sub(url_Val,end = -3)
  url_Val <- paste0("http://www.clien.net",url_Val)
  
  #####################url을 이용해서 content항목 추출##################
  contentlist = NULL   # 최초 변수 선언시 null로 초기화
  content_filter_data =  NULL
  for(page in 1:length(url_Val)){ #컨텐츠를 빼오는 과정
    #한 페이지당 30개의 컨텐츠가 돌아야 한다.
     contentdata <- readLines(url_Val[page],encoding = "UTF-8")
     start = which(str_detect(contentdata,"post_content")) # 504번에 위치함을 알 수 있다.
     end = which(str_detect(contentdata,"post_ccls"))
     content_filter_data <- contentdata[start:end]
     content_filter_data <- paste(content_filter_data,collapse = "")
     content_filter_data <- gsub("<.*?>","",content_filter_data)     
     content_filter_data <- gsub("\t|&nbsp;","",content_filter_data)  # \t 와 탭 모두 지우기
     
     # 기존의 저장되어 있는 contentlist의 내용에 추가
     contentlist <- c(contentlist,content_filter_data)
     cat("\n",page)
  }
  final_data <- cbind(title,hit,url_Val,contentlist)
  final_data_list <- rbind(final_data_list,final_data)
  cat("\n",i)
  }



write.csv(final_data_list, "crawl_data.csv")
save(final_data_list,file = "craw_data.RData")

####mongodb에 저장하기####
if(con$count()>0){
  con$drop()
}
#insert가 되기 위해서는 data.frame으로 만들어주어야 한다.
#즉, mongodb에 데이터를 저장하기 위해서 dataframe으로 변환
final_mongo_data <- data.frame(final_data_list)
con$insert(final_mongo_data)


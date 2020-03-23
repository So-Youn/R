library(stringr)
load(file = "craw_data.RData")

final_data
url_list <- final_data[,3]
class(url_list)
#웹 페이지 데이터 가져오기
contentdata <- readLines(url_list[1],encoding = "UTF-8")
#tail(contentdata)
class(contentdata)

# 원하는 부분만 가지고 오기
start = which(str_detect(contentdata,"post_content")) # 504번에 위치함을 알 수 있다.
end = which(str_detect(contentdata,"post_ccls"))
end #525번 위치

content_filter_data <- contentdata[start:end]
content_filter_data

#데이터 정제하기
# 1. 벡터로 리턴하므로 한 개로 합치기
content_filter_data <- paste(content_filter_data,collapse = "")
content_filter_data 
# 2. 불필요한 기호나 태그 없애기
# 태그 없애기
# 연속된 것 없애기
content_filter_data <- gsub("<.*?>","",content_filter_data)     
# <.*> 태그 모두 없애기  : 맨 처음 < 와 > 가 사라진다.
# <.*?> : < 와 >  사이를 없애기
content <- gsub("\t|&nbsp;","",content_filter_data)  # \t 와 탭 모두 지우기
# 이제 탭과 공백을 지워야 한다.
content



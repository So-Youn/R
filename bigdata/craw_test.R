load(file = "craw_data.RData")
library("stringr")    
library(mongolite)
final_data
final_data[1,3] #ulr만 보기


url_data <- readLines(final_data[1,3],encoding = "UTF-8")
url_data
filter_title <- url_data[(which(str_detect(url_data,"post_subject"))+1)]
filter_title

title <- str_extract(filter_title, "(?<=<span>).*(?=</span>)")
title

filter_name <- url_data[(which(str_detect(url_data,"nickname"))+2)][1]
filter_name
name <- str_extract(filter_name, "(?<=<span>).*(?=</span>)")
name

filter_content <- url_data[(str_detect(url_data,"og:description"))]
filter_content
content <- str_extract(filter_content,"(?<=\").*(?=<\")")
content_result <- gsub("\t|&nbsp;","",content)
content_result

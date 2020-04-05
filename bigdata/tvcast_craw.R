install.packages("rvest")
library(rvest)

url_tvcast <- "http://tvcast.naver.com/jtbc.youth"
html_tvcast <- read_html(url_tvcast,encoding = "UTF-8")
html_tvcast %>% html_nodes(".title a")
# class가 title인 부분에서 a태그에 해당하는 내용 추출
html_tvcast %>% html_nodes(".title a") %>% html_text()
# 텍스트만 추출

tvcast_df <- html_tvcast %>% html_nodes(".title a") %>% html_text() %>% data.frame()

tvcast_df

library(rvest)

url_policy <- "http://www.mohw.go.kr/react/policy/index.jsp?PAR_MENU_ID=06&MENU_ID=06390101&PAGE=2"
html_policy <- read_html(url_policy,encoding = "UTF-8")

# class가 title인 부분에서 a태그에 해당하는 내용 추출
html_policy %>% html_nodes(".cont_title1 span") %>% html_text()
# 텍스트만 추출
html_policy %>% html_nodes(".indent_box li") %>% html_text() -> what

result <- gsub("\t|\r|\n","", what) #r태그, t태그 제거
result %>% data.frame()
result

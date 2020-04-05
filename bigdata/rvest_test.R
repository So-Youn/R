# css의 선택자를 활용할 수 있는 방법 - rvest
install.packages("rvest")
library(rvest)

url <- "https://www.clien.net/service/group/community"

# html_nodes(선택자) : 일치하는 모든 태그를 추출
# html_node(선택자) : 일치하는 태그 한 개
# html_text() :텍스트를 추출
# html_name() : attribute의 이름 추출
# html_children() : 하위 노드 추출
# html_attr() : attribute 추출

# subject_fixed로 정의된 모든 태그 다 뽑아 온다/

readPage <- read_html(url)
readPage
readPage %>% 
  html_nodes("span.subject_fixed")   -> title_data
title_data

readPage %>% 
  html_nodes("span.subject_fixed") %>% 
  html_text() -> title_result
title_result




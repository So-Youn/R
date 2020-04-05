library(rvest)

URL <- "http://easylaw.go.kr/CSP/OnhunqueansLstRetrieve.laf?onhunqnaAstSeq=97&onhunqueAstSeq=199"

html_URL <- read_html(URL,encoding = "UTF-8")

# class가 title인 부분에서 a태그에 해당하는 내용 추출
html_URL %>% html_nodes(".title .biue") %>% html_text()    ->title
result_title <- gsub("\t|\r|\n","", title)%>% data.frame() #r태그, t태그 제거
result_title

# 텍스트만 추출

html_URL %>% html_nodes(".qa .ttl") %>% html_text() -> qna
result_qna <- gsub("\t|\r|\n","", qna)%>% data.frame() #r태그, t태그 제거
result_qna


html_URL %>% html_nodes(".qa .ans") %>% html_text() -> ans
result_ans <- gsub("\t|\r|\n|더보기","", ans)%>% data.frame() #r태그, t태그 제거
result_ans


qnadf <- data.frame(title = result_title,qna = result_qna)
qnadf

write.csv(qnadf,"QnaTest.csv")

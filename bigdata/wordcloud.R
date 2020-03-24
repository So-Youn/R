install.packages("wordcloud")
install.packages("RColorBrewer") 

install.packages("koNLP")
install.packages("Sejong")
install.packages("hash")
install.packages("rJava")
install.packages("tau")
install.packages("RSQLite")
install.packages("devtools")
library(KoNLP)
library(stringr)
library(wordcloud)
library(RColorBrewer)
#####################koNLP의 함수를 테스트################
# extractNoun : 명사만 추출하는 함수
extractNoun("할리우드 톱스타 레오나르도 디카프리오는 '선행 전도사'다운 행보를 이어갔다.")
# SimplePos09 : 좀 더 디테일한 함수
SimplePos09("롯데마트가 판매하고 있는 흑마늘 양념 치킨이 논란이 되고 있다.")



####분석할 샘플 데이터 로딩####
load("comments.RData")
length(comments)
load("score.RData")
length(score)

head(comments,10)
head(score,10)
sampledata <- comments[1:1000]
class(sampledata)

#########형태소 분석을 하기 위해서 명사 분리#########
# 댓글을 분리하면 분리된 명사의 갯수가 다르므로 리스트를 이용
data_list = list()
for(i in 1:length(sampledata)){
  data <- SimplePos09(sampledata[i])
  data_list[[i]] <- data
}
data_list[[1]]
head(data_list,20)

# /로 분할 - 리스트의 모든 요소에 저장된 문자열을 /로 분할
#            =>N이 있는 문자열의 첫번째 요소를 가져온다. 
#sapply를 이용하면 반복 작업을 할 수 있다.
sapply(data.frame(test = c(1,2,3,4,5,6),
                  test2 = c(3,4,5,6,7,8)
                  ),              # 반복작업 할 데이터
       function(x){
         x[1]
       }  # 반복해서 적용할 함수  
       )

class(data_list)
class(unlist(data_list))
# 리스트를 unlist 로 변환
wordlist <- sapply(str_split(unlist(data_list),"/"), function(x){
                                                  x[1]     #x[1] 리턴
                                            })

class(wordlist)  
head(wordlist,10)

convertHangulStringToJamos("R는 많은 공헌자에의한 공동 프로젝트입니다")

# table 함수를 이용해서 단어의 빈도수 구하기
# table 함수는 벡터에 저장되어 있는 모든 단어들의 빈도수를 계산해서 변환해준다.
#   -> 단어를 이용해서 변수명으로 사용
tablewordlist <- table(wordlist)
tablewordlist[1]
tablewordlist[89]
names(tablewordlist)    

# 분석한 데이터를 이용해서 sort
# 상위 100개만 출력
tablewordlist <- sort(tablewordlist,decreasing = T)
tablewordlist
# 분석 결과를 가지고 기준을 적용해서 정리  -- 한글자를 빼고 작업
nchar("글자수")
tablewordlist_result <- tablewordlist[nchar(names(tablewordlist))>1]
tablewordlist_result
tablewordlist_result <- sort(tablewordlist_result,decreasing = T)[1:100]
tablewordlist_result

# RColorBrewer
# 모든 색상의 팔레트를 보여준다.
display.brewer.all(n = 10, exact.n = F)
brewer.pal.info
display.brewer.all(type="div")
display.brewer.all(type="seq")
display.brewer.all(type="qual")

# 분석한 결과가 저장되어 있는 tablewordlist_result의 값을
# 단어와 숫자로 각각 저장

word <- names(tablewordlist_result)
word
count <- as.numeric(tablewordlist_result)
count

mycolor <- brewer.pal(n = 11,name = "RdBu")   #(이름,  maxcolors)
wordcloud(words = word,freq = count,
          random.order = F, colors = mycolor,
          scale = c(7,0,3))


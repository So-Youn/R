install.packages("koNLP")
install.packages("Sejong")
install.packages("hash")
install.packages("rJava")
install.packages("tau")
install.packages("RSQLite")
install.packages("devtools")
library(KoNLP)
library(stringr)

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
wordlist <- sapply(str_split(data_list,"/"), function(x){
                                                  x[1]     #x[1] 리턴
                                            })
class(wordlist)  
head(wordlist,10)







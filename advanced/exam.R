#ggplot2패키지에서 제공되는 mpg데이터를 분석
library("ggplot2")
library("dplyr")
####step1.  mpg를 dataframe으로 변경####
mpgtest <- as.data.frame(mpg)
mpgtest
###step2.  mpg의 정보를 출력####
#행 갯수, 열의 갯수, 위에서 10개, 끝에서 10개 출력
nrow(mpgtest)
ncol(mpgtest)
head(mpgtest,10)
tail(mpgtest,10)

####step3. mpg의 컬럼명을 변경 ####
# 가독성을 위해 컬럼명 변경
# cty => city , hwy => highway 
mpgtest <- rename(mpgtest, city=cty) 
mpgtest <- rename(mpgtest, highway=hwy)

mpgtest
####step4. 파생변수 생성하기####
#total 컬럼을 추가 = > cty와 hwy의 합 구하기
#avg컬럼을 추가 => cty와 hwy의 평균 구하기
mpgtest$total <- as.numeric(mpgtest$city+mpgtest$highway)

mpgtest$avg <- as.numeric(mpgtest$city, mpgtest$highway)
View(mpgtest)
# write.csv(mpgtest, file = "mpg_result.csv")

####step5. 생성된 total을 가지고 요약정보 확인####
summary(mpgtest$total)
####step6. info 컬럼 추가####
#total 값을 이용해서 평가 - 30 이상이면 pass, fail
mpgtest[,"info"] <- ifelse(test = mpgtest$total>=30,yes="pass",no="fail")
mpgtest
####step7. grade 컬럼 추가####
#total 값을 이용해서 평가 - 40 이상이면 A, 35이상이면 B, 30이상이면 C, 나머지는 D 
mpgtest[,"grade"] <- ifelse(test = mpgtest$total>=40,yes="A",no=ifelse(test=mpgtest$total>=35,yes = "B",no=ifelse(test = mpgtest$total>=30,yes = "C",no = "D")))
mpgtest 
write.csv(mpgtest, file = "mpg_ifelse_result.csv")

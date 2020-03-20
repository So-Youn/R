# () 안에는 아무 숫자나 가능 
# 발생한 랜덤수를 찾아갈 수 있는 key값
# 랜덤 수가 변하지 않도록 셋팅 set.seed(1222)
set.seed(1222)   
#a <- sample(1:10)  # 1~10 랜덤 수를 생성한다.
a <- sample(1:10, size =5, replace = FALSE) # DEFAUT : FALSE
#replace - true  : 중복 가능 replace -false 중복 불가능 ()

a


#if문의 역할을 하는 함수 - ifelse
set.seed(1221)
ifdf <- data.frame(mynum=1:6,
                   myval=sample(c("spring","bigdata","android"),
                                size =6,
                                replace =TRUE)) # 값 3 SIZE 이니 중복되어야 함

ifdf
# myval의 값이 spring이면 프로젝트 완료 , bigdata면 할거야 출력
# for 문 버전 - info
for (i in 1:nrow(ifdf)) {
  if(ifdf[i,"myval"] == "spring"){
    ifdf[i,"info"] <- "프로젝트 완료"
  }else{
    ifdf[i,"info"] <- "할거야"
  }
}
ifdf

# 함수를 이용해서 -info2
#ifelse(test =조건,yes=" ",no=" ")
ifdf[,"info2"] <- ifelse(test = ifdf$myval=="spring",yes ="쉽다",no="할거다")

ifdf

#조건이 두 개 이상인 경우 처리하는 방법 -info 3
ifdf[,"info3"] <- ifelse(test = ifdf$myval=="spring",yes ="쉽다",no=ifelse(test=ifdf$myval=="bigdata",yes = "머신 세팅",no="device 셋팅 완료"))

ifdf

#ifdf[,"info4"] <- "쉽다"
#ifdf



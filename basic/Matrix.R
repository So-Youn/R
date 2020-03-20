# 행렬
matrix(1:15)
? matrix
mymat1 <-matrix(1:15,ncol=3) # 3열로 작성
mymat1
# 1부터 15가지의 값을 3개의 열로 표현, row 방향 값을 추가
mymat1 <- matrix(1:15,ncol=3,byrow = T) # 행방향
mymat1
#matrix에서 원하는 값을 추출하기
mymat1[2,2]       # 행,열 
mymat1[3,3]
mymat1[1,c(1:3)]

mymat1[1,] #1행의 모든 값 출력
mymat1[,1] #열의 모든 값 출력

#1행과 3행만 출력
mymat1[c(1,3),]

#1행과 3행을 뺀 데이터
mymat1[-c(1,3),]

#미니 실습 1 - 2행 ~ 4행까지 출력 ( 단, 2번 3번 컬럼만 출력)
mymat1[2:4,c(2,3)]

#컬럼 바인드 ( 컬럼 매핑)
#cbind 컬럼을 추가하는 함수 - 값이 부족하면 맨 앞의 값이 채워진다
addmymat1 <- cbind(mymat1,c(1,11,111,1111))    
addmymat1
#rbind : row를 추가하는 함수
addmymat2 <-rbind(mymat1,c(1,11))
addmymat2
# 넘치는 경우는 잘린다.
addmymat2 <-rbind(mymat1,c(1,11,111,1111)) 
addmymat2

colnames(mymat1) <- c("a","b","c")
mymat1
rownames(mymat1) <- c("r1","r2","r3","r4","r5")
mymat1

mean(mymat1)


myscore <- matrix(c(80,90,70,100,80,99,78,72,90,78,82,78,99,89,78,90),ncol=4,byrow=TRUE)
myscore

colnames(myscore) <- c("국어","영어","과학","수학")
rownames(myscore) <- c("kim","kee","hong","jang")
myscore

avg_name <- matrix(c(mean(myscore[,1]),mean(myscore[,2]),mean(myscore[,3]),mean(myscore[,4])),ncol=4)
avg_name <-c(mean(myscore[,1]),mean(myscore[,2]),mean(myscore[,3]),mean(myscore[,4]))
avg_name

avg_subject <-c(mean(myscore[1,]),mean(myscore[2,]),mean(myscore[3,]),mean(myscore[4,]))
avg_subject

library("dplyr")
exam <- read.csv("csv_exam.csv")
exam
# filter : 조건을 정의
exam %>%
  filter(class==1) %>%
  filter(math>=50)# 체이닝 오퍼레이터

# select  - 추출하고 싶은 변수를 정의
exam %>% select(-math)    #math 제외하고 조회
exam %>% select(id,math,english)

exam %>% filter(class==1) %>% select(id,math,english)

# arrange
exam %>% arrange(id) # 오름차순
exam %>% arrange(desc(id)) # 내림차순
exam %>% arrange(class) # 같은 클래스끼리 묶기
exam %>% arrange(class,desc(english))

exam %>% filter(class %in% c(1,3,5))


#mutate - 파생변수 추가하기(원본에 없는 컬럼 추가)
exam %>% 
  mutate(total=math+english+science) %>%
  head()

exam %>% 
  mutate(total=math+english+science,
         mean = total/3,
         info = ifelse(science>=70,"통과","재시험"))
exam %>% 
  group_by(class) %>% 
  summarise(math_sum = sum(math),
            math_mean = mean(math),
            math_median = median(math),
            math_count = n())

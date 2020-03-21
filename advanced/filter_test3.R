test1 <- data.frame(id=c(1,2,3,4,5),
                     mid_jumsu = c(77,56,99,100,99))
test2 <- data.frame(id = c(1,2,3,4,5),
                    final_jumsu = c(77,56,99,100,99))
test1
test2
# 조인
final_data <-  left_join(test1,test2,by="id")
final_data

# stringsAsFactors : FACTOR타입으로 만들지 않도록 설정
namedata <- data.frame(class=c(1,2,3,4,5),
                       teacher=c("kim","lee","park","jang","hong"),
                       stringsAsFactors = F)
str(namedata)

exam

# 열방향 조인
exam_new <- left_join(exam,namedata,by="class")
exam_new


groupA <- data.frame(id=c(1,2,3,4,5),
                    mid_jumsu = c(77,56,99,100,99))
groupB <- data.frame(id = c(6,7,8,9,10),
                     mid_jumsu = c(77,56,99,100,99))
groupA
groupB
#행방향 조인
group_total <- bind_rows(groupA,groupB)
group_total

library("ggplot2")

midwest <- as.data.frame(ggplot2::midwest)
midwest
midwest <- rename(midwest,total=poptotal)
midwest
midwest <- rename(midwest, asian=popasian)
midwest
midwest$aisanp <- ((midwest$asian/midwest$total)*100)
midwest
hist(midwest$aisanp)  # 히스토그램
midavg <- mean(midwest$aisanp)

midwest$group <- ifelse(midwest$aisanp>midavg,"large","small")
midwest

midfre <- table(midwest$group)   #빈도수
qplot(midwest$group)   # 빈도 막대 그래프

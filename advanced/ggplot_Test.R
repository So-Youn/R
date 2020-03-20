install.packages("ggplot2")
library("ggplot2")    #import

mydata <- c("java","spring","bigdata","android")
qplot(mydata)   # 빈도 막대 그래프 출력력
# 함수 기능 테스트 할 수 있는 예제 데이터 : mpg
qplot(data = mpg, x = hwy) 
qplot(data = mpg, x = hwy, y =drv)  
qplot(data = mpg, x = drv, y =hwy, geom = "line")  # geon: 그래프 종류 명시  
qplot(data = mpg, x = drv, y =hwy, geom = "boxplot")
qplot(data = mpg, x = drv, y =hwy, geom = "boxplot", colour=drv) # 색상


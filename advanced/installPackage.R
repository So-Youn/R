install.packages("beepr")
library("beepr")
beep()
#Sys.sleep(1) = 프로세스 1초동안 동작시키지 않는다 (interupt)    -> 쓰레드
for (i in 1:10) {
  beep(sound = i)
  Sys.sleep(1)
}

.libPaths()

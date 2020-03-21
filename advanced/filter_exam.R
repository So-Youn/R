mpg %>% group_by(class) %>%
  summarise(city_mean = mean(cty))

mpg %>% group_by(class) %>%
  summarise(city_mean = mean(cty)) %>%
  arrange(desc(city_mean))

mpg %>% group_by(class) %>%
  summarise(hwy_mean = mean(hwy)) %>%
  arrange(desc(hwy_mean)) %>% head(3)                                   

mpg %>% filter(class=="compact") %>% 
  group_by(manufacturer) %>% 
  summarise(car_num =n()) %>% 
  arrange(desc(car_num))

library(tidyverse)

msleep

msleep %>%
  group_by(vore) %>% 
  summarize(mean_sleep = mean(sleep_total, na.rm = TRUE)) %>% 
  ggplot(aes(x = vore,
             y = mean_sleep)) +
  geom_col()

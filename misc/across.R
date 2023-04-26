library(tidyverse)
library(janitor)

round(14.5)
round_half_up(14.5)

iris %>% 
  as_tibble()

iris %>%
  as_tibble() %>%
  mutate(Sepal.Length = round(Sepal.Length)) %>% 
  mutate(Sepal.Width = round(Sepal.Width))

iris %>%
  as_tibble() %>%
  mutate(across(ends_with("Width"), round_half_up))

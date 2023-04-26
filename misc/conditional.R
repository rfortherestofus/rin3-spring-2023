library(tidyverse)
library(palmerpenguins)

penguins %>% 
  mutate(bill_length_categorical = if_else(condition = bill_length_mm > 40, 
                                           true = "Greater than 40",
                                           false = "Less than 40")) %>% 
  select(bill_length_mm, bill_length_categorical)

penguins %>% 
  mutate(is_best_island = if_else(condition = island == "Torgersen",
                                  true = "Best island",
                                  false = "Not best island")) %>% 
  select(contains("island")) %>% 
  view()

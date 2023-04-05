library(tidyverse)
library(palmerpenguins)
library(janitor)

penguins_tabyl <- penguins %>% 
  tabyl(island, sex) %>% 
  adorn_percentages() %>% 
  adorn_pct_formatting()

library(scales)

penguins %>% 
  count(island, sex) %>% 
  group_by(island) %>% 
  mutate(pct = n / sum(n)) %>% 
  mutate(pct_formatted = percent(pct, accuracy = 0.1))

penguins %>% 
  mutate(body_mass_formatted = comma(body_mass_g))

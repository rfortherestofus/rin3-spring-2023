library(tidyverse)
library(scales)

tfff_dark_green <- "#265142"

# Working on recreating this graph: https://show.rfor.us/hJFyQL

race_ethnicity <- read_csv("data/race-ethnicity.csv") %>% 
  filter(year == 2020) %>% 
  filter(geography == "Multnomah") %>% 
  mutate(value_formatted = percent(value, accuracy = 0.1)) %>% 
  mutate(population_pct = str_glue("{population}: {value_formatted}")) %>% 
  mutate(population = fct_rev(population))

race_ethnicity

ggplot(data = race_ethnicity,
       aes(x = value,
           y = population)) +
  geom_col(aes(x = 1,
           y = population),
           fill = "white",
           color = "Grey 90",
           linetype = "dotted") +
  geom_col(fill = tfff_dark_green) +
  geom_text(aes(label = population_pct),
            hjust = -0.05) +
  theme_void() 

library(palmerpenguins)

ggplot(data = penguins,
       aes(x = sex)) +
  geom_bar()


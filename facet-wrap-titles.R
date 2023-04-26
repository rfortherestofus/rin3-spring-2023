library(tidyverse)
library(palmerpenguins)

penguins %>% 
  ggplot(aes(x = bill_length_mm,
             y = bill_depth_mm)) +
  geom_point() +
  facet_wrap(~island)

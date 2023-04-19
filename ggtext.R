library(tidyverse)
library(palmerpenguins)
library(ggtext)

ggplot(data = penguins,
       aes(x = flipper_length_mm,
           y = bill_length_mm)) +
  geom_point() +
  labs(title = "Penguins are *really cool*",
       x = "Flipper Length",
       y = "Bill Length") +
  theme(plot.title = element_markdown())

# new text
# More new text
# More change
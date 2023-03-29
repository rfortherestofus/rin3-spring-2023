library(tidyverse)
library(palmerpenguins)

penguins

penguins %>% 
  select(starts_with("s"), contains("mm"))

penguins %>% 
  mutate(bill_length_depth = bill_length_mm + bill_depth_mm, .before = island)

penguins %>% 
  mutate(bill_length_depth = bill_length_mm + bill_depth_mm) %>% 
  select(species, bill_length_depth, everything())

penguins %>% 
  mutate(bill_length_depth = bill_length_mm + bill_depth_mm) %>% 
  relocate(bill_length_depth, .before = island)

penguins %>% 
  group_by(island) %>% 
  summarize(avg_bill_length = mean(bill_length_mm, na.rm = TRUE)) %>% 
  arrange(avg_bill_length)

penguins |> 
  group_by(island) |> 
  summarize(avg_bill_length = mean(bill_length_mm, na.rm = TRUE))

penguins %>% 
  mutate(not_actually_na = "NA") %>% 
  drop_na(bill_depth_mm)

read_csv("data/penguins.csv",
         na = c("190", "NA"))

msleep %>% 
  select(name, conservation) %>% 
  mutate(conservation = replace_na(conservation, 945))

starwars %>%
  select(name, eye_color) %>%
  mutate(eye_color = na_if(eye_color, "unknown")) %>% 
  view()

penguins %>% 
  filter(island %in% c("Biscoe", "Dream")) %>% 
  view()

penguins %>% 
  filter(island == "Biscoe" | species == "Adelie")

penguins %>% 
  filter(island %in% c("BiscoeDream"))

penguins %>% 
  select(contains("mm"))

  select(island)
  
  library(tidyverse)

install.packages(tidyverse)

penguins %>% 
  summarize(mean_bill_length = mean(bill_length_mm,
                                    na.rm = TRUE)) %>% 
  summarize(mean_bill_depth = mean(bill_depth_mm,
                                   na.rm = TRUE))

penguins %>% 
  summarize(mean_bill_length = mean(bill_length_mm,
                                    na.rm = TRUE),
            mean_bill_depth = mean(bill_depth_mm,
                                   na.rm = TRUE))

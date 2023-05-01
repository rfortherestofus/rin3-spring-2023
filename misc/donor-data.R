library(tidyverse)

set.seed(187)

donor_data <- tibble(
  patient_id = 1:10,
  type = c(sample(c("A", "B", "C"), 10, replace = TRUE)),
  donor_1 = round(runif(10, 500, 600)),
  donor_2 = round(rnorm(10, 300, 50)),
  donor_3 = round(runif(10, 900, 1000))
)

donor_data %>% 
  summarize(donor_1_mean = mean(donor_1),
            donor_2_mean = mean(donor_2),
            donor_3_mean = mean(donor_3))

donor_data %>% 
  pivot_longer(cols = donor_1:donor_3,
               names_to = "donor_group") %>% 
  group_by(donor_group) %>% 
  summarize(donor_mean = mean(value))


ggplot(data = donor_data,
       aes(x = type,
           y = donor_1)) +
  geom_point()

donor_data %>% 
  pivot_longer(cols = donor_1:donor_3,
               names_to = "donor_group") %>% 
  group_by(donor_group) %>% 
  summarize(donor_mean = mean(value)) %>% 
  ggplot(aes(x = donor_group,
             y = donor_mean)) +
  geom_col()


library(tidycensus)
library(scales)
library(grkmisc)

options(scipen = 999)

get_decennial(geography = "state", 
              variables = c(total_population = "P1_001N", 
                            asian_population = "P1_006N"),
              output = "tidy",
              year = 2020) %>% 
  ggplot(aes(y = NAME,
             x = value)) +
  geom_col() +
  scale_x_continuous(labels = comma_format()) +
  facet_wrap(~variable)


get_acs()  

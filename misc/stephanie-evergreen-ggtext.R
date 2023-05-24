# https://stephanieevergreen.com/easy-dot-plots-in-excel/

library(tidyverse)
library(ggtext)
library(janitor)

read_csv("https://github.com/rfortherestofus/rin3-spring-2023/raw/main/data/kindergarten-readiness.csv") %>% 
  clean_names() %>% 
  pivot_longer(cols = -subject,
               names_to = "season",
               values_to = "percent") %>% 
  mutate(subject_label = case_when(
    season == "fall" ~ subject,
    TRUE ~ NA_character_
  )) %>% 
  mutate(above_65 = case_when(
    percent > 65 ~ "Y",
    TRUE ~ "N"
  )) %>% 
  ggplot(aes(x = percent,
             y = subject,
             color = season,
             label = subject_label)) +
  geom_point() +
  geom_label(aes(color = above_65),
             inherit.aes = TRUE,
             hjust = 1.5) +
  scale_x_continuous(limits = c(0, 100),
                     breaks = seq(from = 0,
                                  to = 100,
                                  by = 10)) +
  scale_color_manual(values = c(
    "fall" = "darkgrey",
    "spring" = "#c44f4b"
  )) +
  labs(title = "Kindergarten readiness increased between <span style='color: darkgrey;'>Fall</span> and <span style='color: #c44f4b;'>Spring</span>",
       subtitle = "Minimum entry requirement: 65% in all areas") +
  theme_minimal() +
  theme(panel.grid.major.x = element_blank(),
        panel.grid.minor.x = element_blank(),
        plot.title = element_markdown(face = "bold"),
        legend.position = "none",
        axis.text.y = element_blank(),
        axis.title = element_blank())



read_csv("https://github.com/rfortherestofus/rin3-spring-2023/raw/main/data/kindergarten-readiness.csv") %>% 
  clean_names() %>% 
  pivot_longer(cols = -subject,
               names_to = "season",
               values_to = "percent") %>% 
  mutate(above_65 = case_when(
    percent > 65 ~ "Y",
    TRUE ~ "N"
  )) %>% 
  ggplot(aes(x = percent,
             y = subject,
             color = above_65)) +
  geom_point() +
  theme_minimal() +
  theme(panel.grid.major.x = element_blank(),
        panel.grid.minor.x = element_blank(),
        plot.title = element_markdown(face = "bold"),
        legend.position = "none",
        axis.text.y = element_blank(),
        axis.title = element_blank())


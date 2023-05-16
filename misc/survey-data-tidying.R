library(tidyverse)
library(readxl)
library(janitor)


# Survey Monkey -----------------------------------------------------------

survey_monkey_data_raw <- read_excel("data/survey-monkey-data.xlsx")

survey_monkey_data_clean <- survey_monkey_data_raw %>%
  clean_names() %>% 
  mutate(id = row_number()) %>% 
  select(-start_date) %>% 
  pivot_longer(cols = -id,
               names_to = "question",
               values_to = "response") %>% 
  mutate(response = str_remove(response, "- ")) %>% 
  mutate(response = case_when(
    response == "Relaxed with a hobby (TELL US THE HOBBY BY TYPING IN THE OTHER FIELD)" ~ "Selected other option",
    TRUE ~ response
  )) %>% 
  drop_na(response) %>% 
  select(-question) 

survey_monkey_data_clean %>% 
  count(response) %>% 
  slice_max(order_by = n,
            n = 10,
            with_ties = FALSE) %>% 
  ggplot(aes(x = n,
             y = response)) +
  geom_col() +
  theme_minimal()

activity_plot <- function(number_of_activities) {
  
  survey_monkey_data_clean %>% 
    count(response) %>% 
    slice_max(order_by = n,
              n = number_of_activities,
              with_ties = FALSE) %>% 
    ggplot(aes(x = n,
               y = response)) +
    geom_col() +
    theme_minimal()
  
}

activity_plot(number_of_activities = 50)

# Qualtrics ---------------------------------------------------------------

qualtrics_data_raw <- read_excel("data/qualtrics-data.xlsx",
                                 skip = 1)

qualtrics_data_raw %>% 
  clean_names() %>% 
  select(select_all_the_things_youve_done_in_the_past_24hours_selected_choice) %>% 
  mutate(id = row_number()) %>% 
  separate_longer_delim(select_all_the_things_youve_done_in_the_past_24hours_selected_choice,
                        delim = ",")

qualtrics_data_raw %>% 
  clean_names() %>% 
  select(select_all_the_things_youve_done_in_the_past_24hours_selected_choice) %>% 
  mutate(id = row_number()) %>% 
  separate_rows(select_all_the_things_youve_done_in_the_past_24hours_selected_choice,
                sep = ",")

# Google Forms/Sheets -----------------------------------------------------

google_sheets_raw <- read_excel("data/google-forms-data.xlsx")

google_sheets_raw %>% 
  clean_names() %>% 
  select(select_all_the_things_youve_done_in_the_past_24hours) %>% 
  mutate(id = row_number()) %>% 
  separate_rows(select_all_the_things_youve_done_in_the_past_24hours,
                sep = ", ")


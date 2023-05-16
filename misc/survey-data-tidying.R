library(tidyverse)
library(readxl)
library(janitor)


# Survey Monkey -----------------------------------------------------------

survey_monkey_data_raw <- read_excel("data/survey-monkey-data.xlsx")

# Qualtrics ---------------------------------------------------------------


qualtrics_data_raw <- read_excel("data/qualtrics-data.xlsx",
                                 skip = 1)


# Google Forms/Sheets -----------------------------------------------------

google_sheets_raw <- read_excel("data/google-forms-data.xlsx")


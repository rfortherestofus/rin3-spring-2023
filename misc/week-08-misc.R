library(tidyverse)

location_data <- tribble(
  ~id, ~address,
  1, "Las Vegas, USA",
  2, "Bristol, UK",
  3, "Kassala, Sudan"
)

location_data

location_data %>% 
  separate_wider_delim(address,
                       delim = ",",
                       names = c("city", "country")) %>% 
  mutate(country = str_trim(country))
  filter(country == " USA")
  
location_data %>% 
  separate(address,
           sep = ", ",
           into = c("city", "country"))


device_ownership <- tribble(
  ~name, ~devices_owned,
  "Charlie", "Smart TV, Cell phone",
  "Mohammad", "Cell phone",
  "Christina", "Smart TV, Games Console, Cell phone"
)

device_ownership %>% 
  separate_longer_delim(devices_owned,
                        delim = ", ") 
%>% 
  count(devices_owned)

device_ownership %>% 
  mutate(owns_smart_tv = if_else(str_detect(devices_owned, "Smart TV"), "Y", "N")) %>% 
  mutate(owns_cell_phone = if_else(str_detect(devices_owned, "Cell phone"), "Y", "N")) %>% 
  mutate(owns_games_console = if_else(str_detect(devices_owned, "Game Console"), "Y", "N"))

device_ownership %>% 
  separate_rows(devices_owned,
                sep = ", ")

responses <- tribble(
  ~name, ~response,
  "David", "AB",
  "Kayley", "CD",
  "Scott", "EF"
)

responses

responses %>% 
  separate_wider_position(
    response,
    widths = c(x = 1,
               y = 1)
  )


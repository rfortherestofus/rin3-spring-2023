#  Recreating this: https://show.rfor.us/cditiy

# Load Packages -----------------------------------------------------------

library(tidyverse)
library(scales)
# library(shadowtext)
library(ggchicklet)
# library(hrbrthemes)
library(patchwork)

# Import Data ------------------------------------------------------------

cbem <- read_csv("data/cbem.csv")


# Plot --------------------------------------------------------------------

cbem_plot <- function(location_to_filter,
                      age_group_to_filter) {
  
  state_average <- cbem %>%
    filter(location == location_to_filter) %>% 
    filter(age_group == age_group_to_filter) %>% 
    filter(group == "All Persons") %>% 
    pull(percent)
  
  state_average_formatted <- percent(state_average, accuracy = 0.1)
  
  state_average_annotation <- str_glue("CBEM State Rate\n{state_average_formatted}")
  
  cbem_filtered <- cbem %>%
    filter(location == location_to_filter) %>% 
    filter(age_group == age_group_to_filter) %>% 
    filter(group != "All Persons") %>% 
    mutate(percent_formatted = percent(percent)) 
  
  ggplot(data = cbem_filtered,
         aes(x = group,
             y = percent,
             fill = group,
             label = percent_formatted)) +
    geom_hline(yintercept = state_average,
               linetype = "dashed") +
    geom_chicklet() +
    geom_text(color = "white",
              vjust = 1.7) +
    annotate(geom = "text",
             label = state_average_annotation,
             vjust = -1,
             x = 5,
             y = state_average) +
    scale_fill_manual(values = c("American Indian or Alaska Native" = "#9CC892",
                                 "Asian or Pacific Islander" = "#0066cc",
                                 "Black or African American" = "#477A3E",
                                 "White" = "#6CC5E9",
                                 "Hispanic or Latino" = "#ff7400")) +
    theme_void() +
    theme(legend.position = "none")
}


alaska_under_18 <- cbem_plot(location_to_filter = "Alaska",
                             age_group_to_filter = "Under 18")

alaska_under_25 <- cbem_plot(location_to_filter = "Alaska",
                             age_group_to_filter = "Under 25")

alaska_under_18 + alaska_under_25

#  Recreating this: https://show.rfor.us/cditiy

# Load Packages -----------------------------------------------------------

library(tidyverse)
library(scales)
library(shadowtext)
library(ggchicklet)
library(hrbrthemes)
library(patchwork)


# Import Data ------------------------------------------------------------

cbem <- read_csv("data/cbem.csv")
# data_manip_ex_1.R

# Use the data provided to answer the following question:
  ## What is the average km/L achieved by cars with the same number cylinders.

# Libraries --------------------------------------------------------------

library(tidyverse)


# Load data ---------------------------------------------------------------

mtcars <- read_csv("prod_workshop/excercise/data/data_manip_ex_1_data.csv")

# Manipulate data ---------------------------------------------------------

mtcars_manip <- mtcars %>% 
  # Converting mpg to km/L
  mutate(mpg = mpg * 0.425144) %>% 
  # Renaming mpg to kml
  rename(kml = mpg) %>%
  # Select only model and kml variables
  select(model,kml)


# Avg km/L per cylinder number --------------------------------------------

avg_kml <- mtcars_manip %>% 
  # Group by cylinder count
  group_by(cyl) %>% 
  # Summarise and get average of kml per group
  summarise(avg_kml = mean(kml)) %>%
  ungroup()


# Save output -------------------------------------------------------------

# write_csv(avg_kml,"prod_workshop/excercise/data/ans_data_manip_ex_1.csv")

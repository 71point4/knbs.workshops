# data_manip_ex_2.R

# Use the data provided to answer the following question (kchsp2020_annual_hh.dta):
  ## Of the households that could be found what is the average number persons per dwelling per quarter in Mombasa.

# Libraries --------------------------------------------------------------

library(tidyverse)
library(haven)

# Load data ---------------------------------------------------------------

ken_hh <- read_dta("prod_workshop/excercise/data/kchsp2020_annual_hh.dta") %>% 
  as_factor() %>% 
  mutate(across(where(is.factor), as.character))

# Manipulate data ---------------------------------------------------------

ken_hh_manip <- ken_hh %>% 
  # Filter to only look at households from Mombasa and where households could be found
  filter(a01 == "Mombasa" & a11_1 == "Household found") %>% 
  # Select variables to be used
  select(qrt,a12,e01) %>% 
  # Rename variables
  rename(num_person_household = a12,
         num_dwellings = e01)

# Avg number of persons per dwelling per quarter ---------------------------

avg_num <- ken_hh_manip %>% 
  # Group by quarter
  group_by(qrt) %>% 
  summarise(avg_pp_pd = mean(num_person_household/num_dwellings,na.rm = TRUE)) %>%
  ungroup()


# Save output -------------------------------------------------------------

# write_csv(avg_num,"prod_workshop/excercise/data/ans_data_manip_ex_2.csv")

# joins_ex_2.R

# Number of females per house each quarter in Mombasa

# Libraries --------------------------------------------------------------

library(tidyverse)
library(haven)


# Load data ---------------------------------------------------------------

ken_hh <- read_dta("prod_workshop/excercise/data/kchsp2020_annual_hh.dta") %>% 
  as_factor() %>% 
  mutate(across(where(is.factor), as.character))

ken_hhm <- read_dta("prod_workshop/excercise/data/kchsp2020_annual_hhm.dta") %>% 
  as_factor() %>% 
  mutate(across(where(is.factor), as.character))


# Manipulate data ---------------------------------------------------------

ken_hh_manip <- ken_hh %>% 
  # Filter to only look at households from Mombasa
  filter(a01 == "Mombasa") %>% 
  # Select variables to be used
  select(qrt,clid,hhid) %>% 
  # Change format of qrt variable
  mutate(qrt = case_when(
    qrt == "First" ~ 1,
    qrt == "Second" ~ 2,
    qrt == "Third" ~ 3,
    qrt == "Fourth" ~ 4,
    TRUE ~ NA_real_
  ))

ken_hhm_manip <- ken_hhm %>% 
  # Filter to only look at households from Mombasa
  filter(a01 == "Mombasa" & b04 == "Female") %>%
  # Select variables to be used
  select(qrt,clid,hhid,b04) %>% 
  # Rename variables
  rename(sex = b04)

# Number of females in each house per quarter -----------------------------

full_data <- left_join(ken_hh_manip,ken_hhm_manip, by = c("qrt","clid","hhid")) %>% 
  group_by(qrt,clid,hhid) %>% 
  summarise(female_count = sum(sex == "Female"))

# Save output -------------------------------------------------------------

#write_csv(full_data,"prod_workshop/excercise/data/ans_joins_ex_2.csv")


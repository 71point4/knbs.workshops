# joins_ex_1.R

# Use the data provided to answer the following question (joins_ex_1_1_data.csv & joins_ex_1_2_data.csv):
  ## Inner join the data
  ## Outer join the data
  ## Left join the data
  ## Right join the data

# Libraries --------------------------------------------------------------

library(tidyverse)


# Load data ---------------------------------------------------------------

product <- read_csv("prod_workshop/excercise/data/joins_ex_1_1_data.csv")
state <- read_csv("prod_workshop/excercise/data/joins_ex_1_2_data.csv")


# Inner join --------------------------------------------------------------

inner <- inner_join(product,state, by = c("id"))

# Outer join --------------------------------------------------------------

outer <- full_join(product,state, by = c("id"))

# Left join ---------------------------------------------------------------

left <- left_join(product,state, by = c("id"))

# Right join --------------------------------------------------------------

right <- right_join(product,state, by = c("id"))

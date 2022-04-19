# functions_ex_2.R

# Use the data provided to answer the following question (functions_ex_2_data.csv) 
  ## Using a function and map create a new variable named total that adds Sepal.Length,Sepal.Width,Petal.Length,Petal.Width

# Libraries --------------------------------------------------------------

library(tidyverse)
library(purrr)


# Load data ---------------------------------------------------------------

iris <- read_csv("prod_workshop/excercise/data/functions_ex_2_data.csv")

# Function ----------------------------------------------------------------

add_all <- function(a,b,c,d) {
  
  x <- a + b + c + d
  
  return(x)
  
}

# Calculate total ---------------------------------------------------------

total_iris <- iris %>% 
  mutate(total = pmap(list(Sepal.Length,Sepal.Width,Petal.Length,Petal.Width),add_all))

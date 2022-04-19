# loops_ex_1.R

# Use the data provided to answer the following question (loops_ex_1_data.csv):
  ## Loop through datste and print the ansrwe for Sepal.Length x Sepal.Width

# Libraries --------------------------------------------------------------

library(tidyverse)


# Load data ---------------------------------------------------------------

iris <- read_csv("prod_workshop/excercise/data/loops_ex_1_data.csv")


# Loop --------------------------------------------------------------------

for (i in 1:nrow(iris)) {
  
  output <- iris$Sepal.Length[i]*iris$Sepal.Width[i]
  
  print(output)
  
  
}


# Advanced question -------------------------------------------------------

for (i in 1:nrow(iris)) {
  
  output <- iris$Sepal.Length[i]*iris$Sepal.Width[i]
  
  if (output > 20) {
    
    output <- "Out of bounds"
    
  }
  
  print(output)
  
  
}

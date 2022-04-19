# functions_ex_1.R

# Answer the following question
  ## Write a function that take 3 arguments and adds them all and prints the results

# Libraries --------------------------------------------------------------

library(tidyverse)


# Code function -----------------------------------------------------------

add_all <- function(a,b,c) {
  
  result <- a * b + c
  
  print(result)
  
}


# Call function -----------------------------------------------------------

add_all(2,3,4)

add_all(a = 2, b = 3, c = 4)
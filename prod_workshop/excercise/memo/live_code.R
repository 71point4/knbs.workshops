# live_code.R

# Live code one indicator.
  # CX.DEMAND.DEMOG.7

# Libraries --------------------------------------------------------------

library(tidyverse)

# Template ----------------------------------------------------------------

# Test for indi_key
if (indi_key == "indi_key") {
  
  # Find number of distinct de_key's
  check_all_elems <- unique(df$de_key)
  
  # Test if any values are missing
  if(any(is.na(df$value))) {
    indi_df <- "Missing values"
  }
  
  # Test if all data elements required to populate indicator are included
  if(check_all_elems != "de_key" || length(check_all_elems) != 1 || length(df$de_key) >1){
    indi_df <- "Incorrect data element or multiple data elements provided"
  }
  
  # Test if all data elements required to populate indicator are included and have values
  if(check_all_elems == "de_key" && length(df$de_key) == 1 && !any(is.na(df$value))){
    
    # Create output in table
    indi_df <- tibble(
      indi_key = indi_key,
      aggregation = aggregation,
      year = df$year,
      value = df$value,
      source_dataset = df$source_dataset,
      collection_note = df$collection_note,
      url = df$url
    )
    
    # Check for NA columns
    na_cols <- names(which(sapply(indi_df, function(x) any(is.na(x)))))
    warning(glue("The following columns have NA values - check your input data frame: {na_cols}"))
  }
  
  # Return created table
  return(indi_df)
}


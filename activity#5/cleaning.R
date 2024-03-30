# Load required libraries
library(dplyr)
library(readr)
library(stringr)  


# Read the CSV file
clean3000 <- read.csv("/cloud/project/activity 3/merged_movies.csv", stringsAsFactors = FALSE)

# Check the structure of the dataframe
str(clean3000)

# Clean the data
cleaning_data <- clean3000 %>%
  # Remove NA values
  na.omit() %>%
  # Remove leading and trailing whitespaces from all columns
  mutate_all(str_trim)

# Check the structure of the cleaned dataframe
str(cleaning_data)

# Write the cleaned data to a new CSV file
write.csv(cleaning_data, "cleaned3000.csv", row.names = FALSE)



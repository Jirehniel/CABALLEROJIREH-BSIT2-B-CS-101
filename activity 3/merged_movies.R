# Read existing CSV files
movie1 <- read.csv("/cloud/project/activity 3/movie1.csv")
movie2 <- read.csv("/cloud/project/activity 3/movie2.csv")
movie3 <- read.csv("/cloud/project/activity 3/movie3.csv")
movie4 <- read.csv("/cloud/project/activity 3/movie4.csv")
movie5 <- read.csv("/cloud/project/activity 3/movie5.csv")
movie6 <- read.csv("/cloud/project/activity 3/movie6.csv")
movie7 <- read.csv("/cloud/project/activity 3/movie7.csv")
movie8 <- read.csv("/cloud/project/activity 3/movie8.csv")
movie9 <- read.csv("/cloud/project/activity 3/movie9.csv")
movie10 <- read.csv("/cloud/project/activity 3/movie10.csv")


# Combine data frames vertically using rbind
merged_movies <- rbind(movie1,movie2,movie3,movie4,movie5,movie6,movie7,movie8,movie9,movie10)

# Save the merged data frame to a new CSV file
write.csv(merged_movies, "merged_movies.csv", row.names = FALSE)


install.packages("xlsx")

library(xlsx) 

# Read the contents of CSV file as dataframe 
df<- read.csv("/cloud/project/merged_products.csv") 

# convert the data frame to excel file 
xlsx::write.xlsx(df, 
                 "amazon.xls", 
                 col.names=TRUE, 
                 row.names=TRUE, 
                 sheetName="sample")

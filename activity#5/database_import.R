library(dplyr,dbplyr)
install.packages('RMariaDB')
library(RMariaDB)
library(DBI)
library(readr)

connection <- dbConnect(RMariaDB::MariaDB(),
                        dsn="mysql",
                        Server = "localhost",
                        dbname = "movies",
                        user = "root",
                        password = '')


dbListTables(connection)

#importing data frame
movies_df <- read_csv('C:/Users/Jireh/Downloads/cleaned3000.csv')
tail(movies_df)


#checking the column of the df
glimpse(movies_df)



#inserting data frame in the database
dbWriteTable(connection, 'movies', movies_df[1:3000, ], append = TRUE)
tail(dbReadTable(connection, 'movies')) #displaying the last 6 rows of the planes database

#reading a tables from the data base
head(dbReadTable(connection,'movies'))


#checking if the connection is etablished
dbListTables(connection)

#checking if the movies table is present in the database
dbExistsTable(connection, 'movies') 

#displays the selected fields of the table
movies_query <- dbGetQuery(connection, "SELECT * FROM movies.movies")
glimpse(movies_query)
movies_query

#disconnect from dbase
dbDisconnect(connection)

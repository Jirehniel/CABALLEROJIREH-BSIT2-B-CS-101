library(dplyr,dbplyr)
install.packages('RMariaDB')
library(RMariaDB)
library(DBI)

connection <- dbConnect(RMariaDB::MariaDB(),
                        dsn="mysql",
                        Server = "localhost",
                        dbname = "sample_db",
                        user = "root",
                        password = '')

dbListTables(connection)
dbListFields(connection,"authors")
dbListFields(connection,"posts")




empi_data <- dbGetQuery(connection, "SELECT * FROM sample_db.authors")
glimpse(empi_data)

post_data <- dbGetQuery(connection, "SELECT * FROM sample_db.posts")
glimpse(post_data)

# insert values into MySQL
query <- "INSERT INTO authors (id, first_name, last_name, email, birthdate, added) VALUES (102, 'Juan', 'dela Cruz', 'mine@example.com', '2005-12-02','2024-02-19 05:00:10')"

# Execute the query
query_result <- dbSendQuery(connection, query)

# clear the result after executing the query
dbClearResult(query_result)

#checking if the value was inserted into a table
tail(empi_data)








query <- "INSERT INTO kent( name, age , sex) VALUES ('missy', '87', 'F')"
query_result <- dbSendQuery(connection, query)

dbClearResult(query_result)           


empi_data <- dbGetQuery(connection, "SELECT * FROM ")


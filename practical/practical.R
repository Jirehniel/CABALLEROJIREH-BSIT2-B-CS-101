library(dplyr)
library(tidyverse)
#A

warpbreaks
warp <- warpbreaks

#1

select_if(warp,is.numeric)

select_if(warp, is.integer)

#2
#Question 1
#no columns has a data type of integer
int <- as.integer(warp)

sapply(warp, mode)

transform(warp,breaks = as.integer(breaks))

#3
#Error: 'list' object cannot be coerced to type 'integer'
#the list cannot be converted because the data type is already numeric





#B
#1
(txt_file <- readLines("C:/Users/student/Desktop/exampleFile"))
txt_file


#2
comments <-grepl("//",txt_file)
com <- grepl(";",txt_file)

(comm <- txt_file[!comments])
(coms <- txt_file[!com])

#3
dte <- grepl("21 May 2013",txt_file)
dte



#4
A <- strsplit(comm, split = ';')
A

B <- sapply(A,max)
B

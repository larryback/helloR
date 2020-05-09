#install.packages('dplyr')
library(dplyr)
#install.packages('hflights')
library(hflights)

library(rlang)
library(tibble)

#install.packages('rlang')
#install.packages('ggplot2')
#explore data
data(hflights)
head(hflights)

#convert to local data frame 

flights = tbl_df(hflights)

#printing only shows 10 rows and as many columns as can fit on your screen

flights
#require(installr)
#updateR()

#You can specify that you want to see more rows
print(flights, n = 20)

#Convert to a normal data frame to see all of the columns
data.frame(head(flights))

## filter: Keep rows matching criteria

# Base R approach to filtering forces you to repeat the data frame's name
# dplyr approach is simpler to write and read
# Command structure (for all dplyr verbs):
    # first argument is a data frame
    # return value is a data frame
    # nothing is modified in place
# Note: dplyr generally does not preserve row names


# base R approach to view all flights on January 1
flights[flights$Month==1 & flights$DayofMonth==1, ]



# dplyr approach
# note: you can use comma or ampersand to represent AND condition
filter(flights, Month==1, DayofMonth==1)

# use pipe for OR condition
filter(flights, UniqueCarrier=="AA" | UniqueCarrier=="UA")


# you can also use %in% operator
filter(flights, UniqueCarrier %in% c("AA", "UA"))



## select: Pick columns by name

# Base R approach is awkward to type and to read
# dplyr approach uses similar syntax to `filter`
# Like a SELECT in SQL


# base R approach to select DepTime, ArrTime, and FlightNum columns
flights[, c("DepTime", "ArrTime", "FlightNum")]

#install.packages("sparklyr")

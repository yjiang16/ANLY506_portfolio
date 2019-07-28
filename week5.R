# Week5_Tidy Data, Wrangling 

# Load the library
library(tidyverse)

# Check the data
table1
table2
table3

# Use table1 as example
# Compute rate /10000
table1 %>%
  mutate(rate = cases / population * 10000)

# Compute cases per year
table1 %>%
  count(year, wt = cases)

# Create a diagram
library(ggplot2)
ggplot(table1, aes(year, cases)) +                      # set x&y
  geom_line(aes(group = country), colour = "red") +     # set line colour
  geom_point(aes(colour = country))                     # set point colour

# Gathering
## Load table4a as an example
table4a

# Combine similar data
table4a %>%
  gather('1999', '2000', key = "year", value = "cases")

table4a %>%
  gather('1999', '2000', key = "year", value = "population")   # Check different element

# Combine tibble _ relational data
tidy4a <- table4a %>%
  gather('1999', '2000', key = "year", value = "cases")
tidy4b <- table4b %>%
  gather('1999', '2000', key = "year", value = "population")
left_join(tidy4a, tidy4b)

# Spreading, Use table2 as example, spread values
table2 %>%
  spread(key = type, value = count)

# Separate, use table3
table3 %>%
  separate(rate, into = c("cases", "population"))  # name the values

# Same function
table3 %>%
  separate(rate, into = c("cases", "population"), sep = "/") 
table3 %>%
  separate(rate, into = c("cases", "population"), convert = TRUE)   

# Unit, table5 as example
# Check the data
table5     

table5 %>%
  unite(new, century, year)

# Missing values
## Create a simple date for use
stocks <- tibble(
  year = c(1990, 1990, 1991, 1991, 1991),
  qtr = c(1, 2, 3, 4, 2),
  return = c(1.77, 3.87, 5.34, NA, 1.23)
)

## Seperate the values
stocks %>%
  spread(year, return)

## Gether the year and filter NA
stocks %>%
  spread(year, return) %>%
  gather(year, return, '1990':'1991', na.rm = TRUE)

## Complete
stocks %>%
  complete(year, qtr)


  
  
  
  
  

# Week4_Data Wrangling & Create dataframe and matrices 

# Install & Load libraries
install.packages("tidyverse")
install.packages("ggplot2")
install.packages("rmarkdown")
install.packages("pryr")

# Check the properties of vector
typeof(letters)
typeof(1:10)

# Check the length
x <- list("a", "b", "c", 1:10)
length(x)

# Try the logical vectors
1:10 %% 3 == 0
c(TRUE, TRUE, FALSE, NA)

# Try numeric vector
typeof(1)
typeof(1L)

x <- sqrt(2) ^ 2
x

x - 2

# Check the size of string
x <- "This is a reasonably long string."
pryr::object_size(x)

y <- rep(x, 500)
pryr::object_size(y)


# Missing values

x <- sample(20, 100, replace = TRUE)
y <- x > 10
# See how many are greater than 10
sum(y)

# See what proportion are greater than 10
mean(y)

sample(10) + 100

runif(10) > 0.5

# Check the vector of different lenght
1:10 + 1:2

tibble(x = 1:4, y = 1:2)   # error: * Length 2: Column `y` * Length 4: Column `x`

tibble(x = 1:4, y = rep(1:2, 2))   # Need to recycle manully with rep()

# Name voctors
c(x = 1, y = 2, z = 4)

library("purrr")

set_names(1:3, c("a", "b", "c"))   # Need to go back any load the library

# Subsetting numeric vector
x <- c("one", "two", "three", "four", "five")
x[c(3, 2, 5)]

x[c(1, 2, 4, 5, 3, 4, 1)]

# Try negative values
x[c(-1, -3, -5)]     # Drop it from the list
                     # Cannot mix positive and negative elements

# Subsetting logical vector
x <- c(10, 3, NA, 5, 8, 1, NA)
x[!is.na(x)]     # filter the missing values

x[x %% 2 == 0]     # even of missing values 


# Create a list
x <- list(1, 2, 3)
x

# Check structure of the list
str(x)

x_named <- list(a = 1, b = 2, c = 3)
str(x_named)

# Visualising lists
# Create sample lists
x1 <- list(c(1, 2), c(3, 4))
x2 <- list(list(1, 2), list(3, 4))
x3 <- list(1, list(2, list(3)))

# Attributes
x <- 1:10
attr(x, "greeting")     # NULL

attr(x, "greeting") <- "Hello"
attr(x, "farewell") <- "Goodbye"
attributes(x)

# Function
as.Date

# Use method, Check the functions of methods()
methods("as.Date")

# Get the specific implementation of a method
getS3method("as.Date", "default")

# Factors
x <- factor(c("ab", "cd", "ab"), levels = c("ab", "cd", "ef"))
typeof(x)
attributes(x)

# Dates
x <- as.Date("1971-01-01")     # R base date - 1970.01.01
unclass(x)
typeof(x)
attributes(x)

# Time
x <- lubridate::ymd_hm("1970-01-01 01:00")
unclass(x)
typeof(x)
attributes(x)

attr(x, "tzone") <- "US/Pacific"     # 1970-01-01 01:00:00 UTC
x

attr(x, "tzone") <- "US/Eastern"     # 1969-12-31 20:00:00 EST
x

# Check POSIXIt
y <- as.POSIXct(x)
typeof(y)
attributes(y)

# Tibbles
tb <- tibble::tibble(x = 1:5, y = 5:1)
typeof(tb)
attributes(tb)

df <- data.frame(x = 1:5, y = 5:1)
typeof(df)
attributes(df)

# Create matrices and dataframe
# Set the object
x <- 1:5
y <- 6:10
z <- 11:15

## Set the columns-base with cbind
cbind(x, y, z)

## Set the row-base with rbind
rbind(x, y, z)

# Create a matrix with character makes everything character
cbind(c(1, 2, 3, 4, 5),
      c("a", "b", "c", "d", "e"))

# Create a matrix by setting number of rows and columns
matrix(data = 1:10,
       nrow = 5,
       ncol = 2)

# Create a dataframe with survey data
survey <- data.frame("index" = c(1, 2, 3, 4, 5),
                     "sex" = c("f", "f", "f", "m", "m"),
                     "age" = c(12, 44, 56, 35, 67))
                    # stringAsFactor = FALSE --- change the str to no factor
# Check the result
survey












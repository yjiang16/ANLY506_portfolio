# Week3_Data Import(.csv) & Data Workflow & Data Wrangling

# Install packages
install.packages("dplyr")
install.packages("readr")

# Load the libraried
library(dplyr)
library(readr)

# Get to the right workspace
getwd()
setwd(dir = "/Users/yiqi/data_science_506/data")

# Read the csv file
ozone <- read_csv("US EPA data 2017.csv")

names(ozone) <- make.names(names(ozone))

# Check the number of rows and columns
nrow(ozone)
ncol(ozone)

# Run str
str(ozone)

# Look the head of the data
head(ozone[, c(6:7, 9)])

# Look the bottom of the data
tail(ozone[, c(6:7, 9)])

# filter the data
table(ozone$Sample.Duration)

# Have only the data I want to look at
filter(ozone, Sample.Duration == "12 Hour") %>%
       select(State.Code, County.Code, Site.Num)

# Create the data frame with only useful data, be careful with uppercase letter
filter(ozone, State.Code == "01"
       & County.Code == "073"
       & Site.Num == "1003") %>%
  select(Latitude, Method.Name, Valid.Day.Count) %>%
  as.data.frame()

# See how many states are in this dataset
select(ozone, State.Code) %>% unique %>% nrow

# Check the unique elements of the dataset
unique(ozone$State.Code)

# Check the Datum of the dataset
summary(ozone$Latitude)

# Check some detail on the distribution
quantile(ozone$Latitude, seq(0, 1, 0.1))

# Rank by state and county
ranking <- group_by(ozone, State.Code, County.Code) %>%
  summarize(ozone = mean(Latitude)) %>%
  as.data.frame %>%
  arrange(desc(ozone))

# Look at top 5 in this ranking
head(ranking, 5)

# Look at bottom 5
tail(ranking, 5)

# Challenge solution
## Set 1234, resample the what to replace
set.seed(1234)
N <- nrow(ozone)
idx <- sample(N, N, replace = TRUE)
ozone2 <- ozone[idx,]

# Create a ranking2 with the replaced data
ranking2 <- group_by(ozone2, State.Code, County.Code) %>%
  summarize(ozone = mean(Latitude)) %>%
  as.data.frame %>%
  arrange(desc(ozone))

# Compare the top 5 of ranking and ranking2
cbind(head(ranking, 5),
      head(ranking2, 5))



                                
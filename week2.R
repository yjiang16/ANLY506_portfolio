# Week2_basic knowledge about R & data import

# pringt the table file directory
getwd ()

# Change my working directory to this path
setwd(dir = "/Users/yiqi/Downloads")

# Change back to the dirctory I was working
setwd(dir = "/Users/yiqi/data_science_506")

# Create a data frame file
study1.df <- data.frame(id = 1:5,
                        sex = c("m", "m", "f", "f", "m"),
                        score = c(51, 20, 67, 52, 42))

# Aggregate score by sex
score.by.sex <- aggregate(score ~ sex,
                          FUN = mean,
                          data = study1.df)

study1.htest <- t.test(score ~ sex,
                       data = study1.df)

# Write the data to a file
save(study1.df, score.by.sex, study1.htest,
     file = "data/study1.RData")

# Check the data frame
study1.df

# Save a workspace to complete_image.RData in the data folder
save.image(file = "data/projectimage.RData")

# Load objects in study1.RData into the workspace
load(file = "data/study1.RData")

# Load objects in projectimage.RData into workspace
load(file = "data/projectimage.RData")

# Remove files from the workspace
rm(list = ls())


## txt practice

# Read a table
mydata <- read.table(file = "data/table.txt")

# Show the table
mydata

# Read a file from the web
web <-read.table(file = "http://goo.gl/jTNf6P",
                 sep = "\t",
                 header = TRUE)
# Show the data
web



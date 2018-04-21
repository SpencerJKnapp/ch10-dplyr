# Exercise 8: exploring data sets

# Load the dplyr library
library(dplyr)

# Read in the data (from `data/pupulitzer-circulation-data.csv`). Remember to 
# not treat strings as factors!
circulation_data <- read.csv("data/pulitzer-circulation-data.csv", stringsAsFactors = F)

# View in the data set. Start to understand what the data set contains
View(circulation_data)

# Print out the names of the columns for reference
colnames(circulation_data)

# Use the 'str()' function to also see what types of values are contained in 
# each column (you're looking at the second column after the `:`)
# Did any value type surprise you? Why do you think they are that type?
str(circulation_data)

# Add a column to the data frame called 'Pulitzer.Prize.Change` that contains 
# the difference in the number of times each paper was a winner or finalist 
# (hereafter "winner") during 2004-2014 and during 1990-2003
new_circulation_data <- mutate(circulation_data, 
       Pulitzer.Prize.Change = 
         Pulitzer.Prize.Winners.and.Finalists..2004.2014 - 
         Pulitzer.Prize.Winners.and.Finalists..1990.2003)

# What was the name of the publication that has the most winners between 
# 2004-2014?
most_winners_2004_2014 <- new_circulation_data %>%  filter(Pulitzer.Prize.Winners.and.Finalists..2004.2014 
                               == max(Pulitzer.Prize.Winners.and.Finalists..2004.2014)) %>% 
                        select(Newspaper)

# Which publication with at least 5 winners between 2004-2014 had the biggest
# decrease(negative) in daily circulation numbers?


# An important part about being a data scientist is asking questions. 
# Write a question you may be interested in about this data set, and then use  
# dplyr to figure out the answer!

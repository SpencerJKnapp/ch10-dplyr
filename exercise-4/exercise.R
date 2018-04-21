# Exercise 4: practicing with dplyr

# Install the `nycflights13` package. Load (`library()`) the package.
# You'll also need to load `dplyr`
install.packages("nycflights13")
library(nycflights13)
library(dplyr)

# The data frame `flights` should now be accessible to you.
# Use functions to inspect it: how many rows and columns does it have?
# What are the names of the columns?
# Use `??flights` to search for documentation on the data set (for what the 
# columns represent)
nrow(flights)
ncol(flights)
View(flights)

# Use `dplyr` to give the data frame a new column that is the amount of time
# gained or lost while flying (that is: how much of the delay arriving occured
# during flight, as opposed to before departing).
flights_1 <- mutate(flights, 
  airtime_delay = arr_time - sched_arr_time)
airtime_delay <- flights(arr_time - sched_arr_time)


# Use `dplyr` to sort your data frame in descending order by the column you just
# created. Remember to save this as a variable (or in the same one!)
flights_1 <- arrange(flights_1, airtime_delay)

# For practice, repeat the last 2 steps in a single statement using the pipe
# operator. You can clear your environmental variables to "reset" the data frame
flights_1 <- mutate(flights, airtime_delay = arr_delay - dep_delay) %>% 
            arrange(-airtime_delay)

# Make a histogram of the amount of time gained using the `hist()` function
time_gained <- hist(flights_1$airtime_delay)

# On average, did flights gain or lose time?
# Note: use the `na.rm = TRUE` argument to remove NA values from your aggregation
mean(flights_1$airtime_delay, na.rm = TRUE)
View(flights_1)
# Create a data.frame of flights headed to SeaTac ('SEA'), only including the
# origin, destination, and the "gain_in_air" column you just created
sea_flights <- flights_1 %>% 
            filter(dest == "SEA") %>% 
            select(origin, dest, airtime_delay)

# On average, did flights to SeaTac gain or loose time?
sea_delays <- mean(sea_flights$airtime_delay, na.rm = TRUE)

# Consider flights from JFK to SEA. What was the average, min, and max air time
# of those flights? Bonus: use pipes to answer this question in one statement
# (without showing any other data)!


flights_1 %>% 
  group_by(dest) %>% 
  


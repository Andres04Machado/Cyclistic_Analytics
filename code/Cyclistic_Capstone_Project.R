## ----message=FALSE, results="hide"-----------------------------------------------------------------------
library(tidyverse) # Gives us general data analysis functions
library(lubridate) # Helps with date functions
library(geosphere) # Helps with distance functions
library(ggplot2) # Helps with data visualizations


## ----message=FALSE---------------------------------------------------------------------------------------
# Reading the csv files from Nov 2021 to Nov 2022
nov_21 <- read_csv("202111-divvy-tripdata.csv")

dec_21 <- read_csv("202112-divvy-tripdata.csv")

jan_22 <- read_csv("202201-divvy-tripdata.csv")

feb_22 <- read_csv("202202-divvy-tripdata.csv")

mar_22 <- read_csv("202203-divvy-tripdata.csv")

apr_22 <- read_csv("202204-divvy-tripdata.csv")

may_22 <- read_csv("202205-divvy-tripdata.csv")

jun_22 <- read_csv("202206-divvy-tripdata.csv")

jul_22 <- read_csv("202207-divvy-tripdata.csv")

aug_22 <- read_csv("202208-divvy-tripdata.csv")

sep_22 <- read_csv("202209-divvy-publictripdata.csv")

oct_22 <- read_csv("202210-divvy-tripdata.csv")

nov_22 <- read_csv("202211-divvy-tripdata.csv")


## ----results="hide"--------------------------------------------------------------------------------------
colnames(nov_21)
colnames(dec_21)
colnames(jan_22)
colnames(feb_22)
colnames(mar_22)
colnames(apr_22)
colnames(may_22)
colnames(jun_22)
colnames(jul_22)
colnames(aug_22)
colnames(sep_22)
colnames(oct_22)
colnames(nov_22)


## ----results="hide"--------------------------------------------------------------------------------------
str(nov_21)
str(dec_21)
str(jan_22)
str(feb_22)
str(mar_22)
str(apr_22)
str(may_22)
str(jun_22)
str(jul_22)
str(aug_22)
str(sep_22)
str(oct_22)
str(nov_22)


## --------------------------------------------------------------------------------------------------------
alltrips_data <- bind_rows(nov_21, dec_21, jan_22, feb_22, mar_22, apr_22, may_22, jun_22, jul_22, aug_22, sep_22, oct_22, nov_22)


## --------------------------------------------------------------------------------------------------------
colnames(alltrips_data) # Ensure that the column names have remained the same
str(alltrips_data) # Checking to see if all data types are the same as before
nrow(alltrips_data) # Gives the number of rows in the file
dim(alltrips_data) # Gives the dimensions of the data frame
head(alltrips_data) # Gives us first couple rows of data
tail(alltrips_data) # Gives us last couple rows of data
summary(alltrips_data) # Gives the statistical summary of the data


## --------------------------------------------------------------------------------------------------------
# Checking member_casual column
table(alltrips_data$member_casual)


## --------------------------------------------------------------------------------------------------------
# Checking rideable_type column
table(alltrips_data$rideable_type)


## --------------------------------------------------------------------------------------------------------
alltrips_data$date <- as.Date(alltrips_data$started_at) # YYYY-MM-DD

alltrips_data$year <- format(as.Date(alltrips_data$date), "%Y") # Year (####) Column

alltrips_data$month <- format(as.Date(alltrips_data$date), "%m") # Month (00-12) Column

alltrips_data$day <- format(as.Date(alltrips_data$date),"%d") # Day (00-31) Column

alltrips_data$day_of_week <-format(as.Date(alltrips_data$date), "%A") # Day of the Week (Sunday-Saturday) Column


## --------------------------------------------------------------------------------------------------------
# Adding the ride_length column in Seconds
alltrips_data$ride_length <- difftime(alltrips_data$ended_at, alltrips_data$started_at)


## --------------------------------------------------------------------------------------------------------
str(alltrips_data)


## --------------------------------------------------------------------------------------------------------
is.numeric(alltrips_data$ride_length)


## --------------------------------------------------------------------------------------------------------
alltrips_data$ride_length <- as.numeric(as.character(alltrips_data$ride_length))

is.numeric(alltrips_data$ride_length) #Verifying that it is now numeric


## --------------------------------------------------------------------------------------------------------
alltrips_data$ride_distance <- distGeo(matrix(c(alltrips_data$start_lng, alltrips_data$start_lat), ncol=2), matrix(c(alltrips_data$end_lng, alltrips_data$end_lat), ncol=2))

alltrips_data$ride_distance <- alltrips_data$ride_distance/1000 #distance in km


## --------------------------------------------------------------------------------------------------------
alltrips_data_v2 <- alltrips_data[!(alltrips_data$ride_length <= 0 | alltrips_data$ride_distance == 0),]

alltrips_data_v2 <- na.omit(alltrips_data_v2) # Gets rid of any NA values
dim(alltrips_data_v2)


## --------------------------------------------------------------------------------------------------------
# All figures will be in seconds
summary(alltrips_data_v2$ride_length)


## --------------------------------------------------------------------------------------------------------
# All figures will be in kilometers
summary(alltrips_data_v2$ride_distance)


## --------------------------------------------------------------------------------------------------------
# Figures will be in Seconds
aggregate(alltrips_data_v2$ride_length ~ alltrips_data_v2$member_casual, FUN = mean)


## --------------------------------------------------------------------------------------------------------
# Figures will be in Kilometers
aggregate(alltrips_data_v2$ride_distance ~ alltrips_data_v2$member_casual, FUN = mean)


## --------------------------------------------------------------------------------------------------------
# Putting the days in order
alltrips_data_v2$day_of_week <- ordered(alltrips_data_v2$day_of_week, levels=c("Sunday", "Monday", "Tuesday", "Wednesday", "Thursday", "Friday", "Saturday"))

# Average ride time by each day of the week members vs casual users
aggregate(alltrips_data_v2$ride_length ~ alltrips_data_v2$member_casual + alltrips_data_v2$day_of_week, FUN = mean)

# Average ride distance by each day of the week members vs casual users
aggregate(alltrips_data_v2$ride_distance ~ alltrips_data_v2$member_casual + alltrips_data_v2$day_of_week, FUN = mean)


## --------------------------------------------------------------------------------------------------------
# Ride Length
aggregate(alltrips_data_v2$ride_length ~ alltrips_data_v2$member_casual + alltrips_data_v2$month +alltrips_data_v2$year, FUN = mean) %>%

# Ride Distance
aggregate(alltrips_data_v2$ride_distance ~ alltrips_data_v2$member_casual + alltrips_data_v2$month +alltrips_data_v2$year, FUN = mean)


## --------------------------------------------------------------------------------------------------------
alltrips_data_v2 %>%
  group_by(member_casual) %>%
  summarise(ride_count = length(ride_id))


## --------------------------------------------------------------------------------------------------------
alltrips_data_v2 %>%
  group_by(member_casual) %>%
  summarise(ride_count = length(ride_id)) %>%
  ggplot(aes(x = member_casual, y = ride_count, fill = member_casual)) +
  geom_col(width = 1) +
  labs(title = "Total Amount of Rides by Member and Casual Riders: Nov 2021 - Nov 2022") +
  scale_y_continuous(labels = function(x) format(x, scientific = FALSE))


## --------------------------------------------------------------------------------------------------------
alltrips_data_v2 %>%  
  group_by(member_casual, month, year) %>% 
  summarise(number_of_rides = n(),.groups="drop") %>% 
  arrange(member_casual, month, year)  %>% 
  ggplot(aes(x = month, y = number_of_rides, fill = member_casual)) +
  labs(title ="Total Rides by Members and Casual Riders by Month", subtitle = "January (Month 01) - December (Month 12)") +
  theme(axis.text.x = element_text(angle = 45)) +
  geom_col(width=0.5, position = position_dodge(width=0.5)) +
  scale_y_continuous(labels = function(x) format(x, scientific = FALSE))


## ----message=FALSE, warning=FALSE------------------------------------------------------------------------
alltrips_data_v2 %>%
  mutate(weekday = wday(started_at, label = TRUE)) %>% #Creates weekday field using wday()
  group_by(member_casual, weekday) %>% # Groups by usertype and weekday
  summarise(number_of_rides = n(), average_duration = mean(ride_length)) %>% #Calculates the number of rides and average duration
  arrange(member_casual, weekday) %>% #sorts
  ggplot(aes(x = weekday, y = number_of_rides, fill = member_casual)) +
  geom_col(width = 0.5,position = "dodge") + 
  labs(title = "Total Amount of Rides by Member and Casual Riders: Days of the Week") +
  scale_y_continuous(labels = function(x) format(x, scientific = FALSE))



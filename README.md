# Google Data Analytics Certificate Capstone: Cyclistic Analytics
<img width="197" alt="Screenshot 2025-05-06 at 10 58 46 AM" src="https://github.com/user-attachments/assets/124fd80f-26f0-4714-a915-25db26fdefe2" />

## Author: Andres Machado

*This repository houses the case study I completed at the end of the Google Data Analytics Certificate.*

I wanted to express my gratitude to Coursera and Google for their incredible work on this course and for providing this problem set. I also want to give a special shoutout to Divvy and Motivate International Inc. for lending the dataset in accordance with their [licence](https://divvybikes.com/data-license-agreement).

### 1. Introduction of the Company
Cyclistic as they are is a fictitious bike-share program company that features more than 5,800 bicycles and 600 docking stations. Cyclistic sets itself apart by also offering reclining bikes, hand tricycles, and cargo bikes, making bike-share more inclusive to people with disabilities and riders who can't use a standard two-wheeled bike. The bikes can be unlocked from one station and returned to any other station in the system anytime.
The majority of riders opt for traditional bikes; about 8% of riders use assistive options. Cyclistic users are more likely to ride for leisure, but about 30% use them to commute to work each day.

#### Current Marketing Strategy
Until now, Cyclistic's marketing strategy relied on building general awareness and appealing to broad consumer segments. One approach that helped make these things possible was the flexibility of its pricing plans:

- Single-Ride Passes: $1 + $0.16 per minute of a ride
- Full-Day Passes: $15 + $0.16 per minute if a ride goes over 3 hours
- Annual Memberships: $10 dollars per month and an upfront annaul cost of $119
Cyclistic identifies those who purchase the single-ride or full-day passes as casual riders. Customers who purchase annual memberships are Cyclistic/annual members.

Cyclistic's financial analysts have concluded that annual members are much more profitable than casual riders. Based on these conclusions, the stakeholders of the company have set a clear goal: **Designing marketing strategies aimed at converting casual riders into annual members.**

### 2. Objective and Data
The main objective of this analysis is to figure out **how do annual members and casual riders use Cyclistic bikes differently?** This will give us the insights on how to convince the casual riders to become annual members. Then, we can then implement a strategy to increase customer retention and annual memberships.

The data I was given was trip data from November 2021 to November 2022 in monthly installment `.csv` files. Unfortunately because of the [licence](https://divvybikes.com/data-license-agreement), I am not able to make this data available to this repository. The `.csv` files contain the following paramaters/columns:
- `ride_id`: Unique ride identifier
- `rideable_type`: The type of bike being used (classic_bike, electric_bike, or docked_bike)
- `started_at`: The date and time a individual bike ride started at
- `ended_at`: The date and time a individual bike ride ended at
- `start_station_name`: Name of station where the bike began its ride
- `end_station_name`: Name of station where the bike ended its ride
- `start_station_id`: Unique identifiers for the start station
- `end_station_id`: Unique identifiers for the end station
- `start_lat`: Latitude coordinate for the start station
- `start_lon`: Longitude coordinate for the start station
- `end_lat`: Latitude coordinate for the end station
- `end_lon`: Longitude coordinate for the end station
- `member_casual`: Class label of either being a annual member (member) and casual riders (casual)

The dimensions for the entire dataset combined is 6,093,429 rows and 13 columns.

### 3. Data Analysis
The entire data analysis study (collection, cleaning, analysis, and visualizations) was done using R. The code was done in a `.Rmd` format in RStudio. The code can be found in the [code](https://github.com/Andres04Machado/Cyclistic_Analytics/tree/main/code) folder. I generated a [pdf file](https://github.com/Andres04Machado/Cyclistic_Analytics/blob/main/output/Cyclistic_Capstone_Project.pdf) that combines both the R code and the markdown explaining the R code. The visualizations (as individual `.png` files) can be found in the [plots](https://github.com/Andres04Machado/Cyclistic_Analytics/tree/main/output/plots) folder. Refer to the hyperlinks to understand the analysis.

  



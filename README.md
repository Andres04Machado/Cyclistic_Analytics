# Google Data Analytics Certificate Capstone: Cyclistic Analytics
<img width="197" alt="Screenshot 2025-05-06 at 10 58 46 AM" src="https://github.com/user-attachments/assets/124fd80f-26f0-4714-a915-25db26fdefe2" />

![Language](https://img.shields.io/badge/language-R-blue.svg)
![Last Updated](https://img.shields.io/badge/last%20updated-May%202025-brightgreen)
![Status](https://img.shields.io/badge/status-completed-green)

## Author: Andres Machado

*This repository contains my capstone case study for the Google Data Analytics Certificate program. Special thanks to Coursera, Google, and Divvy for their contributions to the course and dataset.*

## 📚 Table of Contents
- [1. Company Background](#1-company-background)
- [2. Data](#2-data)
- [3. Data Analysis](#3-data-analysis)
- [4. Recommendations](#4-recommendations)
- [5. Future Work](#5-future-work)

## 1. Company Background
Cyclistic is a fictitious bike-share program company that operates more than 5,800 bicycles and 600 docking stations. Cyclistic sets itself apart by also offering reclining bikes, hand tricycles, and cargo bikes, making bike sharing more inclusive for people with disabilities and riders who are unable to use a standard two-wheeled bike. Bikes can be unlocked from one station and returned to any other station at any time.

The majority of riders opt for traditional bikes; about 8% of riders use assistive options. Cyclistic users are more likely to ride for leisure, while about 30% use them to commute to work each day.

#### Current Marketing Strategy
Historically, Cyclistic's marketing strategy relied on building general awareness and appealing to broad consumer segments. One approach that has supported this strategy was the flexibility of its pricing plans:

- **Single-Ride Pass**: $1 base + $0.16 per minute.
- **Full-Day Pass**: $15 base + $0.16 per minute (if ride exceeds 3 hours).
- **Annual Membership**: $10/month or $119/year.

Cyclistic identifies those who purchase the single-ride or full-day passes as casual riders. Customers who purchase annual memberships are referred to as annual members.

Cyclistic's financial analysts have concluded that annual members are much more profitable than casual riders. Based on these conclusions, the stakeholders of the company have set a clear goal: **Designing marketing strategies aimed at converting casual riders into annual members.** This will provide insights on how to encourage  casual riders to become annual members. We can then implement a strategy to increase customer retention and annual memberships. 

## 2. Data
The dataset contains monthly ride records from November 2021 to November 2022 in `.csv` format. These files were sourced from Divvy's open data system but cannot be shared directly due to [license restrictions](https://divvybikes.com/data-license-agreement).

The merged dataset consists of 13 columns and 6,093,429 rows. Key variables include:

- `ride_id`: Unique ride identifier
- `rideable_type`: The type of bike being used (classic_bike, electric_bike, or docked_bike)
- `started_at`: The date and time an individual bike ride started 
- `ended_at`: The date and time an individual bike ride ended 
- `start_station_name`: Name of station where the bike began its ride
- `end_station_name`: Name of station where the bike ended its ride
- `start_station_id`: Unique identifier for the start station
- `end_station_id`: Unique identifier for the end station
- `start_lat`: Latitude coordinate for the start station
- `start_lon`: Longitude coordinate for the start station
- `end_lat`: Latitude coordinate for the end station
- `end_lon`: Longitude coordinate for the end station
- `member_casual`: Label indicating whether the rider is an annual member (`member`) or a casual rider (`casual`).

### 3. Data Analysis

This project explores behavioral differences between casual and annual members using R. The entire workflow including data collection, cleaning, EDA, and visualization was completed in an `.Rmd` notebook using RStudio.

- 📄 Code: Available in the [`code/`](https://github.com/Andres04Machado/Cyclistic_Analytics/tree/main/code)  folder.
- 📊 Visuals: View standalone .png charts in the [`plots/`](https://github.com/Andres04Machado/Cyclistic_Analytics/tree/main/output/plots) folder.
- 🧾 Full Report: Integrated PDF with code and explanation is [here](https://github.com/Andres04Machado/Cyclistic_Analytics/blob/main/output/Cyclistic_Capstone_Project.pdf)

#### Conclusions from Data Analysis
1. **Ride Volume**: Annual members took more total rides than casual riders.
**INSERT BAR PLOT**
2. The average ride length among all riders is about **16.3** minutes. In general, casual riders took longer rides than annual members. The average ride length for casuals is about **22.8** minutes while the average ride length for annual members is about **12.3** minutes.
3. The average ride distance amongst all riders is about **1.4** miles. 
Broadly speaking, casual riders rode for longer distances than annual members, although not by much. The average ride distance for casuals is about **1.4** miles while the average ride length for annual members is about **1.3** miles.
4. Interestingly, casuals rode for longer times on Sundays and rode farther distances on Saturdays. The opposite is true for members where they rode for longer times on Saturdays and rode farther distances on Sundays. This suggests that both groups love the weekends as total amount of rides increased on Friday, Saturday, and Sunday relative to the weekdays. This is supported by the following bar chart:
**INSERT BAR PLOT**
5. Both types of riders rode for longer and farther in the spring and summer months. However, the total number of total riders decreased as fall and spring came around. This is to say Cyclistic hosts their services in a city where it gets chilly in the fall and winter. This is supported by the following bar chart:
**INSERT BAR PLOT**

## 4. Recommendations
To reiterate, the main objective of this analysis is **how annual members of Cyclistic and casual riders use Cyclistic bikes differently?**

To convert more casual riders into annual members, consider the following strategies:
1. <ins>Member Referral Incentive Program</ins>
  - Annual members ride significantly more than casual riders.They are more familiar with the company's benefits and membership tiers. One could develop a system where each successful referral could unlock increasing rewards (e.g., merchandise, discounts, free rides). This would provide stronger incentives to be a member and recruit other members in the process
2. <ins>Streak-Based Incentives for Weekday Usage</ins>
  - My findings showed that although the weekdays weren't very popular overall, members still rode on weekdays. The margin of riders compared to casuals was much greater on weekdays than weekends. As a result, annual members may already be riding Cyclistic consistently on weekdays. I propose we capture casuals by making them want to get the streak of consecutive days. Marketing can glorify streaks in many ways but to name a few:
      - Creating a streak challenge on social media.
      - Having advertisements placed around all of the stations   promoting having streaks.
      - Making it a status symbol on a Cyclistic Mobile App so users can showcase their streaks.
3. <ins>Offer Discounts to Memberships</ins>
  - On average, casuals typically take longer and farther rides than annual members. We can add a tier of membership for long distance riders and it could be with limited features but it would also be cheaper in price (perhaps $7 per month). Discounting memberships during the winter months might be useful as well. There was a steady decline of rides during the fall and winter months and a discount of membership might be just what it needs to boost the total rides. The rides may slightly increase but the goal is to introduce casuals to the membership, so when prices return to normal to the regular price they might be more likely to keep the membership after the promotional period ends.

## 5. Future Work
While this analysis uncovered many differences between Cyclistic's annual members and casual riders, there are additional areas worth exploring:

- **Station Usage Patterns**:
  
    We did not explore how riders differ in their use of start and end stations. It's possible that casual riders prefer certain high-traffic locations, while members utilize a broader range of stations. Analyzing station-level behavior could reveal geographic trends and inform infrastructure or marketing decisions.
- **Predictive Modeling**:

    Since the dataset includes labels for rider type, a binary classification model (e.g., Logistic Regression) could be developed to predict rider type based on features like ride length, day of the week, distance, and location. This could help Cyclistic proactively identify likely member candidates among casual users.

---
*Note: While the analysis was conducted between 12/27/2022 - 01/05/2023, this repository was updated on 05/07/2025 for final formatting and documentation*

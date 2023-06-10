# Google-The-Path-to-Insights-Data-Models-and-Pipelines-Coursera-Project

This repository contains Project files for the final end of course project of COURSERA's [Google The Path to Insights: Data Models and Pipelines](https://www.coursera.org/learn/the-path-to-insights-data-models-and-pipelines) course which is a part-2 of [Google Business Intelligence Professional Certificate](https://www.coursera.org/professional-certificates/google-business-intelligence) 3-Course series.

---

This is the planning phase of the project. Phase 2 - 

### Project Background & Scenario- 

![Cyclistic](https://github.com/jivaniyash/Google-The-Path-to-Insights-Data-Models-and-Pipelines-Coursera-Project/blob/main/_images/_Cyclistic.png)

Cyclistic has partnered with the city of New York to provide shared bikes. Currently, there are bike stations located throughout Manhattan and neighboring boroughs. Customers are able to rent bikes for easy travel between stations at these locations.

Cyclistic’s Customer Growth Team is creating a business plan for next year. The team wants to understand how their customers are using their bikes; their top priority is identifying customer demand at different station locations.

Cyclistic has captured data points for every trip taken by their customers, including:

- Trip start time and location (station number, and its latitude/longitude)

- Trip end time and location (station number, and its latitude/longitude)

- The rented bike’s identification number

- The type of customer (either a one-time customer, or a subscriber)

The dataset includes millions of rides, so the team wants a dashboard that summarizes key insights. 

The product development team at Cyclistic has begun developing their business plan for next year. In order to build a better Cyclistic, the team needs to understand how customers are currently using the bikes, how location and other factors impact demand, and what stations get the most traffic. The Cyclistic team has a few goals:

- Understand current customers needs, what makes a successful product, and how new stations might alleviate demand in different geographical areas

- Understand current usage of bikes at different locations 

- Apply customer usage insights to inform new station growth

- Understand how different users (subscribers and non-subscribers) use the bikes

---

# DataSet Gathering

For this end-of-course project, you will be using three public datasets, which exist in the public data available from the Explorer pane of your console: 

- [NYC Citi Bike Trips](https://console.cloud.google.com/marketplace/details/city-of-new-york/nyc-citi-bike)
- [Census Bureau US Boundaries](https://console.cloud.google.com/marketplace/product/united-states-census-bureau/us-geographic-boundaries)
- [GSOD from the National Oceanic and Atmospheric Administration](https://console.cloud.google.com/marketplace/details/noaa-public/gsod)

Additionally, one of your coworkers finds out you’re working on this project and shares a dataset they created recently for a project of their own that they think might help you: 
- [NYC zip codes](https://docs.google.com/spreadsheets/d/1IIbH-GM3tdmM5tl56PHhqI7xxCzqaBCU0ylItxk_sy0/template/preview#gid=806359255) stored in Drive or stored in this repo: [Cyclistic NYC zip codes - list](https://github.com/jivaniyash/Google-The-Path-to-Insights-Data-Models-and-Pipelines-Coursera-Project/blob/main/Cyclistic%20NYC%20zip%20codes%20-%20list.csv)

This new dataset provides the zip codes for the different neighborhoods and boroughs in New York City; this will let you compare the bike data to the weather data more easily since you will be able to match the locations more accurately. It will also help you develop your map visualization later on.  

In this activity, you created target tables to consolidate and store the data you pulled from the Cyclistic datasets. 

Using the Google Cloud's BigQuery tool, create project, dataset, table to load data. 

Table 1 - [Query 1](https://github.com/jivaniyash/Google-The-Path-to-Insights-Data-Models-and-Pipelines-Coursera-Project/blob/main/SQL_BigQuery.sql) - SQL query to create a summary table for the entire year.

Table 2 - [Query 2](https://github.com/jivaniyash/Google-The-Path-to-Insights-Data-Models-and-Pipelines-Coursera-Project/blob/main/SQL_BigQuery.sql) - results into a similar table as the previous query, except it focuses on trends from July through September that captured data from just the summer season.

These tables will allow you to develop a dashboard using Tableau in the upcoming end-of-course project activities in the next course -- Phase - 3 -- [Google-Decisions-Decisions-Dashboards-and-Reports](https://github.com/jivaniyash/Google-Decisions-Decisions-Dashboards-and-Reports-Coursera-Project). As a BI professional, you will need to be able to use programs such as BigQuery and Dataflow to move and analyze data with SQL. 

---

### Disclaimer 
Background: 

In this fictitious workplace scenario, the imaginary company Cyclistic has partnered with the city of New York to provide shared bikes. Currently, there are bike stations located throughout Manhattan and neighboring boroughs. Customers are able to rent bikes for easy travel among stations at these locations. 

Scenario:

I am a newly hired BI professional at Cyclistic. The company’s Customer Growth Team is creating a business plan for next year. They want to understand how their customers are using their bikes; their top priority is identifying customer demand at different station locations. Previously from [Phase - 1](https://github.com/jivaniyash/Google-Foundations-of-Business-Intelligence-Coursera-Project), I gathered information from meeting notes and completed important project planning documents. 

Course 2 challenge:

- Use project planning documents to identify key metrics and dashboard requirements

- Observe stakeholders in action to better understand how they use data

- Gather and combine necessary data

- Design reporting tables that can be uploaded to Tableau to create the final dashboard

Note: The story, as well as all names, characters, and incidents portrayed, are fictitious. No identification with actual people (living or deceased) is intended or should be inferred. The data shared in this project has been created for pedagogical purposes.
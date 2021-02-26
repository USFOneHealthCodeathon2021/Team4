# Project Name: Social Cost
---
**Team Leaders**: Jenna Oberstaller, Justin Gibbons

**Team Members**:  Teresa Darcey, Samira Jahangiri, Alyssa Obermayer, Vyoma Sheth, Justin Swanson

**GVN/USF consulting advisor**: Dr. Gene Morse

## Objectives

The goal of our project is to address vaccine and resource distribution and disparities as well as vaccine hesitancy by providing the public with pertinent and easily accessible data on COVID-19 cases and risk factors/vulnerability indices, as well as social media-derived sentiment analysis. With this data, we will enable the public  make informed decisions to keep themselves and their communities safe since disease spread is largely predicated on social behavior. 

## Methods and Implementation

![](https://i.imgur.com/0HaQGtD.png)

To begin generating our Covid-19 dashboard data was gathered from the various sources listed below. A general overlook of this data allowed us to gain a better understanding of how to best manipulate the information to draw correlations between Covid-19 case numbers and certain covariates, such as education level, income, household size, race, and means of transportation. Once the appropriate data was obtained, it was then cleaned and formatted through the use of R, Microsoft Excel, and Python. Further, this data was incorporated within an interactive user interface through R Shiny. This includes a geographic display of Florida at a zip code level as well as an interactive graphical interface which the user may select the covariates they wish to compare with Covid-19 data. These features allow for the user to draw their own inferences from the data they are shown and access for themselves the impact of Covid-19 and potential community risk.

#### Sentiment analysis
Tweets satisfying the following criteria were collected for sentiment-analysis:
  - were tweeted between 1/1/2020 and 12/31/2020
  - were sent from within a __ radius from one of 100 selected Central Florida cities (INCLUDE SUPPLEMENTAL TABLE)
  - contained any of __(15?) selected key-phrases associated with mask-wearing (INCLUDE phrases)

We further selected snapshots of time in significant phases of the US pandemic-response to capture sentiment related to mask-wearing in pre-pandemic times (January 1 - January 8, February 1 to February 8, 2020), week-long time periods immediately preceding and during Florida lockdown-initiation (March 1 - March 8, April 1 - April 8, and May 1 - May 8, 2020), and during the later phases of the pandemic when lockdown orders had been lifted and pandemic fatigue settled in (August 1 - August 8, September 1 - September 8, and October 1 - October 8, 2020). 

Final down-selected tweets (n = ??) were next analyzed in aggregate using the R package tidytext to assess net positivity or negativity for each tweet (INSERT basic overview of sentiment analysis-concept). Tweets were finally combined by city to derive an aggregate sentiment-score regarding mask-wearing for each selected Central Florida city. 

### Data Sources

Data for the dashboard was gathered from these sources:

- Social Vulnerability Index data
  - https://www.atsdr.cdc.gov/placeandhealth/svi/data_documentation_download.html
  - 2018 data, Geography: Florida, Geography Type: Census Tract
- Zipcode Census Tract Conversion table
  - https://www.huduser.gov/portal/datasets/usps_crosswalk.html
  - "crosswalk type:" zip-tract; 4th quarter 2018
- Florida Covid Cases by Zip Code
  - https://covid19-usflibrary.hub.arcgis.com/datasets/florida-covid19-02242021-byzip-csv
  - Last Updated: 02.24.2021

  
### R Packages

The following R packages were used while creating our dashboard:

- dplyr v1.0.2
- shiny v1.5.0
- plotly v4.9.3
- tidyverse v1.3.0
- shinythemes v1.2.0
- leaflet v2.0.3
- tidycensus v0.11.4
- devtools v2.3.2
- mapview v2.9.0

### Python Software

Tweets were scraped from Twitter for sentiment-analysis using the following software packages implemented in python (v. 3.6.13):

- twint v. 2.1.21
- datetime
- pandas v. 1.1.5

## Interacting with the Covid-19 Dashboard



## Results 


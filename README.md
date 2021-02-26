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

The following Python software were used while creating our dashboard:

- twint
- datetime
- pandas

## Interacting with the Covid-19 Dashboard



## Results 


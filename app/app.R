library(shiny)
library(plotly)
library(tidyverse)
library(shinythemes)
library(leaflet)
library(tidycensus)
library(devtools)
library(mapview)

census_api_key("4ba7df1765f2f9633dfc0f1b0eefde8464fdd2d1")
readRenviron("~/.Renviron")

fl_pop <- get_acs(geography = "zcta",
                  variables = c("B11016_001","B19101_001", "B05010_001","B24011_001"),
                  state = "FL",
                  geometry = TRUE)

# the ui object has all the information for the user-interface
ui <- fluidPage(
    h1("Social Cost"),
    theme = shinytheme("sandstone"),
    leafletOutput("mymap")
)


server <- function(input, output, session) {
    m <- mapview(fl_pop,zcol = "estimate")
    output$mymap <- renderLeaflet({
       m@map
    })
}


shinyApp(ui, server)


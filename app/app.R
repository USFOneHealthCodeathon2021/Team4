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
fl_pop1 <- fl_pop
median_income <- read.table("/Users/vyomasheth/Documents/Codethon_2021/Team4/app/median_income_dotplot.tsv",header = T, fill = TRUE)
low_income <- read.table("/Users/vyomasheth/Documents/Codethon_2021/Team4/app/low_income_proportion_and_prevelance_dotplot.tsv" , fill = TRUE , header = T)
race <- read.table("/Users/vyomasheth/Documents/Codethon_2021/Team4/app/race_and_prevelance.tsv", header = T, sep = "\t")
non_white <- read.table("/Users/vyomasheth/Documents/Codethon_2021/Team4/app/nonwhite_prop_and_prevelance.tsv",header = T, fill = TRUE)

# the ui object has all the information for the user-interface
ui <- fluidPage(
    titlePanel("Social Cost"),
    theme = shinytheme("sandstone"),
    leafletOutput("mymap"),
    tabsetPanel(
        # make the main tab
        tabPanel(
            "Covid and co-variates",
            fluid = TRUE,
            br(),
            sidebarLayout(
                sidebarPanel(
                    selectInput("COVIDCOVARIATES",
                                "COVARIATES:",
                                c("RACE" = "RACE",
                                  "LOW_INCOME" = "LOW_INCOME",
                                  "NON_WHITE" = "NON_WHITE",
                                  "MEDIAN_INCOME"="MEDIANINCOME"))
                    # checkboxGroupInput("COVIDCOVARIATES", "COVARIATES:",
                    #                    choices = c("Medianincome"="median_inc",
                    #                                "Race" ="race",
                    #                                "Housing status" = "hs",
                    #                                "Low income"= "li"),
                    #                    selected = "Median income")
                    
                ),
                
                # Show a plot of the generated distribution
                mainPanel(
                    plotlyOutput("Plot")
                )
            )
        )
    )
)

server <- function(input, output, session) {
    m <- mapview(fl_pop1,zcol = "estimate")
    
    output$mymap <- renderLeaflet({
        m@map
    })
    
    #write a function which would return that data
    getXData <- function(){
        #you need t0 know the value of $COVIDCOVARIATES =  RACE 
        if(identical(input$COVIDCOVARIATES,"MEDIANINCOME")){
            return(median_income$Median_Income)
        }
        print(input$COVIDCOVARIATES)
        if(identical(input$COVIDCOVARIATES,"LOW_INCOME")){
            return(low_income$Proportion)
        }
        if(identical(input$COVIDCOVARIATES,"RACE")){
            return(race$Proportion)
        }
        if(identical(input$COVIDCOVARIATES,"NON_WHITE")){
            return(non_white$Proportion)
        }
            
        return(low_income$Proportion)
    }
    
    getYData <- function(){
        if(identical(input$COVIDCOVARIATES,"MEDIANINCOME")){
            return(median_income$Prevelance)
        }
        if(identical(input$COVIDCOVARIATES,"LOW_INCOME")){
            return(low_income$Prevelance)
        }
        if(identical(input$COVIDCOVARIATES,"RACE")){
            return(race$Prevelance)
        }
        if(identical(input$COVIDCOVARIATES,"NON_WHITE")){
            return(non_white$Prevelance)
        }
        #you need t0 know the value of $COVIDCOVARIATES =  RACE 
        return(low_income$Prevelance)
    }
    
    output$Plot <- renderPlotly({
        plot1 <- plot_ly(
            y =c(getYData()),
            x= c(getXData())
            )
    })
    
    }


shinyApp(ui, server)


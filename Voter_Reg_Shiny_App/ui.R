#
# This is the user-interface definition of a Shiny web application. You can
# run the application by clicking 'Run App' above.
#
# Find out more about building applications with Shiny here:
#
#    http://shiny.rstudio.com/
#

library(shiny)
library(shinydashboard)
library(ggplot2)
library(dplyr)
library(ggthemes)
library(shinythemes)
library(lubridate)


clean_2016 = read.csv('clean_2016.csv')


# Define UI for application that draws a histogram
fluidPage(theme = shinytheme('cerulean'),

    # Application title
    titlePanel("NJ Voter Registration"),

    sidebarLayout(
        # Show a plot of the generated distribution
        
        mainPanel(
            selectizeInput(inputId = 'Congressional_District', label= 'Congressional District',
                           choices = clean_2016$Congressional_District),
        ),
        mainPanel(
            tabsetPanel(
                
                tabPanel('Home',
                    'This is just a test!'
                ),
                
                tabPanel('2016 Plot',
                'The following graph displays month-to-month % change in voter registration for your selected year & district.',
                'For example, % change on May 31, 2016 represents % change since the PREVIOUS reporting date, NOT cumulative growth since the beginning of the year.
                (If dates on the x-axis appear compressed, please ensure the application window is fully maximized.)',
                plotOutput('onesix')
                ),
                tabPanel('2016 Data',
                         'The dataframe for your selection is provided here. Please note that although the dataframe includes voter reg statistics by
                  party affiliation, the "Net Monthly Change" and "Percent Monthly Change" columns (and the graphic displayed in the "Plot" tab) are calculated from the "Total" column
                  for all registrations, regardless of party affiliation. The option to calculate & visualize change by party affiliation may be added in a future update.',
                         tableOutput('tableonesix')
                ),
                tabPanel('2020 Plot',
                         'The following graph displays month-to-month % change in voter registration for your selected year & district.',
                         'For example, % change on May 31, 2016 represents % change since the PREVIOUS reporting date, NOT cumulative growth since the beginning of the year.
                (If dates on the x-axis appear compressed, please ensure the application window is fully maximized.)',
                         plotOutput('twozero')
                ),
                tabPanel('2020 Data',
                         'The dataframe for your selection is provided here. Please note that although the dataframe includes voter reg statistics by
                  party affiliation, the "Net Monthly Change" and "Percent Monthly Change" columns (and the graphic displayed in the "Plot" tab) are calculated from the "Total" column
                  for all registrations, regardless of party affiliation. The option to calculate & visualize change by party affiliation may be added in a future update.',
                         tableOutput('tabletwozero')
                )
                
            )
        )
    )
        
)

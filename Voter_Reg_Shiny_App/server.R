#
# This is the server logic of a Shiny web application. You can run the
# application by clicking 'Run App' above.
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
clean_2020 = read.csv('clean_2020.csv')


function(input, output) {
    output$onesix=renderPlot(
        clean_2016 %>%
            filter(Congressional_District==input$Congressional_District) %>%
            ggplot(aes(x = Reporting_Date,
                       y = Percent_Monthly_Change,
                       fill = Percent_Monthly_Change > 0)) +
            geom_col() + theme_economist_white() + scale_fill_tableau() + guides(fill = "none")

        
    )

    output$twozero=renderPlot(
        clean_2020 %>%
            filter(Congressional_District==input$Congressional_District) %>%
            ggplot(aes(x = Reporting_Date,
                       y = Percent_Monthly_Change,
                       fill = Percent_Monthly_Change > 0)) +
            geom_col() + theme_economist_white() + scale_fill_tableau() + guides(fill = "none")
    )
    
    output$tableonesix=renderTable(
        clean_2016 %>%
            filter(Congressional_District==input$Congressional_District)
    )
    
    output$tabletwozero=renderTable(
        clean_2020 %>%
            filter(Congressional_District==input$Congressional_District)
    )
    
}

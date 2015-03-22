
# This is the user-interface definition of a Shiny web application.
# You can find out more about building applications with Shiny here:
#
# http://shiny.rstudio.com
#

library(shiny)

airlines<-list("AA"="AA", 
               "AS"="AS",
               "B6"="B6",
               "DL"="DL",
               "EV"="EV",
               "FL"="FL",
               "HA"="HA",
               "MQ"="MQ",
               "OO"="OO",
               "F9"="F9",
               "UA"="UA",
               "US"="US",
               "VX"="VX",
               "WN"="WN")

airports<-list("John F. Kennedy International"=12478,
               "Newark Liberty International"=11618,
               "Chicago Midway International"=13232,
               "Chicago O'Hare International"=13930,
              "Los Angeles International"=12892,
              "Las Vegas, McCarran International"=12889,
              "Seattle Tacoma Internationl"=14747,
              "San Francisco International"=14771,
              "Norman Y. Mineta San Jose International" = 14831,
              "Ronald Reagan Washington National"=11278,
              "Hartsfield-Jackson Atlanta International"=10397,
              "Miami International"=13303)

shinyUI(fluidPage(
        
        # Application title
        titlePanel("Airline flight time between U.S. Major Airport"),
        
        # Sidebar with a slider input for number of bins
        sidebarLayout(
                sidebarPanel(
                        
                        selectInput("from", label = h3("From Airport"), 
                                    choices = airports, selected = 1),
                        selectInput("to", label = h3("To Airport"), 
                                    choices = airports, selected = 1),
                        p("The data set is quite big, it will take some time to load.")
                ),
                
                # Show a plot of the generated distribution
                mainPanel(
                        textOutput("title"),  
                        hr(),
                        plotOutput("boxPlot"),
                        hr(),
                        p("This application is inspired by  "),
                        a(href="http://fivethirtyeight.com/interactives/flights/","FiveThirtyEight.com - Fastest Flight"),
                        
                        p("This application is using the March 2014 data and is downloaded from "),
                        a(href="http://www.transtats.bts.gov/DL_SelectFields.asp?Table_ID=236&DB_Short_Name=On-Time","Bureau of Transportation Statistics")
                        
                        
                        
                )
                
        )
))

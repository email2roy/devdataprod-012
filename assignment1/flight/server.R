
# This is the server logic for a Shiny web application.
# You can find out more about building applications with Shiny here:
#
# http://shiny.rstudio.com
#

library(shiny)


shinyServer(function(input, output) {
        
        # Get the airport code to airport name data
        airports <- read.csv("L_AIRPORT_ID.csv",na.string="")
        
        #Load the actual data
        data <- read.csv("705002017_T_ONTIME_2014_3.csv",na.string="")
                
        output$boxPlot <- renderPlot({
                
                trim <- data[data$ORIGIN_AIRPORT_ID==input$from & data$DEST_AIRPORT_ID==input$to,]
                if(nrow(trim)==0){
                        output$title <- renderText(paste("No flight from ",airports[airports$Code==input$from,]$Description , " -to-> ",airports[airports$Code==input$to,]$Description ))       
                        
                }else{
                        output$title <- renderText(paste("Statistics of flight from ",airports[airports$Code==input$from,]$Description , " -to-> ",airports[airports$Code==input$to,]$Description))       
                        
                        boxplot(ACTUAL_ELAPSED_TIME~CARRIER,data=trim, main="Flight time against each airline", 
                                ylab="Actual Elapsed Time in minutes", xlab="Airline")
                        
                }
                
        })
        
})

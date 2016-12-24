
# This is the server logic for a Shiny web application.
# You can find out more about building applications with Shiny here:
#
# http://shiny.rstudio.com
#

library(shiny)
source("src/4-prediction_function.R")
source("src/5-microsoft.R")

shinyServer(function(input, output) {

    output$predTable <- DT::renderDataTable({

        if (input$goButton == 0) {
            return()
        }

        isolate({
            query <- input$query
            corp <- input$corp
            return_n <- input$return_n
            keep_stop <- input$keep_stop
        })

        if (corp == "web") {
            web_lookup(query, return_n)
        } else {
            predict_words(query, return_n, keep_stop)
        }
    })

})

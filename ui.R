
# This is the user-interface definition of a Shiny web application.
# You can find out more about building applications with Shiny here:
#
# http://shiny.rstudio.com
#

library(shiny)

shinyUI(fluidPage(

  # Application title
  titlePanel("Text Prediction App"),

  # Sidebar with a slider input for number of bins
  sidebarLayout(
    sidebarPanel(
        textInput("query", "Enter phrase:"),
        radioButtons(
            "corp",
            "Choose prediction source:",
            c("Blogs" = "blogs",
              "News" = "news",
              "Twitter" = "tweets",
              "Microsoft" = "web")
        ),
        checkboxInput("keep_stop", "Include stop words"),
        sliderInput(
            "return_n",
            "Number of words to return:",
            min = 1,
            max = 25,
            value = 5,
            step = 1
        ),
        submitButton("Predict")
    ),

    # Show a table with text predictions
    mainPanel(
      tableOutput("predTable")
    )
  )
))

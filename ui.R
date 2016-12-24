
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
            c("HC Corpora" = "hc",
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
        actionButton("goButton", "Predict")
    ),

    # Show a table with text predictions
    mainPanel(
        tabsetPanel(
            tabPanel("Prediction",
                     DT::dataTableOutput("predTable")
            ),
            tabPanel("Help",
                     h4("How to use this app"),
                     p("Enter a phrase or sentence in text box. Use the radio
                       buttons to select the data source for the predictions.
                       You can use the HC Corpora which contains tokesn from a
                       variety of blogs, news, and Twitter data, or select
                       Microsoft to use the Microsoft Web Language Model. If you
                       would like common stop words included in the results
                       (such as: the, and, to, of, etc.), check the Include stop
                       words box (note, this does not apply to predictions use
                       the Microsoft Web Language Model). Use the slider to
                       select the number of predictions to return. Once you have
                       selected all of your desired options, click on Predict
                       button to get your predictions!")
            )
        )
    )
  )
))

#
# This is the user-interface definition of a Shiny web application. You can
# run the application by clicking 'Run App' above.
#
# Find out more about building applications with Shiny here:
#
#    http://shiny.rstudio.com/
#

library(shiny)
library(png)
library(markdown)

# Define UI for application that draws a histogram
shinyUI(fluidPage(

    # Application title
    titlePanel("Predicting the next word of a sentence"),

    # Sidebar with a slider input for number of bins
    sidebarLayout(
        sidebarPanel(
            helpText("Enter a sentenct to to predict what the next word is:"),
            hr(),
            textInput("inputText", "Sentence:", value = ""),
            h5("Instructions"),
            helpText("This webpage is used to predict the next word, using the frequency of 2/3/4 grams."),
            helpText("The frequency is calculated using english corpus provided by Swiftkey."),
            helpText("If no guessing is found, it retunrs the word 'it' ")
        ),
        # Show a plot of the generated distribution
        mainPanel(
            h1("Prediction: next word"),
            verbatimTextOutput("Hold on a second ... maybe longer ..."),
            h3(strong(code(textOutput("next_word")))),
            br(),
            h3(tags$b("Debug trace:")),
            br(),
            h4(tags$b("Prediction based on the last TWO words:")),
            textOutput("bigram"),
            br(),
            h4(tags$b("Prediction based on the last THREE words:")),
            textOutput("trigram"),
            br(),
            h4(tags$b("Prediction based on the last FIVE words:")),
            textOutput("quadgram"),
            br(),
            h4(),
            tags$b("Data Science Capstone Project"),
            br(),
            tags$b("Author: Yanyuan Zhu")
        )
    )
))

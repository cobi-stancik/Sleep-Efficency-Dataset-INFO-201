# TESTTT
# Test again


library(shiny)
library(tidyverse)

fluidPage(
    tabsetPanel(
      
      tabPanel(
        "Project Overview"
      ),
      
      tabPanel(
        "Analyze Sleep Efficiency"
      ),
      
      tabPanel(
        "Analyze different age groups based on sleep percentages",
        sidebarLayout(
          sidebarPanel(
            p("Analyze different age groups:"),
            sliderInput("range", "Age range:",
                        min = 9,
                        max = 69,
                        value = c(21, 35)),
            checkboxGroupInput("percentage", "Select attribute",
                               choices = c("REM sleep percentage", "Deep sleep percentage", "Light sleep percentage"),
                               selected = "REM sleep percentage"),
            p("The table shown on the right compares the sleep percentages of REM, Deep, and Light sleep
              for people of varying age groups\n"),
            p("There is a slight decrease in the percentage of light sleep as age increases, then the percentage begins 
            to increase once past middle age. People of ages 9-18 had an average of 38.6% light sleep, while people ages
            30-40 had an average of 19.7%, and people ages 56-65 had an average of 32.6%")
          ),
          mainPanel(
            tableOutput("table")
          )  
        )
      ),
      
      tabPanel(
        "Most Efficient Sleepers"
      ),
      
      tabPanel(
        "Coffee vs. Alcohol Sleep Efficiency",
        sidebarLayout(
          sidebarPanel(
            p("Analyze sleep efficiency based on coffee and alcohol consumption"),
            fluidRow(
              column(6,
                  checkboxGroupInput("caffeine", "Caffeine intake:",
                               choices = c(0.0, 25.0, 50.0, 75.0, 100.0, 200.0),
                               selected = 0.0)),
              column(6,
                  checkboxGroupInput("alcohol", "Alcohol intake:",
                                     choices = c(0.0, 1.0, 2.0, 3.0, 4.0, 5.0),
                                     selected = 0.0))
            )
            
          ),
          mainPanel(
            plotOutput("coffeePlot"),
            plotOutput("alcPlot")
          )
        )
      ),
      
      tabPanel(
        "Least Efficient Sleepers"
      ),
      
    )
   
)

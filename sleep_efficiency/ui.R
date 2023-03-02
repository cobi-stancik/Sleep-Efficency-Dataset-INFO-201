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
        "Analyze Different Age Groups",
        sidebarLayout(
          sidebarPanel(
            p("Analyze different age groups:"),
            checkboxGroupInput("type", "Type of Sleep",
                         choices = c("REM sleep percentage", "Deep sleep percentage", "Light sleep percentage")),
          ),
          mainPanel(
            plotOutput("barPlot")
          )  
        )
      ),
      
      tabPanel(
        "Most Efficient Sleepers"
      ),
      
      tabPanel(
        "Coffee vs. Alcohol Sleep Efficiency"
      ),
      
      tabPanel(
        "Least Efficient Sleepers"
      ),
      
    )
   
)

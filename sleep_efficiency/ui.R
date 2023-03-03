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
        "Coffee vs. Alcohol Sleep Efficiency"
      ),
      
      tabPanel(
        "Least Efficient Sleepers"
      ),
      
    )
   
)

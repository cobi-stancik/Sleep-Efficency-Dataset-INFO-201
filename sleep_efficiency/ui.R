library(shiny)
library(tidyverse)

fluidPage(
  
  tabsetPanel(
    
    tabPanel(
      "Project Overview", ## PROJECT OVERVIEW
      
      h1(strong("Project Overview"), align = "center"),
      
      tags$figure(
        
        align = "center",
        
        imageOutput("sleeping_guy"),
        
        h2(strong("Project Aim🎯")), # Project Aim
        
        tags$div(
          style = "display:block; background-color: lightblue; border:1px solid black; padding:10px;",
          "This webpage aims to study how various lifestyle choices such as coffee, alcohol, 
            smoking, and exercise affect the efficiency of sleep. We will be observing the sleep 
            efficiency of each person by age and gender."
        ),
        
        h2(strong("About the Data Set📊")), # Data Set
        
        tags$div(
          style = "display:block; background-color: lightblue; border:1px solid black; padding:10px;",
          "We chose to work with a dataset that contains information about the sleep patterns of people 
            of varying age groups. We accessed this data from kaggle.com. The data came from a sleep study 
            conducted by a research team from the University of Oxfordshire, and was meant to analyze 
            the way that sleep can be impacted by different lifestyle factors.",
          br(), 
          br(),
          "The target audience includes male and female subjects, with age ranging from 9 to 69 years 
            old. The research team recruited participants from the local community in the UK and observed 
            their sleep patterns over a span of several months.",
          br(),
          br(),
          uiOutput("tab"), # URL link to data set
        ),
        
        h2(strong("Major Questions❔")), # Major Questions
        
        tags$div(
          style = "display:block; background-color: lightblue; border:1px solid black; padding:10px;",
          "Which lifestyle factor had the most impact on sleep efficiency?"
        ),
        
        br(), # space
        
        tags$div(
          style = "display:block; background-color: lightblue; border:1px solid black; padding:10px;",
          "How do individual variables in regards to their lifestyle affect REM sleep duration?"
        ),
        
        br(), # space
        
        tags$div(
          style = "display:block; background-color: lightblue; border:1px solid black; padding:10px;",
          "How does age affect sleep efficiency? (REM sleep, Deep sleep, Light sleep percentages)"
        ),
        
        br() # space
        
      )
    ),
    
    tabPanel(
      "Analyze Sleep Efficiency", ## ANALYZE SLEEP EFFICIENCY
      sidebarLayout(
        sidebarPanel(
          p("Analyze Sleep Efficiency:"),
          sliderInput("range", "Age range:",
                      min = 9,
                      max = 69,
                      value = c(21, 35))
        ),
        mainPanel(
          plotOutput("sleep")
        )  
      )
    ),
    
    tabPanel(
      "Analyze different age groups based on sleep percentages", ## ANALYZE BY AGE
      sidebarLayout(
        sidebarPanel(
          p("Analyze different age groups:"),
          sliderInput("range2", "Age range:",
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
      "Coffee vs. Alcohol Sleep Efficiency", ## COFFEE VS ALCOHOL
      sidebarLayout(
        sidebarPanel(
          p("Analyze sleep efficiency based on coffee and alcohol consumption"),
          fluidRow(
            column(6,
                   checkboxGroupInput("caffeine", "Caffeine intake:",
                                      choices = c(0.0, 25.0, 50.0, 75.0, 100.0, 200.0),
                                      selected = 25.0)),
            column(6,
                   checkboxGroupInput("alcohol", "Alcohol intake:",
                                      choices = c(0.0, 1.0, 2.0, 3.0, 4.0, 5.0),
                                      selected = 1.0))
          )
        ),
        mainPanel(
          plotOutput("coffeePlot"),
          plotOutput("alcPlot")
        )
      )
    ),
    
    tabPanel(
      "Awakeninngs & Sleep Efficiency", ## COFFEE VS ALCOHOL
      sidebarLayout(
        sidebarPanel(
          p("Analyze sleep efficiency based on awakenings"),
          fluidRow(
            column(5,
                   checkboxGroupInput("awake", "Awakenings:",
                                      choices = c(0.0, 1.0, 2.0, 3.0, 4.0),
                                      selected = 1.0)),
            p("The table shown on the right compares the the awakenings a user had in one night in 
              relation to sleep effecincey, showing the direct correlation between the amount of time
              you wake up in your sleep to how well you sleep.\n"),

          )
        ),
        mainPanel(
          plotOutput("awakePlot")
        )
      )
    ),
  )
)
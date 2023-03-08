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
            smoking, and exercise affect the quality of sleep. We will be observing the sleep 
            efficiency as well as other factors of each person, considering age and gender."
        ),
        
        h2(strong("About the Data Set📊")), # Data Set
        
        tags$div(
          style = "display:block; background-color: lightblue; border:1px solid black; padding:10px;",
          p("We chose to work with a dataset that contains information about the sleep patterns of people 
            of varying age groups. We accessed this data from kaggle.com. The data came from a sleep study 
            conducted by a research team from the University of Oxfordshire, and was meant to analyze 
            the way that sleep can be impacted by different lifestyle factors."),
          p("The target audience includes male and female subjects, with age ranging from 9 to 69 years 
            old. The research team recruited participants from the local community in the UK and observed 
            their sleep patterns over a span of several months."),
          p(uiOutput("tab")), # URL link to data set
        ),
        
        h2(strong("Major Questions❔")), # Major Questions
        
        tags$div(
          style = "display:block; background-color: lightblue; border:1px solid black; padding:10px;",
          "Which lifestyle factor had the most impact on sleep efficiency?"
        ),
        
        br(), # space
        
        tags$div(
          style = "display:block; background-color: lightblue; border:1px solid black; padding:10px;",
          "Do the number of awakenings in a night directly correlate to how well one sleeps?"
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
          h3(strong("Analyze Sleep Efficiency")),
          sliderInput("range", "Age range:",
                      min = 9,
                      max = 69,
                      value = c(21, 35)),
          p("The plot shown on the right compares age and sleep efficiency."), 
          p("Sleep efficiency refers to the proportion of time spent in bed 
            that is actually spent asleep. This measure allows us to analyze 
            whether age has a significant impact on sleep quality. ")
        ),
        mainPanel(
          plotOutput("sleepef")
        )  
      )
    ),
    
    tabPanel(
      "Analyze Different Age Groups Based on Sleep Percentages", ## ANALYZE BY AGE
      sidebarLayout(
        sidebarPanel(
          h3(strong("Analyze Different Age Groups:")),
          sliderInput("range2", "Age range:",
                      min = 9,
                      max = 69,
                      value = c(21, 25)),
          checkboxGroupInput("percentage", "Select attribute",
                             choices = c("REM sleep percentage", "Deep sleep percentage", "Light sleep percentage"),
                             selected = c("REM sleep percentage", "Deep sleep percentage", "Light sleep percentage")),
          p("The table shown on the right compares the sleep percentages of REM, Deep, and Light sleep
              for people of varying age groups\n"),
          textOutput("avgREM"),
          textOutput("avgDeep"),
          textOutput("avgLight")
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
          h3(strong("Analyze Sleep Efficiency Based on Coffee and Alcohol Consumption")),
          fluidRow(
            column(6,
                   checkboxGroupInput("caffeine", "Caffeine intake:",
                                      choices = c(0.0, 25.0, 50.0, 75.0, 100.0, 200.0),
                                      selected = c(0.0, 25.0, 50.0, 75.0, 100.0, 200.0))),
            column(6,
                   checkboxGroupInput("alcohol", "Alcohol intake:",
                                      choices = c(0.0, 1.0, 2.0, 3.0, 4.0, 5.0),
                                      selected = c(0.0, 1.0, 2.0, 3.0, 4.0, 5.0)))
          ),
          p("We see a moderately positive correlation between caffeine and sleep efficiency, and no correlation
          between alcohol and sleep efficiency")
        ),
        mainPanel(
          plotOutput("coffeePlot"),
          plotOutput("alcPlot")
        )
      )
    ),
    
    tabPanel(
      "Awakenings & Sleep Efficiency", ## AWAKENINGS & SLEEP EFFICIENCY
      sidebarLayout(
        sidebarPanel(
          h3(strong("Analyze Sleep Efficiency Based on Awakenings")),
          fluidRow(
            column(5,
                   checkboxGroupInput("awake", "Awakenings:",
                                      choices = c(0.0, 1.0, 2.0, 3.0, 4.0),
                                      selected = 1.0)),
            p("The table shown on the right compares the awakenings a subject had in one night in 
              relation to sleep efficiency, showing the direct correlation between the amount of time
              you wake up in your sleep to how well you sleep.\n"),
            
          )
        ),
        mainPanel(
          plotOutput("awakePlot")
        )
      )
    ),
    
    tabPanel(
      "Conclusion", ## CONCLUSION PAGE
      h1("Takeaways"),
      
      # AGE VS SLEEP PERCENTAGE 
      p("As we compare the averages between the age groups (9-21, 22-45, and 46-69), we can see that the percentage of REM sleep
        remains relatively unchanged. The percentage of deep sleep increases by 10% between youth (9-21) and adult (22-45), 
        then stays the same as age increases. The percentage of light sleep decreases by 12% between youth and adult ages, then
        also stays the same as age increases further."),
      p("From this, we've concluded that", strong("people have the most deep sleep as adults (ages 21-45), the most light sleep
        in their youth (ages 9-20), and the same amount of REM sleep throughout their lives.")),
      
      ## CAFFEINE/ALCOHOL VS SLEEP EFFICIENCY
      p("Sleep efficiency refers to the proportion of time in bed spent asleep. In the caffeine plot, we see a moderately positive 
            correlation between caffeine and sleep efficiency.", strong("The more coffee a person drinks, the more time they spend 
            sleeping."), "This leads us to believe one of two possible reasons:"),
      p("1. Overconsumption of caffeine causes a crash towards the end of the day, resulting in an overall increased
            time spent asleep"),
      p("2. Caffeine causes people to be more energized, resulting in less time spent in bed"),
      p("In the alcohol plot,", strong("we see no correlation between alcohol and sleep efficiency."), "This may be attributed to the fact that 
            alcohol is a depressant which causes drowsiness and relaxation. This may cause a person to have an easier time falling asleep
            after they have been drinking. On the other hand, people often drink alcohol late at night, which may result in less time spent 
            asleep"),
      p("For both these substances, it is likely that sleep quality has been imparied. Although sleep efficiency may seem to have improved as a result
            of drinking caffeine/alcohol, this does not mean that these substances are beneficial in helping a person sleep better."),
      # Did you find your dataset of reasonable quality? 
      # Do you think it gives unbiased results? 
      # Do you see issues with potentially harming certain population groups?
      h1("Data Quality"),
      p("This data set has very poor quality. The source of the data supposedly comes from
        the University of Oxfordshire, which when Googled, does not show up as a legitimate
        university. We unfortunately did not catch this until recently, and decided to keep 
        using this data set. "),
      p("That said, this data set was supposedly collected using a combination of self-reported surveys, 
        actigraphy, and polysomnography which is a sleep monitoring technique. Self-reported 
        data suggests a less thorough and incomprehensive data collection method. "),
      p("As for whether the data set provides unbiased results, the study's inclusion 
        criteria and recruitment methods may have introduced selection bias, as participants 
        were recruited from the local community and may not be representative of the larger 
        population. Additionally, self-reported surveys may be subject to response bias, 
        as participants may not accurately report their behaviors. "),
      p("Regarding potential harm to certain population groups, the use of polysomnography
        and significant changes to sleep patterns may pose risks to certain groups such 
        as pregnant women or individuals with sleep disorders. Overall, it is important for researchers 
        to consider and address potential sources of bias and harm in their studies to ensure
        that the results are both valid and ethical."),
      
      h1("Future Ideas"),
      p("1.", strong("Longitudinal Studies:"), "The current dataset provides a snapshot of sleep patterns and 
        lifestyle factors at a single point in time. However, longitudinal studies that track changes
        in sleep patterns and behaviors over time could provide more insight into how lifestyle factors
        affect sleep quality and duration."),
      p("2.", strong("Interventions:"), "The dataset could be used to design and test interventions aimed at improving 
        sleep quality and duration. For example, interventions could be designed to reduce caffeine or 
        alcohol consumption or increase exercise frequency, and the impact on sleep patterns could be 
        measured using the dataset."),
      p("3.", strong("Analysis of Subgroups:"), "The dataset could be used to investigate differences in sleep patterns 
        and lifestyle factors among different subgroups, such as age, gender, or race/ethnicity. This 
        could help identify potential health disparities related to sleep and inform targeted interventions."),
      p("4.", strong("Machine Learning Analysis:"), "Machine learning algorithms could be applied to the dataset to identify 
        patterns or predictors of poor sleep quality or duration. This could potentially identify novel risk 
        factors or inform personalized interventions for individuals with sleep problems.")
    )
  )
)

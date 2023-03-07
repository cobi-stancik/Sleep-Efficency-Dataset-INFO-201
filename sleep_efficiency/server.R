
sleep <- read_delim("../data/Sleep_Efficiency.csv")

library(shiny)
library(tidyverse)

function(input, output, session) {
  # Analyze different age groups based on sleep percentages
  sample <- reactive({
    sleep[input$range2[1]:input$range2[2], ] %>% 
      select(Age, input$percentage) %>% 
      arrange(Age)
  })
  
  output$table <- renderTable({
    sample()
  })
  
  # Coffee vs. Alcohol Sleep Efficiency
  coffeeSample <- reactive({
    sleep %>% 
      filter(`Caffeine consumption` %in% input$caffeine)
  })
  
  alcoholSample <- reactive({
    sleep %>% 
      filter(`Alcohol consumption` %in% input$alcohol)
  })
  
  output$coffeePlot <- renderPlot({
    coffeeSample() %>% 
      ggplot(aes(`Sleep efficiency`, `Caffeine consumption`, fill = `Sleep efficiency`)) +
      geom_col() +
      ggtitle("Caffeine vs. Sleep efficiency") +
      scale_fill_gradient(low = "pink", high = "orange") 
  })
  
  output$alcPlot <- renderPlot({
    alcoholSample() %>% 
      ggplot(aes(`Sleep efficiency`, `Alcohol consumption`, fill = `Sleep efficiency`)) +
      geom_col() +
      ggtitle("Alcohol vs. Sleep efficiency") +
      scale_fill_gradient(low = "purple", high = "blue")
  })
  
  # Awakenings Sleep Efficiency
  awakeSample <- reactive({
    sleep %>% 
      filter(`Awakenings` %in% input$awake)
  })
  
  output$awakePlot <- renderPlot({
    awakeSample() %>% 
      ggplot(aes(`Sleep efficiency`, `Awakenings`, fill = `Awakenings`)) +
      geom_col() +
      ggtitle("Awakenigs vs. Sleep efficiency") +
      scale_fill_gradient(low="blue", high="red")
  })
  
  # Analyze Sleep Efficiency
  output$sleepef <- renderPlot({
    dataforsleep <- sleep %>%
      filter(Age > input$range[1], Age < input$range[2])
    
    ggplot(
      data = dataforsleep, 
      aes(x = Age, y = `Sleep efficiency`)) +
      geom_point(color = "black", size = 3) + 
      labs(x = "Age", y = "Sleep Efficiency") 
  })
  
  output$sleepeftext <- renderText({
    paste("You have chosen a range that goes from",
          input$range[1], "to", input$range[2], ".")
  })
  
  # Overview image
  output$sleeping_guy <- renderImage({
    list(src = "../data/sleeping_guy.jpg",
         width = "700", 
         height = "100%",
         style = "border:5px solid black;")
  }, deleteFile = F)
  
  # URL link to data set
  url <- a("Sleep Efficiency Data Set", href="https://www.kaggle.com/datasets/equilibriumm/sleep-efficiency")
  output$tab <- renderUI({
    tagList("Link to Data Set: ", url)
  })
  
}


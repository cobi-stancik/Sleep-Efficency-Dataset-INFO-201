
sleep <- read_delim("../data/Sleep_Efficiency.csv")

library(shiny)
library(tidyverse)

function(input, output, session) {
  
  sample <- reactive({
    sleep[input$range2[1]:input$range2[2], ] %>% 
      select(Age, input$percentage) %>% 
      arrange(Age)
  })
  
  output$table <- renderTable({
    sample()
  })
  
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
      ggtitle("Caffeine vs. Sleep efficiency")
  })
  
  output$alcPlot <- renderPlot({
    alcoholSample() %>% 
      ggplot(aes(`Sleep efficiency`, `Alcohol consumption`, fill = `Sleep efficiency`)) +
      geom_col() +
      ggtitle("Alcohol vs. Sleep efficiency")
  })
  
  sleep_ef <- reactive({
    sleep[input$range[1]:input$range[2], ] %>% 
      select(Age, `Sleep efficiency`) %>% 
      arrange(Age)
  })
  
  output$sleep <- renderPlot({
    ggplot(data = sleep_ef(), aes(x = Age, y = `Sleep efficiency`)) +
      geom_point(color = "black", size = 3) + 
      labs(x = "Age", y = "Sleep Efficiency")
  })
}
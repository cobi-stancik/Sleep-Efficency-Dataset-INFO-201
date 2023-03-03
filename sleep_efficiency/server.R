sleep <- read_delim("../data/Sleep_Efficiency.csv")

library(shiny)
library(tidyverse)

function(input, output, session) {
  
  sample <- reactive({
    sleep[input$range[1]:input$range[2], ] %>% 
      select(Age, input$percentage) %>% 
      arrange(Age)
  })
  
  output$table <- renderTable({
    sample()
  })
  
  sleep_ef <- reactive({
    sleep[input$range[1]:input$range[2], ] %>% 
      select(Age, `Sleep efficiency`) %>% 
      arrange(Age)
  })
  
  output$sleep <- renderPlot({
    ggplot(data = sleep_ef(), aes(x = Age, y = `Sleep efficiency`)) +
      geom_point(color = "black", size = 3) + 
      labs(x = "Age", y = "Sleep Efficiency") +
      xlim(input$range[1], input$range[2])
  })
  
}

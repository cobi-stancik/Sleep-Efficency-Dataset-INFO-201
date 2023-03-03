
sleep <- read_delim("../data/Sleep_Efficiency.csv")

library(shiny)
library(tidyverse)

function(input, output, session) {
  
  ageSample <- reactive({
    sleep[input$range[1]:input$range[2], ] %>% 
      select(Age, input$percentage) %>% 
      arrange(Age)
  })

  output$table <- renderTable({
    ageSample()
  })
  
  output$coffeePlot <- renderPlot({
    sleep %>% 
      ggplot(aes(`Sleep efficiency`, `Caffeine consumption`, fill = `Sleep efficiency`)) +
      geom_col() 
      #scale_color_brewer(palette = "Set1")
  })
  
  output$alcPlot <- renderPlot({
    sleep %>% 
      ggplot(aes(`Sleep efficiency`, `Alcohol consumption`, fill = `Sleep efficiency`)) +
      geom_col()
  })

}


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
    

}

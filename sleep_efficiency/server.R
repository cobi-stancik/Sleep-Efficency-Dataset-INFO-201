
sleep <- read_delim("../data/Sleep_Efficiency.csv")

library(shiny)
library(tidyverse)

function(input, output, session) {
  
  sample <- reactive({
    sleep[input$range[1]:input$range[2], ] %>% 
      select(Age, "REM sleep percentage", "Deep sleep percentage", "Light sleep percentage") %>% 
      arrange(Age)
  })

  output$table <- renderTable({
      sample()

  })
    

}

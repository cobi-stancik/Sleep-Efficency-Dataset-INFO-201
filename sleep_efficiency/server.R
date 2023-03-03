<<<<<<< HEAD
=======

>>>>>>> 02aab2eed0adf268fc420add5acdbd350daf055e
sleep <- read_delim("../data/Sleep_Efficiency.csv")

library(shiny)
library(tidyverse)

function(input, output, session) {
  
<<<<<<< HEAD
  sample <- reactive({
=======
  ageSample <- reactive({
>>>>>>> 02aab2eed0adf268fc420add5acdbd350daf055e
    sleep[input$range[1]:input$range[2], ] %>% 
      select(Age, input$percentage) %>% 
      arrange(Age)
  })
<<<<<<< HEAD
  
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
      labs(x = "Age", y = "Sleep Efficiency")
  })
  
=======

  output$table <- renderTable({
      ageSample()

  })
    

>>>>>>> 02aab2eed0adf268fc420add5acdbd350daf055e
}

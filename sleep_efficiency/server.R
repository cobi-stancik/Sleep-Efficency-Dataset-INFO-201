
sleep <- read_delim("../data/Sleep_Efficiency.csv")

library(shiny)
library(tidyverse)

function(input, output, session) {

    output$barPlot <- renderPlot({
      sleep %>% 
        #figure out how to plot sleep percentages in bar
        #connect to sidebar checkbox
        ggplot(aes(x = Age)) +
        geom_bar()
    })
    

}

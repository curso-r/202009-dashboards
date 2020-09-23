library(shiny)
library(ggplot2)
library(dplyr)

opcoes <- diamonds %>%
  select(where(is.numeric)) %>%
  names()

ui <- fluidPage(
  selectInput(
    inputId = "variavel",
    label = "Selecione uma variável",
    choices = opcoes
  ),
  plotOutput(outputId = "histograma")
)

server <- function(input, output, session) {

  output$histograma <- renderPlot({
    hist(diamonds[, input$variavel])
  })
}

shinyApp(ui, server)

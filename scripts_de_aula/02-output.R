library(shiny)

ui <- fluidPage(
  "Um histograma",
  plotOutput(outputId = "histograma"),
  plotOutput(outputId = "histograma2")
)

server <- function(input, output, session) {

  # output$histograma <- renderPlot({
  #   base <- mtcars
  #
  #   vetor <- base$mpg
  #
  #   hist(vetor)
  # })

  # output$histograma <- renderPlot(hist(mtcars$mpg))

  output$histograma <- renderPlot({
    hist(mtcars$mpg)
  })

  output$histograma2 <- renderPlot({
    hist(mtcars$wt)
  })

}

shinyApp(ui, server)

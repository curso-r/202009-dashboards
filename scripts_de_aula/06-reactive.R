library(shiny)

ui <- fluidPage(
  "Histograma da distribuição normal",
  sliderInput(
    inputId = "num",
    label = "Selecione o tamanho da amostra",
    min = 1,
    max = 1000,
    value = 100
  ),
  textInput(
    inputId = "titulo",
    label = "Título do gráfico"
  ),
  plotOutput(outputId = "hist"),
  "Tabela com sumário",
  tableOutput(outputId = "sumario")
)

server <- function(input, output, session) {

  amostra <- reactive({
    rnorm(input$num)
  })

  output$hist <- renderPlot({
    hist(amostra(), main = input$titulo)
  })

  output$sumario <- renderTable({

    am <- amostra()

    data.frame(
      media = mean(am),
      dp = sd(am),
      min = min(am),
      max = max(am)
    )

  })

}

shinyApp(ui, server)

library(shiny)

ui <- fluidPage(
  titlePanel("Shiny com sidebarLayout"),
  sidebarLayout(
    sidebarPanel = sidebarPanel(
      fluidRow(
        column(
          width = 6,
          sliderInput(
            inputId = "num",
            label = "Número de observações:",
            min = 0,
            max = 1000,
            value = 500
          )
        ),
        column(
          width = 6,
          sliderInput(
            inputId = "num",
            label = "Número de observações:",
            min = 0,
            max = 1000,
            value = 500
          )
        )
      )
    ),
    mainPanel = mainPanel(
      fluidRow(
        column(
          width = 6,
          plotOutput(outputId = "hist"),
        ),
        column(
          width = 6,
          plotOutput(outputId = "hist2")
        )
      )
    )
  )
)

server <- function(input, output, session) {

  output$hist <- renderPlot({
    amostra <- rnorm(input$num)
    hist(amostra)
  })

  output$hist2 <- renderPlot({
    amostra <- rnorm(input$num)
    hist(amostra)
  })

}

shinyApp(ui, server)

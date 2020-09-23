library(shiny)
library(ggplot2)

ui <- navbarPage(
  title = "Shiny com navbarPage",
  tabPanel(
    title = "Análise descriva",
    selectInput(
      inputId = "var1",
      label = "Selecione uma variável",
      choices = names(mtcars)
    ),
    shiny::conditionalPanel(
      condition = "input.var1 == 'mpg'",
      selectInput(
        inputId = "var2",
        label = "Selecione uma variável",
        choices = names(mtcars[, -1])
      )
    ),
    shiny::conditionalPanel(
      condition = "input.var1 != 'mpg'",
      selectInput(
        inputId = "var2",
        label = "Selecione uma variável",
        choices = names(mtcars)
      )
    ),
    plotOutput(outputId = "grafico_disp")
  ),
  navbarMenu(
    title = "Resultados do modelo",
    tabPanel(
      title = "Resultados do modelo de regressão linear",
      h1("Resultados do modelo de regressão linear"),
      selectInput(
        inputId = "var3",
        label = "Selecione uma variável",
        choices = names(mtcars)
      ),
      selectInput(
        inputId = "var4",
        label = "Selecione uma variável",
        choices = names(mtcars)
      ),
      plotOutput(outputId = "grafico_disp2")
    ),
    tabPanel(
      title = "Resultados das árvores",
      h2("Resultados das árvores")
    ),
    tabPanel(
      title = "Resultados floresta aleatória",
      h2("Resultados floresta aleatória")
    )
  )
)

server <- function(input, output, session) {

  output$grafico_disp <- renderPlot({
    mtcars %>%
      ggplot(aes(x = .data[[input$var1]], y = .data[[input$var2]])) +
      geom_point()
  })

  output$grafico_disp2 <- renderPlot({
    mtcars %>%
      ggplot(aes(x = .data[[input$var3]], y = .data[[input$var4]])) +
      geom_point()
  })

}

shinyApp(ui, server)



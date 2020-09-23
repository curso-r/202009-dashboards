library(shiny)
library(dplyr)

imdb <- readr::read_rds("../dados/imdb.rds")

ui <- fluidPage(
  sliderInput(
    inputId = "anos",
    label = "Selecione o intervalo de anos",
    min = 1916,
    max = 2016,
    step = 1,
    value = c(2000, 2010),
    sep = ""
  ),
  tableOutput(outputId = "table")
)

server <- function(input, output, session) {

  output$table <- renderTable({
    imdb %>%
      filter(ano %in% input$anos[1]:input$anos[2]) %>%
      select(titulo, ano, diretor, receita, orcamento) %>%
      mutate(lucro = receita - orcamento) %>%
      top_n(20, lucro) %>%
      arrange(desc(lucro)) %>%
      mutate(across(
        c(lucro, receita, orcamento),
        scales::dollar
      ))
  })

}

shinyApp(ui, server)

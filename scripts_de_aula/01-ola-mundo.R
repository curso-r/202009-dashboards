library(shiny)

ui <- fluidPage(
  "Olá, mundo!"
)

server <- function(input, output, session) {
browser()
}

shinyApp(ui, server)

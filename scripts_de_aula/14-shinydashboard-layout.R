library(shiny)
library(shinydashboard)

ui <- dashboardPage(
  dashboardHeader(title = "Dashboard"),
  dashboardSidebar(

  ),
  dashboardBody(

  )
)

server <- function(input, output, session) {

}

shinyApp(ui, server)

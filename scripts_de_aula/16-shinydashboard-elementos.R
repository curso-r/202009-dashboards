library(shiny)
library(shinydashboard)

ui <- dashboardPage(
  dashboardHeader(title = 'IMDB'),
  dashboardSidebar(
    sidebarMenu(
      menuItem("Informações gerais", tabName = "info"),
      menuItem("Orçamentos", tabName = "orcamentos"),
      menuItem("Receitas", tabName = "receitas")
    )
  ),
  dashboardBody(
    tabItems(
      tabItem(
        tabName = "info",
        fluidRow(
          column(
            width = 12,
            h1("Informações gerais dos filmes")
          )
        ),
        fluidRow(
          infoBoxOutput(
            outputId = "num_filmes",
            width = 4
          ),
          infoBoxOutput(
            outputId = "num_diretores",
            width = 4
          ),
          infoBoxOutput(
            outputId = "num_atores",
            width = 4
          )
        )
      ),
      tabItem(
        tabName = "orcamentos",
        fluidRow(
          column(
            width = 12,
            h1("Analisando os orçamentos")
          )
        ),
        fluidRow(
          box(
            width = 12,
            title = "Selecione",
            status = "danger",
            solidHeader = TRUE,
            selectInput(
              inputId = "genero_orcamento",
              label = "Selecione um gênero",
              choices = c("Action", "Comedy", "Romance"),
              width = "25%"
            )
          )
        ),
        fluidRow(
          box(
            width = 6,
            title = "Série do orçamento",
            status = "primary",
            solidHeader = TRUE,
            plotOutput("serie_orcamento")
          )
        )
      ),
      tabItem(
        "receitas",
        h1("Analisando as receitas")
      )
    )
  )
)

server <- function(input, output, session) {

  imdb <- readr::read_rds("../dados/imdb.rds")

  output$num_filmes <- renderInfoBox({
    infoBox(
      title = "Número de filmes",
      value = nrow(imdb),
      subtitle = "",
      icon = icon("film"),
      color = "lime",
      href = "https://www.curso-r.com",
      fill = TRUE
    )
  })

  output$num_diretores <- renderInfoBox({
    infoBox(
      title = "Número de diretores",
      value = n_distinct(imdb$diretor),
      subtitle = "",
      icon = icon("hand-point-right"),
      color = "red",
      fill = TRUE
    )
  })

  output$num_atores <- renderInfoBox({

    num_atores <- imdb %>%
      select(starts_with("ator")) %>%
      pivot_longer(cols = ator_1:ator_3) %>%
      distinct(value) %>%
      nrow()

    infoBox(
      title = "Número de atrizes/atores",
      value = num_atores,
      subtitle = "",
      icon = icon("user-friends"),
      color = "aqua",
      fill = TRUE
    )
  })

  output$serie_orcamento <- renderPlot({
    imdb %>%
      filter(stringr::str_detect(generos, input$genero_orcamento)) %>%
      group_by(ano) %>%
      summarise(
        orcamento_medio = mean(orcamento, na.rm = TRUE)
      ) %>%
      ggplot(aes(x = ano, y = orcamento_medio)) +
      geom_line()
  })

}

shinyApp(ui, server)

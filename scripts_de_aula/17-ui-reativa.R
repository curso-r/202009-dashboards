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
            uiOutput(outputId = "ui_genero")
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
        fluidRow(
          column(
            width = 12,
            h1("Analisando as receitas")
          )
        ),
        fluidRow(
          box(
            width = 12,
            column(
              width = 6,
              selectInput(
                inputId = "diretor",
                label = "Escolha um diretor",
                choices = "",
                width = "100%"
              )
            ),
            column(
              width = 6,
              selectInput(
                inputId = "filme",
                label = "Escolha um filme",
                choices = "",
                width = "100%"
              )
            )
          )
        ),
        fluidRow(
          valueBoxOutput(
            outputId = "filme_orcamento",
            width = 6
          ),
          valueBoxOutput(
            outputId = "filme_receita",
            width = 6
          )
        )
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

  output$ui_genero <- renderUI({

    generos <- imdb %>%
      pull(generos) %>%
      paste(collapse = "|") %>%
      stringr::str_split("\\|", simplify = TRUE) %>%
      as.character() %>%
      unique() %>%
      sort()

    selectInput(
      inputId = "genero_orcamento",
      label = "Selecione um gênero",
      choices = c("", generos),
      selected = "",
      width = "25%"
    )
  })


  output$serie_orcamento <- renderPlot({

    # req(input$genero_orcamento)

    validate(
      need(isTruthy(input$genero_orcamento), message = "Escolha um gênero.")
    )

    imdb %>%
      filter(stringr::str_detect(generos, input$genero_orcamento)) %>%
      group_by(ano) %>%
      summarise(
        orcamento_medio = mean(orcamento, na.rm = TRUE)
      ) %>%
      ggplot(aes(x = ano, y = orcamento_medio)) +
      geom_line()
  })

  diretores <- imdb %>%
    pull(diretor) %>%
    unique() %>%
    sort()

  updateSelectInput(
    session = session,
    inputId = "diretor",
    choices = diretores,
    selected = "Quentin Tarantino"
  )

  observe({

    filmes <- imdb %>%
      filter(diretor == input$diretor) %>%
      pull(titulo) %>%
      sort()

    updateSelectInput(
      session = session,
      inputId = "filme",
      choices = filmes
    )

  })

  output$filme_orcamento <- renderValueBox({

    orcamento <- imdb %>%
      filter(titulo == input$filme) %>%
      pull(orcamento) %>%
      scales::dollar()

    valueBox(
      value = orcamento,
      subtitle = "Orçamento",
      icon = icon("dollar-sign"),
      color = "fuchsia"
    )
  })

  output$filme_receita <- renderValueBox({

    receita <- imdb %>%
      filter(titulo == input$filme) %>%
      pull(receita) %>%
      scales::dollar()

    valueBox(
      value = receita,
      subtitle = "Receita",
      icon = icon("hand-holding-usd"),
      color = "purple"
    )
  })

}

shinyApp(ui, server)

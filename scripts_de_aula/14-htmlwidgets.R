library(tidyverse)
library(shiny)
library(shinydashboard)
library(leaflet)

# da_covid <- readxl::read_excel("~/Downloads/HIST_PAINEL_COVIDBR_28set2020.xlsx",
#                                col_types = "text")
# da_covid %>% write_rds("scripts_de_aula/da_covid.rds")

da_covid <- read_rds("da_covid.rds")

base_plotly <- da_covid %>%
  mutate(data = as.Date(as.numeric(data), origin = "1900-01-01")) %>%
  filter(regiao == "Brasil") %>%
  transmute(
    data,
    casos = as.numeric(casosAcumulado),
    obitos = as.numeric(obitosAcumulado)
  )

base_tabela <- da_covid %>%
  filter(
    data == max(data),
    regiao != "Brasil",
    is.na(municipio),
    is.na(codmun)
  ) %>%
  transmute(
    regiao,
    estado,
    casos = as.numeric(casosAcumulado),
    obitos = as.numeric(obitosAcumulado)
  )

# shape_estados <- geobr::read_state()
# write_rds(shape_estados, "scripts_de_aula/shape_estados.rds")
shape_estados <- read_rds("shape_estados.rds")

aux_latlon <- abjData::cadmun %>%
  transmute(
    codmun = as.character(MUNCOD),
    lat, lon
  )

base_mapa_municipio <- da_covid %>%
  filter(
    data == max(data),
    regiao != "Brasil",
    !is.na(municipio),
    !is.na(codmun)
  ) %>%
  transmute(
    municipio,
    codmun,
    casos = as.numeric(casosAcumulado),
    obitos = as.numeric(obitosAcumulado)
  ) %>%
  inner_join(aux_latlon, "codmun") %>%
  filter(lon < 0, lat > -40)


ui <- dashboardPage(
  dashboardHeader(title = "Covid"),
  dashboardSidebar(
    sidebarMenu(
      menuItem("Análises", tabName = "analises")
    )
  ),
  dashboardBody(
    tabItems(
      tabItem(
        "analises",
        fluidRow(
          box(
            plotly::plotlyOutput("acumulado")
          ),
          box(
            reactable::reactableOutput("contagens")
          )
        ),
        fluidRow(
          box(
            leaflet::leafletOutput("shapes")
          ),
          box(
            leaflet::leafletOutput("pontos")
          )
        )
      )
    )
  )
)

server <- function(input, output, session) {

  output$acumulado <- plotly::renderPlotly({

    p <- base_plotly %>%
      ggplot(aes(x = data, y = obitos)) +
      geom_line()

    plotly::ggplotly(p)

  })

  output$contagens <- reactable::renderReactable({
    base_tabela %>%
      reactable::reactable(
        groupBy = "regiao",
        columns = list(
          regiao = reactable::colDef(name = "Região"),
          estado = reactable::colDef(name = "Estado"),
          casos = reactable::colDef(name = "Casos", aggregate = "sum"),
          obitos = reactable::colDef(name = "Óbitos", aggregate = "sum")
        )
      )

  })

  output$shapes <- leaflet::renderLeaflet({


    color_fun <- leaflet::colorNumeric(
      viridis::viridis(nrow(base_tabela)),
      domain = range(base_tabela$obitos)
    )

    shape_estados %>%
      inner_join(base_tabela, c("abbrev_state" = "estado")) %>%
      leaflet() %>%
      addTiles() %>%
      addPolygons(
        weight = .5,
        color = "black",
        opacity = .9,
        fillOpacity = .6,
        fillColor = ~color_fun(obitos)
      )

  })

  output$pontos <- leaflet::renderLeaflet({

    base_mapa_municipio %>%
      leaflet() %>%
      addTiles() %>%
      addMarkers(
        clusterOptions = markerClusterOptions()
      )
  })

}

shinyApp(ui, server)


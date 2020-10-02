
<!-- README.md is generated from README.Rmd. Please edit that file -->

## Configuração inicial

#### Passo 1: Instalar pacotes

``` r
install.packages("remotes")

# instalar pacote da Curso-R
remotes::install_github("curso-r/CursoR")

# instalar pacotes que vamos usar durante o curso
CursoR::instalar_dependencias()
```

#### Passo 2: Criar um projeto do RStudio

Faça um projeto do RStudio para usar durante todo o curso e em seguida
abra-o.

``` r
install.packages("usethis")
usethis::create_project("caminho_ate_o_projeto/nome_do_projeto")
```

#### Passo 3: Baixar o material

Certifique que você está dentro do projeto criado no passo 2 e rode o
código abaixo.

**Observação**: Assim que rodar o código abaixo, o programa vai pedir
uma escolha de opções. Escolha o número correspondente ao curso de
Dashboards\!

``` r
# Baixar ou atualizar material do curso
CursoR::atualizar_material()
```

## Slides

| slide                                | link                                                                           |
| :----------------------------------- | :----------------------------------------------------------------------------- |
| slides/01-introducao\_ao\_curso.html | <https://curso-r.github.io/main-dashboards/slides/01-introducao_ao_curso.html> |
| slides/02-shiny-introducao.html      | <https://curso-r.github.io/main-dashboards/slides/02-shiny-introducao.html>    |
| slides/03-reatividade-parte-1.html   | <https://curso-r.github.io/main-dashboards/slides/03-reatividade-parte-1.html> |
| slides/04-layouts.html               | <https://curso-r.github.io/main-dashboards/slides/04-layouts.html>             |
| slides/05-shinydashboards.html       | <https://curso-r.github.io/main-dashboards/slides/05-shinydashboards.html>     |
| slides/06-reatividade-parte-2.html   | <https://curso-r.github.io/main-dashboards/slides/06-reatividade-parte-2.html> |
| slides/07-htmlwidgets.html           | <https://curso-r.github.io/main-dashboards/slides/07-htmlwidgets.html>         |
| slides/08-flexdashboard.html         | <https://curso-r.github.io/main-dashboards/slides/08-flexdashboard.html>       |

## Scripts usados em aula

| script                              | link                                                                                              |
| :---------------------------------- | :------------------------------------------------------------------------------------------------ |
| 01-ola-mundo.R                      | <https://curso-r.github.io/202009-dashboards/scripts_de_aula/01-ola-mundo.R>                      |
| 02-output.R                         | <https://curso-r.github.io/202009-dashboards/scripts_de_aula/02-output.R>                         |
| 03-output-input.R                   | <https://curso-r.github.io/202009-dashboards/scripts_de_aula/03-output-input.R>                   |
| 04-hist-normal.R                    | <https://curso-r.github.io/202009-dashboards/scripts_de_aula/04-hist-normal.R>                    |
| 05-dois-outputs.R                   | <https://curso-r.github.io/202009-dashboards/scripts_de_aula/05-dois-outputs.R>                   |
| 06-reactive.R                       | <https://curso-r.github.io/202009-dashboards/scripts_de_aula/06-reactive.R>                       |
| 07-eventReactive.R                  | <https://curso-r.github.io/202009-dashboards/scripts_de_aula/07-eventReactive.R>                  |
| 08-debug.R                          | <https://curso-r.github.io/202009-dashboards/scripts_de_aula/08-debug.R>                          |
| 09-dados.R                          | <https://curso-r.github.io/202009-dashboards/scripts_de_aula/09-dados.R>                          |
| 11-gridsystem.R                     | <https://curso-r.github.io/202009-dashboards/scripts_de_aula/11-gridsystem.R>                     |
| 12-sidebarLayout.R                  | <https://curso-r.github.io/202009-dashboards/scripts_de_aula/12-sidebarLayout.R>                  |
| 13-navbarPage.R                     | <https://curso-r.github.io/202009-dashboards/scripts_de_aula/13-navbarPage.R>                     |
| 14-shinydashboard-layout.R          | <https://curso-r.github.io/202009-dashboards/scripts_de_aula/14-shinydashboard-layout.R>          |
| 15-shinydashboard-menu.R            | <https://curso-r.github.io/202009-dashboards/scripts_de_aula/15-shinydashboard-menu.R>            |
| 16-shinydashboard-elementos.R       | <https://curso-r.github.io/202009-dashboards/scripts_de_aula/16-shinydashboard-elementos.R>       |
| 17-ui-reativa.R                     | <https://curso-r.github.io/202009-dashboards/scripts_de_aula/17-ui-reativa.R>                     |
| 18-htmlwidgets-auth0.R              | <https://curso-r.github.io/202009-dashboards/scripts_de_aula/18-htmlwidgets-auth0.R>              |
| 19-nosso-primeiro-flexdashboard.Rmd | <https://curso-r.github.io/202009-dashboards/scripts_de_aula/19-nosso-primeiro-flexdashboard.Rmd> |
| 20-orientacao-e-tabset.Rmd          | <https://curso-r.github.io/202009-dashboards/scripts_de_aula/20-orientacao-e-tabset.Rmd>          |
| 21-paginas-componentes-temas.Rmd    | <https://curso-r.github.io/202009-dashboards/scripts_de_aula/21-paginas-componentes-temas.Rmd>    |
| 22-storyboard-htmlwidgets.Rmd       | <https://curso-r.github.io/202009-dashboards/scripts_de_aula/22-storyboard-htmlwidgets.Rmd>       |
| 23-flexdashboard-com-shiny.Rmd      | <https://curso-r.github.io/202009-dashboards/scripts_de_aula/23-flexdashboard-com-shiny.Rmd>      |
| extra-exercicio1.R                  | <https://curso-r.github.io/202009-dashboards/scripts_de_aula/extra-exercicio1.R>                  |


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

| script | link |
| :----- | :--- |

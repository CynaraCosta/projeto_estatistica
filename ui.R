header <- dashboardHeader(title = 'Projeto de Estatistica')

sidebar <- dashboardSidebar(
  sidebarMenu(
    menuItem("Metricas", tabName = "m", icon = icon("chart-line")),
    menuItem("Comparando propriedades", tabName = "comp", icon = icon("chart-bar"))
  )
)

body <- dashboardBody(
  tabItems(
    tabItem(tabName = "m",
            fluidRow(
              box(title = 'Selecione suas propriedades', width = 12, solidHeader = TRUE, status = 'warning',
                  selectInput('properties', 'Propriedade', properties_list, multiple = FALSE),
                  dateRangeInput('date', strong('Intervalo de tempo desejado'), min = '2016-07-25', max = '2021-07-26', start = '2018-07-04', end = '2020-10-12', separator = "ate", language = 'pt', format = 'MM-yyyy'),
                  uiOutput("timedate"),
                  actionButton('go', 'Submeter')
              )
            ),
            fluidRow(
              box(title = "Informacoes sobre a propriedade", width = 12, solidHeader = TRUE,
                  DTOutput('info')
              )
            ),
            fluidRow(
              box(title = "Serie de precos", width = 12, solidHeader = TRUE,
                  plotOutput('sh')
              )
            ),
    ),
    tabItem(tabName = 'comp',
            fluidRow(
              box(title = 'Selecione suas propriedades', width = 12, solidHeader = TRUE, status = 'warning',
                  selectInput('properties_comp', 'Propriedades', properties_list, multiple = TRUE),
                  uiOutput("timedate_comp"),
                  actionButton('go_comp', 'Submeter')
              )
            ),
    )
  )
)

ui <- dashboardPage(
  skin = 'blue',
  header, sidebar, body
)

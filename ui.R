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
              box(title = 'Selecione as acoes', width = 12, solidHeader = TRUE, status = 'warning',
                  selectInput('stock', 'Acao', stocks_list, multiple = FALSE),
                  dateRangeInput('date', strong('Intervalo de tempo desejado'), 
                                 min = '2016-07-01', 
                                 max = '2021-08-10', 
                                 start = '2016-07-01', 
                                 end = '2021-08-10', 
                                 separator = "ate", 
                                 language = 'pt', 
                                 format = 'dd/mm/yy'),
                  uiOutput("timedate"),
                  actionButton('go', 'Submeter')
              )
            ),
            fluidRow(
              box(title = "Informacoes sobre a acao", width = 12, solidHeader = TRUE,
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
              box(title = 'Selecione suas acoes', width = 12, solidHeader = TRUE, status = 'warning',
                  selectInput('stock_comp', 'Acao', stocks_list, multiple = TRUE),
                  dateRangeInput('date_comp', strong('Intervalo de tempo desejado'), 
                                 min = '2016-07-01', 
                                 max = '2021-08-10', 
                                 start = '2016-07-01', 
                                 end = '2021-08-10', 
                                 separator = "ate", 
                                 language = 'pt', 
                                 format = 'dd/mm/yy'),
                  uiOutput("timedate_comp"),
                  actionButton('go_comp', 'Submeter')
              )
            ),
    )
  )
)

ui <- dashboardPage(
  skin = 'black',
  header, sidebar, body
)
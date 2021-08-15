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
              box(title = "Informacoes sobre os valores de fechamento da acao", width = 12, solidHeader = TRUE,
                  DTOutput('info')
              )
            ),
            fluidRow(
              box(title = "Grafico em linha da acao", width = 12, solidHeader = TRUE,
                  plotOutput('sh')
              )
            ),
            
            fluidRow(
              box(title = "Histograma da acao", width = 12, solidHeader = TRUE,
                  plotOutput('hi')
              )
            ),
            
            fluidRow(
              box(title = "Boxplot da acao", width = 12, solidHeader = TRUE,
                  plotOutput('bo')
              )
            ),
    ),
    tabItem(tabName = 'comp',
            fluidRow(
              box(title = 'Selecione suas duas acoes', width = 12, solidHeader = TRUE, status = 'warning',
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
            
            fluidRow(
              box(title = "Correlacao entre as acoes escolhidas", width = 12, solidHeader = TRUE,
                  DTOutput('co')
              )
            ),
            
            fluidRow(
              box(title = "Grafico de linha das altas das acoes", width = 12, solidHeader = TRUE,
                  plotOutput('li_comp')
              )
            ),
            
            fluidRow(
              box(title = "Grafico em barra das medias das acoes", width = 12, solidHeader = TRUE,
                  plotOutput('ba_comp')
              )
            ),
            
            fluidRow(
              box(title = "Scatterplot das acoes", width = 12, solidHeader = TRUE,
                  plotOutput('sc_comp')
              )
            ),
    )
  )
)

ui <- dashboardPage(
  skin = 'black',
  header, sidebar, body
)
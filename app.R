### parte de ui
ui <- dashboardPage(

  dashboardHeader(title="Projeto de Estatística"),

  dashboardSidebar(
    sidebarMenu(
      menuItem("Métricas", tabName= "m", icon= icon("chart-line")),
      menuItem("Comparando propriedades", tabName = 'comp', icon = icon('chart-bar'))
    )
  ),

  dashboardBody(
    tabItems(
      tabItem(tabName = 'm',
        fluidRow(
          box(title='Selecione suas opções', width = 12, solidHeader = TRUE, status = 'warning',
              selectInput('prop', 'Propriedade', properties_list, multiple= FALSE),
              uiOutput('timedate'),
              actionButton('go', 'Submeter'))
        )
      )
    )
  )
)


### parte das funções
server <- function(input, output) { }


### execução 
shinyApp(ui, server)
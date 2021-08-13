setwd('D:/Projeto 2 estatistica/projeto_estatistica')

source('global.R')
source('ui.R')
source('server.R')

shinyApp(
  ui = ui,
  server = server
)


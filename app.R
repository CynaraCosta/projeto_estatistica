setwd('/home/cynara/Documents/Documentos Cynara/teste')

source('global.R')
source('ui.R')
source('server.R')

shinyApp(
  ui = ui,
  server = server
)
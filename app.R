setwd('C:\Users\joao\Documents\projeto Est\projeto_estatistica')

source('global.R')
source('ui.R')
source('server.R')

shinyApp(
  ui = ui,
  server = server
)


server <- function(input, output) {
  x_options <- list(
    pageLenght = 10,
    language = list(
      url = "//cdn.datatables.net/plug-ins/1.10.11/i18n/Portuguese-Brasil.json"
    )
  )
  
  x_data <- eventReactive(input$go, {
    x <- master_df %>% subset(propertie_name == input$properties)
  })
  
}
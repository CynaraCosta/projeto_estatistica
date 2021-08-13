server <- function(input, output) {

  output$info <- renderDT({
    Info_DataTable() %>%
      as.data.frame() %>% 
      DT::datatable(options=list(
        language=list(
          url = '//cdn.datatables.net/plug-ins/1.10.11/i18n/Portuguese-Brasil.json'
        )
      ))
  })
  
  select_stock <- eventReactive(input$go, {
    stock_name <- input$stock
    date <- input$date
    
    df_stock <- master_df %>%
      filter(Stock == stock_name, Date == date)
    
    return(df_stock)
  })
  
}


server <- function(input, output) {
  
  select_stock <- eventReactive(input$go, {
    stock_name <- input$stock
    date <- input$date
    
    df_stock <- master_df %>%
      filter(Stock == stock_name, Date == date)
    
    return(df_stock)
  })
  
  select_stock_comp <- eventReactive(input$go_comp, {
    if (lenght(input$stock_comp) != 3){
      return(select_stock_comp)
    }
    
    df1 <- master_df %>% filter(Stock == input$stock_comp[1])
    df2 <- master_df %>% filter(Stock == input$stock_comp[2])
    
    range <- input$date_comp
      
  })
  
  
}


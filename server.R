server <- function(input, output) {
  
  select_stock <- eventReactive(input$go, {
    stock_name <- input$stock
    date <- input$date
    
    df_stock_name <- master_df %>% 
      filter(Stock == stock_name)
    
    df_stock <- df_stock_name %>%
      filter(Date >= date[1] & Date <= date[2])
    
    return(df_stock)
  })
  
  
  df_options <- list(
    pageLenght = 10,
    language = list(
      url = '//cdn.datatables.net/plug-ins/1.10.11/i18n/Portuguese-Brasil.json'
    )
  )
  
  output$sh <- renderPlot({
    df <- select_stock()
    
    aux <- df$High %>% na.omit() %>% as.numeric()
    aux1 <- min(aux)
    aux2 <- max(aux)
    
    remove_missing(df)
    
    df$Date <- ymd(df$Date)
    df %>%
      ggplot(aes(Date, High, group = 1)) +
      geom_path(color = 'orange') +
      ylab('Preco de alta da acao em $') +
      xlab('Intervalo temporal desejado') +
      coord_cartesian(ylim = c(aux1, aux2)) +
      theme_gray() +
      
      scale_x_date(date_labels = "%Y-%m-%d")
    
    
  })
  
  Info_DataTable <- eventReactive(input$go,{
    df <- select_stock()
    
    getmode <- function(value) {
      unique_value <- unique(value)
      unique_value[which.max(tabulate(match(value, unique_value)))]
    }
    
    m <- select(df, Close)
    Media <- apply(m, 2, mean)
    Mediana <- apply(m, 2, median)
    Moda <- apply(m, 2, getmode)
    Desvio_Padrao <- apply(m, 2, sd)
    ValorMaximo <- apply(m, 2, max)
    ValorMinimo <- apply(m, 2, min)
    
    Stock <- input$stock
    
    df_tb <-  data.frame(Stock, Media, Mediana, Moda, Desvio_Padrao, ValorMaximo, ValorMinimo)
    colnames(df_tb) <- c("Stock", "Media", "Mediana", "Moda", "Desvio Padrao", "Valor Maximo", "Valor Minimo")
    df_tb <- as.data.frame(t(df_tb))
    
    return(df_tb)
  })
  
  output$info <- renderDT({
    Info_DataTable() %>%
      as.data.frame() %>% 
      DT::datatable(options=list(
        language=list(
          url = '//cdn.datatables.net/plug-ins/1.10.11/i18n/Portuguese-Brasil.json'
        )
      ))
  })
  
  
  comp_line <- eventReactive(input$go_comp, {
    
    if (length(input$stock_comp) != 2){
      return()
    }
    
    stock_name1 <- input$stock_comp[1]
    stock_name2 <- input$stock_comp[2]
    date <- input$date_comp
    
    df <- master_df[
      master_df$Stock == stock_name1 |
      master_df$Stock == stock_name2,
      ] %>% 
      filter(Date >= date[1] & Date <= date[2])
      
    
    aux <- df$High %>% na.omit() %>% as.numeric()
    aux1 <- min(aux)
    aux2 <- max(aux)
    
    remove_missing(df)
    
    df$Date <- ymd(df$Date)
    df %>%
      ggplot(aes(Date, High, group = 1, colour = Stock)) +
      geom_path() +
      ylab('Preco de alta das acoes em $') +
      xlab('Intervalo temporal desejado') +
      coord_cartesian(ylim = c(aux1, aux2)) +
      theme_gray() +
      theme(legend.position = "bottom") +
      scale_x_date(date_labels = "%Y-%m-%d")
  })
  
  
  output$li_comp <- renderPlot(comp_line())
}
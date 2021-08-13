library(shiny)
library(shinydashboard)
library(dplyr)
library(ggplot2)
library(DT)
library(lubridate)

master_df <- read.csv('stocks.csv')
stocks_list <- c('AAPL', 'AMZN', 'GOOGL', 'TSLA')


master_df$X <- NULL

master_df$Date <- strptime(master_df$Date, format='%Y-%m-%d')
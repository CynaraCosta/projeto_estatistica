library(dplyr)
library(shiny)
library(shinydashboard)
library(ggplot2)

master_df <- read.csv('tesla_data.csv')
properties_list <- c('Open', 'Close', 'Volume')

master_df$Date <- strptime(master_df$Date, format='%Y-%m-%d')
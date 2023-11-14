install.packages("tidyverse") #instala el paquete de la libreria
library("tidyverse") #carga la libreria

#limpieza de datos
install.packages('here')
library("here")
install.packages('skimr')
library('skimr')
install.packages('janitor')
library('janitor')

library(dplyr)

library(readxl)

setwd("C:/Users/igelectronica01/Desktop")

tabla_dani <- read_excel("Table_796.xlsx")

tabla_dani <- clean_names(tabla_dani)

tabla_dani4 <- tabla_dani3 %>%
  drop_na() %>%
    #filter(modalidad=="TC1" | modalidad=="TC2") %>%
      group_by(modalidad) %>%
        summarise(cuenta=n())

salida2 <- salida[complete.cases(salida$x5), ]

colnames(tabla_dani)

tabla_dani3 <- rename(tabla_dani, modalidad=exportacion_de_datos_a_una_hoja_de_microsoft_excel)

tabla_dani5 <- tabla_dani3 %>%
  drop_na() %>%
  filter(modalidad=="RMC" | modalidad=="RMB"| modalidad=="RMC")
  

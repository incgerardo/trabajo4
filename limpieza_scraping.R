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

setwd("C:/Users/igelectronica01/Desktop")

doctoralia <- read_csv("doctoralia.csv")

head(doctoralia)
colnames(doctoralia)
glimpse(doctoralia)
view(doctoralia)

doctoralia <- clean_names(doctoralia) #normaliza los encabezados

#cambio los nombres
doctoralia <- rename(doctoralia, "nombre" = "text_body")
doctoralia <- rename(doctoralia, "pagina_de_detalles" = "pr_1_href")
doctoralia <- rename(doctoralia, "nombre" = "text_body")
doctoralia <- rename(doctoralia, "especialidad" = "h5")
doctoralia <- rename(doctoralia, "especialidad2" = "hide")
doctoralia <- rename(doctoralia, "modalidad" = "m_0_2")
doctoralia <- rename(doctoralia, "precio" = "m_0_3")
doctoralia <- rename(doctoralia, "direccion" = "text_truncate")
doctoralia <- rename(doctoralia, "coordenadas" = "text_muted_href_2")

#borro columnas
doctoralia <- select(doctoralia, -"mb_1_src") #borra columna
doctoralia <- select(doctoralia, -"text_muted")
doctoralia <- select(doctoralia, -"text_muted_href")
doctoralia <- select(doctoralia, -"m_0")
doctoralia <- select(doctoralia, -"media_body_href")
doctoralia <- select(doctoralia, -"opinion_numeral")
doctoralia <- select(doctoralia, -"text_muted_2")
doctoralia <- select(doctoralia, -"ml_0_5")

#intercambiar columnas
doctoralia_final <- doctoralia[, c(2,1,3,4,5,6,7,8)]
                     
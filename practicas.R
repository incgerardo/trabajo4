install.packages("palmerpenguins") #instala el paquete de la libreria
library(palmerpenguins) #carga la libreria

install.packages("ggplot2") #instala el paquete de la libreria
library(ggplot2) #carga la libreria

install.packages("tidyverse") #instala el paquete de la libreria
library("tidyverse") #carga la libreria

#limpieza de datos
install.packages('here')
library("here")
install.packages('skimr')
library('skimr')
install.packages('janitor')
library('janitor')

data("penguins") #genero un dataframe con la libreria

resultado <- penguins %>% #
  drop_na() %>% #saltea los sin dato para que se puedan hacer calculos
  group_by(island) %>%
  summarise(maximo = max(bill_length_mm)) #la funcion summarise se usa con group_by

data("diamonds")

ggplot(data = penguins) + geom_smooth(mapping = aes(x = flipper_length_mm, y = body_mass_g))

ggplot(data = penguins, aes(x=flipper_length_mm, y= body_mass_g)) + 
  geom_point() +
  geom_smooth(method="loess") # se usa con pocas muestras

ggplot(data = penguins, aes(x=flipper_length_mm, y= body_mass_g)) + 
  geom_point() +
  geom_smooth(method="gam", formula = y ~s(x)) #se usa cuando hay muchas muestras

ggplot(data = penguins, aes(x=flipper_length_mm, y= body_mass_g)) + 
  geom_point(aes(color = species)) + 
  facet_wrap(~species) # alt + 126

# In the case of this example, the independent variable at the end of the syntax 
# line would be species, and the dependent variable in this case is facet_wrap. 
# The facet_wrap is actually a function that is being called to separate and distribute 
# the independent data within the plot. 

setwd("C:/Users/igelectronica01/Desktop") #para setear el directorio de trabajo
getwd() #para saber cual es el directorio de trabajo seteado

rm() #borra variables

data_ups <- read_csv("data_ups.csv")

fecha <- as.Date(data_ups$Date, format="%d/%m/%Y")

data_ups_v2 <- mutate(data_ups,fecha=fecha)

data_ups_v3 <- data_ups_v2 %>%
  unite('tiempo', fecha, Time, sep=' ' )

data_ups_v4 <- clean_names(data_ups_v3)
ggplot(data = data_ups_v4, aes(y=input_voltage)) + geom_line()

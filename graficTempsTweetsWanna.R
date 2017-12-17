#comprovamos e instalamos los paquetes necesarios
revisarPaquetes <- function(pkg){
  nuevoPaquete <- pkg[!(pkg %in% installed.packages()[, "Package"])]
  if (length(nuevoPaquete)) #si el paquete no esta instalado
    install.packages(nuevoPaquete, dependencies = TRUE) #instalamos
  sapply(pkg, require, character.only = TRUE)
}

paquetsNecessaris<-c("magrittr","dplyr","ggplot2") #paquetes necesarios
revisarPaquetes(paquetsNecessaris) #llamamos a la funcion creada

tweetFrame <- readRDS(file = "wannacry.rds") #Sacamos dataFrame guardado en la busqueda

tweetFrame$created <- as.Date(as.POSIXct(trunc(tweetFrame$created, "days"), 'GMT')) #modificamos el valor de la columna created para que eliminar la parte correspondiente a horas minutos y segundos

tweetFrame %>%
  count(created, sort = TRUE) %>% #cogemos la columna created
  filter(n > 100) %>%  
  mutate(created = reorder(created, n)) %>%
  ggplot(aes(created, n)) + #dibujamos el grafico
  geom_col() +
  xlab(NULL) +
  coord_flip() #ejes coordenadas

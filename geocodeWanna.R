#comprovamos e instalamos los paquetes necesarios
revisarPaquetes <- function(pkg){
  nuevoPaquete <- pkg[!(pkg %in% installed.packages()[, "Package"])]
  if (length(nuevoPaquete)) #si el paquete no esta instalado
    install.packages(nuevoPaquete, dependencies = TRUE) #instalamos
  sapply(pkg, require, character.only = TRUE)
}

paquetsNecessaris<-c("twitteR", "RCurl", "dismo", "maps", "ggplot2", "XML") #paquetes necesarios
revisarPaquetes(paquetsNecessaris) #llamamos a la funcion creada

consumer_key <- 'PUZuo6k75lZYGQBRiwlJLc9Og'
consumer_secret <- '4My1RZHZgbYvaA5XBIAcJ11dqpgQtDOEecHR3LoZFcouCr1nL7'
access_token <- '938134932383260672-vkIaphVYLXb2tnnpKFJU3calS4pE4hu'
access_secret <- 'ZNscFMCMQX9ercbLgN16ROrsFULA0GX04k0BMgS7VvnAQ'

setup_twitter_oauth(consumer_key, consumer_secret, access_token, access_secret) #accesso a Twitter
1 ##para confirmar la autenticacion

if (file.exists("wannacry.rds")){ #comprobamos que exista el archivo
  tweetFrame <- readRDS(file = "wannacry.rds") #Sacamos dataFrame guardado en la busqueda
  userInfo <- lookupUsers(tweetFrame$screenName)  # buscamos informacion sobre los usuarios
  userFrame <- twListToDF(userInfo)  # Convertimos a DataFrame
  
  locatedUsers <- !is.na(userFrame$location)  # Guardamos la informacion relativa a la localitzacion de los usuarios
  
  locations <- geocode(userFrame$location[locatedUsers])  # API para conseguir la localizacion aproximada de los usuarios a partir de latitud i longitud.
  with(locations, plot(longitude, latitude))
  
  worldMap <- map_data("world")  # MAPAMUNDI
  
  zp1 <- ggplot(worldMap) # Pintamos el mapa
  #tratamos el mapa
  zp1 <- zp1 + geom_path(aes(x = long, y = lat, group = group), colour = gray(2/3), lwd = 1/3) 
  # Afegim un punt per usuari
  zp1 <- zp1 + geom_point(data = locations, aes(x = longitude, y = latitude), colour = "RED", alpha = 1/2, size = 1/3)
  zp1 <- zp1 + coord_equal() # permite conservar la relacion altura ancho (proporciones)
  zp1 <- zp1 + theme_minimal()  # quitar información no útil del fondo
  print(zp1)
} else {
  #print("ERROR! Primero genera el archivo playstation.rds!")
  stop("ERROR! Primero genera el archivo wannacry.rds!") 
}


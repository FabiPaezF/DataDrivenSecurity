#comprovamos e instalamos los paquetes necesarios
revisarPaquetes <- function(pkg){
  nuevoPaquete <- pkg[!(pkg %in% installed.packages()[, "Package"])]
  if (length(nuevoPaquete)) #si el paquete no esta instalado
    install.packages(nuevoPaquete, dependencies = TRUE) #instalamos
  sapply(pkg, require, character.only = TRUE)
}

paquetsNecessaris<-c("twitteR", "RCurl", "dismo", "maps", "ggplot2", "XML") #paquetes necesarios
revisarPaquetes(paquetsNecessaris) #llamamos a la funcion creada

consumer_key <- 'xTtWssMDK0lbL3snyh07qc6Tq'
consumer_secret <- 'uhFU4p4XAijNMaKXml9dqatYN09AhWKU2XgNFgDkYIPEMMjafe'
access_token <- '942082776689528832-p8iBl60ho1aYTNmwOFxgOIKF1TrSeLo'
access_secret <- 'kadqQQ0YqP5iGzgp9MkfP4pDRM6rDXrL9N7khPlPqcgv5'

setup_twitter_oauth(consumer_key, consumer_secret, access_token, access_secret) #accesso a Twitter
1 ##para confirmar la autenticacion

if (file.exists("judyb.rds")){ #comprobamos que exista el archivo
  tweetFrame <- readRDS(file = "judyb.rds") #Sacamos dataFrame guardado en la busqueda
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
  stop("ERROR! Primero genera el archivo playstation.rds!") 
}


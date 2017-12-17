#comprovamos e instalamos los paquetes necesarios
revisarPaquetes <- function(pkg){
  nuevoPaquete <- pkg[!(pkg %in% installed.packages()[, "Package"])]
  if (length(nuevoPaquete)) #si el paquete no esta instalado
    install.packages(nuevoPaquete, dependencies = TRUE) #instalamos
  sapply(pkg, require, character.only = TRUE)
}

paquetsNecessaris<-c("twitteR", "RCurl", "dismo", "maps", "ggplot2", "XML") #paquetes necesarios
revisarPaquetes(paquetsNecessaris) #llamamos a la funcion creada

#consumer_key <- 'PUZuo6k75lZYGQBRiwlJLc9Og'
#consumer_secret <- '4My1RZHZgbYvaA5XBIAcJ11dqpgQtDOEecHR3LoZFcouCr1nL7'
#access_token <- '938134932383260672-vkIaphVYLXb2tnnpKFJU3calS4pE4hu'
#access_secret <- 'ZNscFMCMQX9ercbLgN16ROrsFULA0GX04k0BMgS7VvnAQ'
consumer_key <- 'xTtWssMDK0lbL3snyh07qc6Tq'
consumer_secret <- 'uhFU4p4XAijNMaKXml9dqatYN09AhWKU2XgNFgDkYIPEMMjafe'
access_token <- '942082776689528832-p8iBl60ho1aYTNmwOFxgOIKF1TrSeLo'
access_secret <- 'kadqQQ0YqP5iGzgp9MkfP4pDRM6rDXrL9N7khPlPqcgv5'

setup_twitter_oauth(consumer_key, consumer_secret, access_token, access_secret) #accesso a Twitter
1 ##para confirmar la autenticacion
tweetFrame <- readRDS(file = "wannacry.rds")

userInfo <- lookupUsers(tweetFrame$screenName)  # buscamos informacion sobre los usuarios
userFrame <- twListToDF(userInfo)  # Convertimos a DataFrame

locatedUsers <- !is.na(userFrame$location)  # Guardamos la informacion relativa a la localitzacion de los usuarios

locations <- geocode(userFrame$location[locatedUsers])  # API para conseguir la localizacion aproximada de los usuarios a partir de latitud i longitud.
with(locations, plot(longitude, latitude))

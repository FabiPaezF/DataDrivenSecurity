#Paquetes necesarios..
require(twitteR)
require(RCurl)
require(dismo)
require(maps)
require(ggplot2)
require(httr)
require(XML)

consumer_key <- 'PUZuo6k75lZYGQBRiwlJLc9Og'
consumer_secret <- '4My1RZHZgbYvaA5XBIAcJ11dqpgQtDOEecHR3LoZFcouCr1nL7'
access_token <- '938134932383260672-vkIaphVYLXb2tnnpKFJU3calS4pE4hu'
access_secret <- 'ZNscFMCMQX9ercbLgN16ROrsFULA0GX04k0BMgS7VvnAQ'

setup_twitter_oauth(consumer_key, consumer_secret, access_token, access_secret) #accesso a Twitter

searchResults <- searchTwitter("wannacry", n = 1000)  # Cogemos n Tweets sobre un tema determinado
tweetFrame <- twListToDF(searchResults)  # Convertimos la busqueda en un dataFrame

userInfo <- lookupUsers(tweetFrame$screenName)  # Cercam informacio sobre els usuaris
userFrame <- twListToDF(userInfo)  # Convertim a DataFrame

locatedUsers <- !is.na(userFrame$location)  # Guardam la informació relativa a la localitzacio dels usuaris

locations <- geocode(userFrame$location[locatedUsers])  # API per aconseguir la localitzacio aproximada dels usuaris a partir de la Latitud Longitud
with(locations, plot(longitude, latitude))

worldMap <- map_data("world")  # MAPAMUNDI

zp1 <- ggplot(worldMap) 
zp1 <- zp1 + geom_path(aes(x = long, y = lat, group = group),  # Pintam el mapa
                       colour = gray(2/3), lwd = 1/3)
zp1 <- zp1 + geom_point(data = locations,  # Afegim un punt per usuari
                        aes(x = longitude, y = latitude),
                        colour = "RED", alpha = 1/2, size = 1/3)
zp1 <- zp1 + coord_equal()  # Better projections are left for a future post
zp1 <- zp1 + theme_minimal()  # Drop background annotations
print(zp1)
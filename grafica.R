#Paquetes necesarios..
require(RCurl)
require(dismo)
require(httr)
require(XML)
#A

nWanna <- nrow(readRDS(file = "wannacry.rds"))
print(nWanna)
nAtac2 <- nrow(readRDS(file = "wannacry.rds"))
nAtac3 <- nrow(readRDS(file = "wannacry.rds"))

taula <- table(nWanna$,nAtac2$,nAtac3$)

barplot(table(taula$), main = "Observaciones por Region")


#Paquetes necesarios..
require(RCurl)
require(dismo)
require(httr)
require(XML)
#A

wanna <- readRDS(file = "wannacry.rds")
nWanna <- nrow(readRDS(file = "wannacry.rds"))

print(nWanna)
nAtac2 <- nrow(readRDS(file = "wannacry.rds"))
nAtac3 <- nrow(readRDS(file = "wannacry.rds"))

graphic <- matrix(c(nWanna,nAtac2,nAtac3),ncol=3,byrow=TRUE)
colnames(graphic) <- c("Wannacry","nAtac2","nAtac3")
graphic <- as.table(graphic)
#graphic

barplot(graphic, main = "Comparación nº tweets ataques")


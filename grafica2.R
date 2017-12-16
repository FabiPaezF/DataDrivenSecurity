#comprovamos e instalamos los paquetes necesarios
revisarPaquetes <- function(pkg){
  nuevoPaquete <- pkg[!(pkg %in% installed.packages()[, "Package"])]
  if (length(nuevoPaquete)) #si el paquete no esta instalado
    install.packages(nuevoPaquete, dependencies = TRUE) #instalamos
  sapply(pkg, require, character.only = TRUE)
}

paquetsNecessaris<-c("RCurl","dismo","httr","XML") #paquetes necesarios
revisarPaquetes(paquetsNecessaris) #llamamos a la funcion creada

wanna <- readRDS(file = "wannacry.rds")
nWanna <- nrow(readRDS(file = "wannacry.rds"))
#print(nWanna)
nAtac2 <- nrow(readRDS(file = "wannacry.rds"))
nAtac3 <- nrow(readRDS(file = "wannacry.rds"))

graphic <- matrix(c(nWanna,nAtac2,nAtac3),ncol=3,byrow=TRUE)
colnames(graphic) <- c("Wannacry","nAtac2","nAtac3")
graphic <- as.table(graphic)
#graphic

barplot(graphic, main = "Comparación nº tweets ataques")


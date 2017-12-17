#comprovamos e instalamos los paquetes necesarios
revisarPaquetes <- function(pkg){
  nuevoPaquete <- pkg[!(pkg %in% installed.packages()[, "Package"])]
  if (length(nuevoPaquete)) #si el paquete no esta instalado
    install.packages(nuevoPaquete, dependencies = TRUE) #instalamos
  sapply(pkg, require, character.only = TRUE)
}

paquetsNecessaris<-c("RCurl","dismo","httr","XML") #paquetes necesarios
revisarPaquetes(paquetsNecessaris) #llamamos a la funcion creada

if (file.exists("wannacry.rds")){
  wanna <- readRDS(file = "wannacry.rds")
  nWanna <- nrow(readRDS(file = "wannacry.rds"))
  #print(nWanna)
}
if (file.exists("playstation.rds")){
  play <- readRDS(file = "playstation.rds")
  nPlay <- nrow(readRDS(file = "playstation.rds"))
  #print(nWanna)
}

if (file.exists("playstation.rds")){
  atac3 <- readRDS(file = "wannacry.rds")
  nAtac3 <- nrow(readRDS(file = "wannacry.rds"))
  #print(nWanna)
}

graphic <- matrix(c(nWanna,nPlay,nAtac3),ncol=3,byrow=TRUE)
colnames(graphic) <- c("Wannacry","Playstation DDoS","nAtac3")
graphic <- as.table(graphic)
#graphic

barplot(graphic, main = "Comparación nº tweets ataques")
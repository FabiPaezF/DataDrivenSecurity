#searchFile <- read.csv(paste("MyData",x,".csv"))
setwd("Wannacry")
ficheros <- dir()
for(fichero in ficheros){
  print(fichero)
}

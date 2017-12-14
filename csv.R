x<-3
search <- 4
write.csv(search, file = paste("./Wannacry/MyData",x,".csv", sep=""))
searchFile <- read.csv(paste("./Wannacry/MyData",x,".csv", sep=""))
print(searchFile)
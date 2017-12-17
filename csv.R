<<<<<<< HEAD
x<-3
search <- 4
write.csv(search, file = paste("./Wannacry/MyData",x,".csv", sep=""))
searchFile <- read.csv(paste("./Wannacry/MyData",x,".csv", sep=""))
=======
x<-3
search <- 4
write.csv(search, file = paste("./Wannacry/MyData",x,".csv", sep=""))
searchFile <- read.csv(paste("./Wannacry/MyData",x,".csv", sep=""))
>>>>>>> b34f19c0ca8338f96da9f3aec002d398318116e1
print(searchFile)
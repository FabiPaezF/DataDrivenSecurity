## Lectura de datos
download.file("https://github.com/humbertcostas/courses/raw/master/04_ExploratoryAnalysis/exploratoryGraphs/data/avgpm25.csv","avgpm25.csv")
pollution <- read.csv("avgpm25.csv", colClasses = c("numeric", "character", "factor", "numeric", "numeric"))
head(pollution, n=2)

# Resumen elemental
summary(pollution$pm25)

## Exploración rápida de UNA dimensión

# Histograma con observaciones y 50 divisiones
hist(pollution$pm25, col = "green", breaks = 50)
rug(pollution$pm25)

# Añadimos un par de linias verticales
abline(v = 12, lwd = 2)
abline(v = median(pollution$pm25), col="magenta", lwd=4)

# Gráfica de barras
barplot(table(pollution$region), col="wheat", main = "Observaciones por Region")

# Gráfica tipo pie ("quesito")
library(MASS)
pie(table(pollution$region))

## Exploración rápida de DOS dimensión
# Multiple Boxplots
boxplot(pm25 ~ region, data = pollution, col = "red")

# Multiple Histograms
par(mfrow = c(2, 1), mar = c(4, 4, 2, 1))
hist(subset(pollution, region == "east")$pm25, col = "green")
hist(subset(pollution, region == "west")$pm25, col = "green")

# Gráficos de dispersion con color
dev.off()
with(pollution, plot(latitude, pm25, col = region))
abline(h = 12, lwd = 2, lty = 2)

# Dispersión multiple
par(mfrow = c(1, 2), mar = c(5, 4, 2, 1))
with(subset(pollution, region == "west"), plot(latitude, pm25, main = "West"))
with(subset(pollution, region == "east"), plot(latitude, pm25, main = "East"))

#comprovamos e instalamos los paquetes necesarios
check.packages <- function(pkg){
  new.pkg <- pkg[!(pkg %in% installed.packages()[, "Package"])]
  if (length(new.pkg)) 
    install.packages(new.pkg, dependencies = TRUE)
  sapply(pkg, require, character.only = TRUE)
}

paquetsNecessaris<-c("wordcloud","RColorBrewer") #paquetes necesarios
check.packages(paquetsNecessaris) #llamamos a la funcion creada

tweetFrame <- readRDS(file = "wannacry.rds")

# get the text
tweet_texto = sapply(tweetFrame, function(x) tweetFrame$text)
# remove retweet entities
tweet_texto = gsub('(RT|via)((?:\\b\\W*@\\w+)+)', '', tweet_texto)
# remove at people
tweet_texto = gsub('@\\w+', '', tweet_texto)
# remove punctuation
tweet_texto = gsub('[[:punct:]]', '', tweet_texto)
# remove numbers
tweet_texto = gsub('[[:digit:]]', '', tweet_texto)
# remove html links
tweet_texto = gsub('http\\w+', '', tweet_texto)
# remove unnecessary spaces
tweet_texto = gsub('[ \t]{2,}', '', tweet_texto)

tweet_texto = strsplit(tweet_texto, " ")

dtm <- TermDocumentMatrix(tweet_texto)
m <- as.matrix(dtm)
v <- sort(rowSums(m),decreasing=TRUE)
d <- data.frame(word = names(v),freq=v)
head(d, 10)
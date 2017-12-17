#comprovamos e instalamos los paquetes necesarios
check.packages <- function(pkg){
  new.pkg <- pkg[!(pkg %in% installed.packages()[, "Package"])]
  if (length(new.pkg)) 
    install.packages(new.pkg, dependencies = TRUE)
  sapply(pkg, require, character.only = TRUE)
}

paquetsNecessaris<-c("slam","wordcloud","RColorBrewer","tm","dplyr") #paquetes necesarios
check.packages(paquetsNecessaris) #llamamos a la funcion creada

if (file.exists("playstation.rds")){ #comprobamos que exista el archivo
  tweetFrame <- readRDS(file = "playstation.rds") #Sacamos dataFrame guardado en la busqueda
  # cogemos el tweet
  tweet_texto = tweetFrame$text
  ## opcional.... pero importante ... limpiamos el tweet
  # eliminamos las partes que no nos interesan
  tweet_texto = gsub('(RT|via)((?:\\b\\W*@\\w+)+)', '', tweet_texto)
  # eliminamos las personas @..
  tweet_texto = gsub('@\\w+', '', tweet_texto)
  # eliminamos signos de puntuacion
  tweet_texto = gsub('[[:punct:]]', '', tweet_texto)
  # eliminamos numeros..
  tweet_texto = gsub('[[:digit:]]', '', tweet_texto)
  # eliminamos links html
  tweet_texto = gsub('http\\w+', '', tweet_texto)
  # eliminamos espacios innecesarios
  tweet_texto = gsub('[ \t]{2,}', '', tweet_texto)
  # eliminamos caracteres raros..
  tweet_texto = gsub('[^[:graph:]]', ' ', tweet_texto)
  
  splitData <- unlist(strsplit(tweet_texto, "\\ ")) #spliteamos la frase en palabras sueltas
  #adicionalmente eliminamos conectores comunes....
  stopwords = c("are" ,
                "able" ,
                "about" ,
                "above" ,
                "the" ,
                "a" ,
                "",
                " ",
                "and",
                "has",
                "this" ,
                "our" ,
                "you've" ,
                "for")
  splitData <- removeWords(splitData,stopwords)
  #dataFrameWords <- as.data.frame(splitData)
  #m <- as.matrix(dataFrameWords)
  #numWords <- count(dataFrameWords)
  
  z <- Corpus(VectorSource(splitData)) #objeto para pintar...
  
  wordcloud(z, max.words = 100, random.order = FALSE)
  
} else {
  #print("ERROR! Primero genera el archivo playstation.rds!")
  stop("ERROR! Primero genera el archivo playstation.rds!") 
}


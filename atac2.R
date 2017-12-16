require(twitteR)
require(RCurl)

consumer_key <- 'xTtWssMDK0lbL3snyh07qc6Tq'
consumer_secret <- 'uhFU4p4XAijNMaKXml9dqatYN09AhWKU2XgNFgDkYIPEMMjafe'
access_token <- '942082776689528832-p8iBl60ho1aYTNmwOFxgOIKF1TrSeLo'
access_secret <- 'kadqQQ0YqP5iGzgp9MkfP4pDRM6rDXrL9N7khPlPqcgv5'

setup_twitter_oauth(consumer_key, consumer_secret, access_token, access_secret)
1

ltw <- list()
for (x in 1:100){
  searchResults <- searchTwitter('wannacry', since='2017-05-07', sinceID=x*5000, n=5000)
  ltw[[x]] <- twListToDF(searchResults)
}
df.tw <- plyr::ldply(ltw)
#nomestw<-df.tw %>% filter(isRetweet == FALSE)
saveRDS(df.tw, file = "wannacry.rds")

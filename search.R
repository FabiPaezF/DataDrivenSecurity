<<<<<<< HEAD
require(twitteR)
require(RCurl)

consumer_key <- 'PUZuo6k75lZYGQBRiwlJLc9Og'
consumer_secret <- '4My1RZHZgbYvaA5XBIAcJ11dqpgQtDOEecHR3LoZFcouCr1nL7'
access_token <- '938134932383260672-vkIaphVYLXb2tnnpKFJU3calS4pE4hu'
access_secret <- 'ZNscFMCMQX9ercbLgN16ROrsFULA0GX04k0BMgS7VvnAQ'

setup_twitter_oauth(consumer_key, consumer_secret, access_token, access_secret)
1

ltw <- list()
for (x in 1:3){
  searchResults <- searchTwitter('wannacry', since='2017-05-07', sinceID=x*5000, n=5000)
  ltw[[x]] <- twListToDF(searchResults)
}
df.tw <- plyr::ldply(ltw)
#nomestw<-df.tw %>% filter(isRetweet == FALSE)
saveRDS(df.tw, file = "wannacry.rds")
=======
require(twitteR)
require(RCurl)

consumer_key <- 'PUZuo6k75lZYGQBRiwlJLc9Og'
consumer_secret <- '4My1RZHZgbYvaA5XBIAcJ11dqpgQtDOEecHR3LoZFcouCr1nL7'
access_token <- '938134932383260672-vkIaphVYLXb2tnnpKFJU3calS4pE4hu'
access_secret <- 'ZNscFMCMQX9ercbLgN16ROrsFULA0GX04k0BMgS7VvnAQ'

setup_twitter_oauth(consumer_key, consumer_secret, access_token, access_secret)
1

ltw <- list()
for (x in 1:3){
  searchResults <- searchTwitter('wannacry', since='2017-05-07', sinceID=x*5000, n=5000)
  ltw[[x]] <- twListToDF(searchResults)
}
df.tw <- plyr::ldply(ltw)
#nomestw<-df.tw %>% filter(isRetweet == FALSE)
saveRDS(df.tw, file = "wannacry.rds")
>>>>>>> b34f19c0ca8338f96da9f3aec002d398318116e1

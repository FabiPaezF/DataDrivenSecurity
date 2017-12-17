require(twitteR)
require(RCurl)

consumer_key <- 'PUZuo6k75lZYGQBRiwlJLc9Og'
consumer_secret <- '4My1RZHZgbYvaA5XBIAcJ11dqpgQtDOEecHR3LoZFcouCr1nL7'
access_token <- '938134932383260672-vkIaphVYLXb2tnnpKFJU3calS4pE4hu'
access_secret <- 'ZNscFMCMQX9ercbLgN16ROrsFULA0GX04k0BMgS7VvnAQ'

setup_twitter_oauth(consumer_key, consumer_secret, access_token, access_secret)
<<<<<<< HEAD
1

for (x in 1:10){
  search <- searchTwitter('wannacry', since=NULL, until=07/05/2017, locale=12/02/2017, sinceID=(1*x), maxID=(100*x), n=100, retryOnRateLimit=1)
  tweetFrame <- twListToDF(searchResults)
  save(search, file = paste("./Wannacry/wannacry",x,".csv", sep=""))
}
=======


search <- searchTwitter('wannacry', n=1000, retryOnRateLimit=1)


print(search)
>>>>>>> b34f19c0ca8338f96da9f3aec002d398318116e1

require(twitteR)
require(RCurl)

consumer_key <- 'PUZuo6k75lZYGQBRiwlJLc9Og'
consumer_secret <- '4My1RZHZgbYvaA5XBIAcJ11dqpgQtDOEecHR3LoZFcouCr1nL7'
access_token <- '938134932383260672-vkIaphVYLXb2tnnpKFJU3calS4pE4hu'
access_secret <- 'ZNscFMCMQX9ercbLgN16ROrsFULA0GX04k0BMgS7VvnAQ'

setup_twitter_oauth(consumer_key, consumer_secret, access_token, access_secret)


search <- searchTwitter('wannacry', n=1000, retryOnRateLimit=1)


print(search)

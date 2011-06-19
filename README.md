#Tweetstreamer

Tweetstreamer lets you view your Twitter stream from a console. 

##Configuration
To be able to use it you have to generate a config.coffee with your user name and password in the same folder as the streamer.coffee file with the following format:

    exports.config =
        username : 'USERNAME'
        password : 'PASSWORD'

You can use the file config.coffee.default as a template.

##Usage

For now there are no options for Tweetstreamer just type in `coffee streamer.coffee` and you will recieve the tweets from your stream

##Color scheme

- **red**: tweeting user
- **blue**: user as replied to user in blue
- **green**: mentioned user in tweet or hash tag


##Links
Links should be click able in your favourite console. iTerm uses `Command-Click`, Ubunutu Terminal uses `CTRL-Click`.

##What to expect in future releases
- favourites: 
  - add and remove users from your favourites
  - highlight tweets from your favourites
  - display last tweets from your favourites
- confguration option to display time stamp
- reply to tweet

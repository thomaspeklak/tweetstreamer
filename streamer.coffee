#!/usr/local/bin/coffee

TwitterNode = require('twitter-node').TwitterNode
sys         = require('sys')
http        = require('http')
config      = require('./config').config
decorator   = require('./lib/decorator').decorator
keyListener = require('./lib/key-listener').keyListener
events      = require('events')



stream = (friend_ids) ->
  twit = new TwitterNode(
    user: config.username
    password: config.password
    follow: friend_ids
  )

  twit.headers['User-Agent'] = 'node'

  twit
    .addListener 'error', (error) ->
      console.log(error.message)
    .addListener 'tweet', (tweet) ->
      sys.puts("\x1B[31m\x1B[1m@" + tweet.user.screen_name + decorator.decorate(tweet)) 
    .addListener 'limit', (limit) ->
      sys.puts("LIMIT: " + sys.inspect(limit))
    .addListener 'delete', (del) ->
      sys.puts("DELETE: " + sys.inspect(del))
    .addListener 'end', (resp) ->
      sys.puts("/n\x1B[31mSo Long, and Thanks for All the Fish\x1B[0m /n" + resp.statusCode)
    .stream()

sys.puts 'retrieving friends'

http.get {
  host: "api.twitter.com",
  port: 80,
  path: "/1/friends/ids.json?screen_name=" + config.username},
  (res) ->
    body = ""
    res
      .on "data", (chunk) ->
        console.log 'getting data'
        body += chunk
      .on "end", ->
        friend_ids = JSON.parse(body)
        if friend_ids.length > 0 
          sys.puts 'Starting stream'
          stream friend_ids



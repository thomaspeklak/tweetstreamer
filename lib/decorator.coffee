exports.decorator = 
  in_reply: (tweet) -> if tweet.in_reply_to_screen_name? then " \x1B[0m\x1B[34m[re:" + tweet.in_reply_to_screen_name + ']' else ''
  mentions: (text) -> text.replace /(@\w*)/g,'\x1B[32m$1\x1B[0m'
  hash_tags: (text) -> text.replace /(#\w*)/g,'\x1B[32m$1\x1B[0m'
  decorate: (tweet) ->
    @in_reply(tweet) + "\x1B[0m\x1B[33m: \x1B[0m" + @mentions(
      @hash_tags(
        tweet.text
      )
    )


events      = require 'events'
tty         = require('tty').setRawMode(true)
stdin       = process.openStdin()

root = if typeof(exports) isnt "undefined" and exports isnt null then exports else this

class KeyListener extends events.EventEmitter
  constructor: ->
    events.EventEmitter.call(this)
    stdin.on 'keypress', (chunk, key) =>
      process.exit() if key and key.ctrl and key.name is 'c'
      @processKey chunk, key

  processKey: (chunk, key) ->
    process.stdout.write "Key: " + chunk + "\n"
    switch chunk
      when '+' then @emit 'add-to-favourites'
      when '-' then @emit 'remove-from-favourites'
      when 'u' then @emit 'undo'

root.KeyListener = KeyListener

new KeyListener

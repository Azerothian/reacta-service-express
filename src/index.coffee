Promise = require "native-or-bluebird"

bodyParser = require "body-parser"
cookieParser = require "cookie-parser"
session = require "express-session"


module.exports = (config = {}) ->
  if !config.bodyParser?
    config.bodyParser = {}
  return new Promise (resolve, reject) ->
    result = {
      deps:
        "session": ["cookie-parser"]
      modules:
        "session": session(config.session)
        "cookie-parser": cookieParser(config.cookieParser)
        "bodyparser-json": bodyParser.json(config.bodyParser.json)
        "bodyparser-raw": bodyParser.raw(config.bodyParser.raw)
        "bodyparser-text": bodyParser.text(config.bodyParser.text)
        "bodyparser-urlencoded": bodyParser.urlencoded(config.bodyParser.urlencoded)
    }
    return resolve(result)

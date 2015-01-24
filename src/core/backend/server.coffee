express = require 'express'
engines = require 'consolidate'
path = require 'path'
cookieParser = require 'cookie-parser'
bodyParser = require 'body-parser'
logger = require 'morgan'

helloController = requireRoot "modules/hello/controller"

handle =
  "/": helloController.main

start = (route, process) ->
  app = express()

  app.engine 'html', engines.hogan

  app.set 'view engine', 'html'
  app.set 'views', path.join(__dirname, '../../')

  app.use logger('combined')
  app.use cookieParser()
  app.use bodyParser.urlencoded({ extended: false })
  app.use bodyParser.json()

  app.use express.static(path.join(__dirname, '../../public'))

  app.get '/', (req, res) ->
    route(handle, '/', req, res)

  port = process.env.PORT ? 3000
  app.listen port
  console.log('Listening on port ' + port + ' of worker ' + process.pid)

module.exports = {
  start
}

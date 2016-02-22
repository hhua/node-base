express = require 'express'
engines = require 'consolidate'
path = require 'path'
cookieParser = require 'cookie-parser'
bodyParser = require 'body-parser'
logger = require 'morgan'

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

  requireRoot('core/routes')(app)

  port = process.env.PORT ? 3000
  app.listen port
  console.log('Listening on port ' + port + ' of worker ' + process.pid)

module.exports = {
  start
}

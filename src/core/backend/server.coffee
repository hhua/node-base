express = require 'express'
engines = require 'consolidate'
path = require 'path'

start = (route, handle, cluster) ->
  app = express()

  app.engine 'html', engines.hogan

  app.set 'view engine', 'html'
  app.set 'views', path.join(__dirname, '../frontend')

  app.get '/', (req, res) ->
    route(handle, '/', req, res)

  app.use express.static('./dest/core/frontend')
  port = process.env.PORT ? 3000
  app.listen port
  console.log('Listening on port ' + port + ' of worker ' + cluster.worker.id)

module.exports.start = start
cluster = require 'cluster'

server = require("./core/backend/server")
router = require("./core/backend/router")
requestHandlers = require("./core/backend/requestHandlers")

handle =
  "/": requestHandlers.main

if cluster.isMaster
  cpuCount = require('os').cpus().length

  for i in [0...cpuCount]
    cluster.fork()

  cluster.on 'exit', (worker) ->
    console.log('Worker ' + worker.id + ' died :(\nWe will create another one!')
    cluster.fork()
else
  server.start(router.route, handle, cluster)

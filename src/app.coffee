require './core/globals'
clusterMaster = require 'cluster-master'

clusterMaster
  exec: "dest/worker.js"
  size: 2
  env: {}
  onMessage: (msg) ->
    console.log "IPC message %s %j", @uniqueID, msg

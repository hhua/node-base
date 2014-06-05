clusterMaster = require 'cluster-master'

clusterMaster
  exec: "dest/worker.js"
  size: 5
  env: {}
  onMessage: (msg) ->
    console.log "IPC message %s %j", @uniqueID, msg

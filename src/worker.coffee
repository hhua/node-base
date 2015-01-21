require './core/globals'
server = requireRoot "core/backend/server"
router = requireRoot "core/backend/router"

server.start(router.route, process)

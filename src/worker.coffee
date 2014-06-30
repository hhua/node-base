require './core/globals'
server = requireRoot("./core/backend/server")
router = requireRoot("./core/backend/router")
requestHandlers = requireRoot("./core/backend/requestHandlers")

handle =
  "/": requestHandlers.main

server.start(router.route, handle, process)
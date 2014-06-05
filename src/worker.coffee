server = require("./core/backend/server")
router = require("./core/backend/router")
requestHandlers = require("./core/backend/requestHandlers")

handle =
  "/": requestHandlers.main

server.start(router.route, handle, process)
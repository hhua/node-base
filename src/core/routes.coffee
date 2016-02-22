
moduleRoutes =
  hello:
    base: '/'
    routes: requireRoot 'modules/hello/routes'

module.exports = (app) ->
  {handleControllerRequest, appControllers} = requireRoot 'core/controllers'

  app.get '/heartbeat', (req, res) ->
    res.send("Ok")

  for moduleName, module of moduleRoutes
    module.routes app, handleControllerRequest, module.base


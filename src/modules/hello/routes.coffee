
module.exports = (app, handleControllerRequest, moduleBaseRoute) ->
  app.get "#{moduleBaseRoute}", handleControllerRequest 'hello', 'main'


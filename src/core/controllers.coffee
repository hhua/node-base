debug = require('debug')('core/controllers')

appControllers =
  hello: requireRoot "modules/hello/controller"

handleControllerRequest = (controllerName, actionName, options = {}) ->
  debug('handleControllerRequest %s#%s', controllerName, actionName)
  throw new Error("controllerName " + controllerName + " is not defined") unless controllerName of appControllers

  controller = appControllers[controllerName]
  throw new Error(controllerName + "#" + actionName + " is not defined") unless actionName of controller

  controller[actionName]

module.exports = { appControllers, handleControllerRequest }


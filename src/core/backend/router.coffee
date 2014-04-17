route = (handle, pathname, request, response) ->
  console.log("About to route a request for " + pathname)
  if (typeof handle[pathname]) is 'function'
    handle[pathname](request, response)
  else
    console.log("No request handler found for " + pathname)
    response.writeHead 404, "Content-Type" : "text/plain"
    response.write "404 Not Found"
    response.end()

module.exports.route = route
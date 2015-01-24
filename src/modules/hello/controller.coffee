debug = require('debug')('modules/hello/controller')

main = (req, res) ->
  debug("Request handler 'main' was called.")

  res.render 'modules/hello/index', { hello: "hello" }, (err, helloHtml) ->
    bodyHash = { body: helloHtml }
    console.log '#######', err
    console.log '#######', helloHtml

    res.render 'core/frontend/index', bodyHash, (err, html) ->
      res.set('Content-Type', 'text/html')
      res.send(new Buffer(html))

module.exports = {
  main
}

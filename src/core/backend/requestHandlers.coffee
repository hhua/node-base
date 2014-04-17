main = (req, res) ->
  console.log("Request handler 'main' was called.")
  res.render 'index', { hello: "hello" }, (err, html) ->
    console.log html
    res.set('Content-Type', 'text/html')
    res.send(new Buffer(html))

module.exports.main = main

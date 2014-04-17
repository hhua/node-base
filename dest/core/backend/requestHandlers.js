(function() {
  var main;

  main = function(req, res) {
    console.log("Request handler 'main' was called.");
    return res.render('index', {
      hello: "hello"
    }, function(err, html) {
      console.log(html);
      res.set('Content-Type', 'text/html');
      return res.send(new Buffer(html));
    });
  };

  module.exports.main = main;

}).call(this);

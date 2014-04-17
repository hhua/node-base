(function() {
  var cons, express, mustache, path, start;

  express = require('express');

  mustache = require('mustache');

  cons = require('consolidate');

  path = require('path');

  start = function(route, handle) {
    var app, port, _ref;
    app = express();
    app.engine('html', cons.hogan);
    app.set('view engine', 'html');
    app.set('views', path.join(__dirname, '../frontend'));
    console.log(path.join(__dirname, '../frontend'));
    app.get('/', function(req, res) {
      return route(handle, '/', req, res);
    });
    app.use(express["static"]('./dest/core/frontend'));
    port = (_ref = process.env.PORT) != null ? _ref : 3000;
    app.listen(port);
    return console.log('Listening on port ' + port);
  };

  module.exports.start = start;

}).call(this);

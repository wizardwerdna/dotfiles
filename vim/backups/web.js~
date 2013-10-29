'use strict';
var gzippo = require('gzippo');
var express = require('express');
var app = express();
 
app.use(express.logger('dev'));
app.use(gzippo.staticGzip('' + __dirname + '/dist'));
app.use(function(req, res) {
  res.sendfile(__dirname + '/public/index.html');
});
app.listen(process.env.PORT || 5000);


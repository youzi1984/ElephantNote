var express = require('express');
var path = require('path');
var favicon = require('serve-favicon');
var logger = require('morgan');
var cookieParser = require('cookie-parser');
var bodyParser = require('body-parser');
var engine=require('ejs-mate');


var index = require('./routes/index');
var users = require('./routes/users');
var tasks = require('./routes/tasks');
var login = require('./routes/login');
var reg = require('./routes/reg');

var app = express();
var mongoose = require('mongoose');


mongoose.connect('mongodb://localhost/express',{useMongoClient:true},
  function(err){
    if(err){
      console.log('connection error',err);
    }else{
      console.log('connection successful');
    }
  }
);

// view engine setup
app.set('views', path.join(__dirname, 'views'));
app.set('view engine', 'ejs');
app.engine('ejs',engine);

// uncomment after placing your favicon in /public
//app.use(favicon(path.join(__dirname, 'public', 'favicon.ico')));
app.use(logger('dev'));
app.use(bodyParser.json());
app.use(bodyParser.urlencoded({ extended: false }));
app.use(cookieParser());
app.use(express.static(path.join(__dirname, 'public')));

app.use('/', index);
app.use('/users', users);
app.use('/tasks',tasks);
app.use('/login',login);
app.use('/reg',reg);

// catch 404 and forward to error handler
app.use(function(req, res, next) {
  var err = new Error('Not Found');
  err.status = 404;
  next(err);
});

// error handler
app.use(function(err, req, res, next) {
  // set locals, only providing error in development
  res.locals.message = err.message;
  res.locals.error = req.app.get('env') === 'development' ? err : {};

  // render the error page
  res.status(err.status || 500);
  res.render('error');
});

module.exports = app;
var express = require('express');
var router = express.Router();

var Task=require('../models/Task');

router.use(function(req,res,next){
  console.log('There is a requesting.');
  next();
});

router.get('/', function(req, res, next) {

  console.log("---tasks get request");
  console.log("req.query:",req.query);
  console.log("req.query.username",req.query.username);
  console.log("req.query.password",req.query.password);

  var selectedpassword=req.query.password;
  Task.find({password:selectedpassword},function(err,tasks){
    if(err){
      return res.status(400).send("err in get /task");
    }else{
      console.log(tasks);
      return res.status(200).json({"status":1});
    }
  })
  //res.send("This is a response to get.");
});

router.post('/', function (req, res,next) {
  var username = req.body.username;
  var password = req.body.password;
  console.log("---tasks post request");
  console.log("req.body:",req.body);
  console.log("req.body.task:",req.body.task);
  console.log("req.body.username",req.body.username);
  console.log("req.body.password",req.body.password);


  Task.create({username:username,password:password},function(err,task){
    if(err){
      return res.status(400).send("err in post /task");
    }else{
      return res.status(200).json(task);
    }
  });
});

module.exports = router;

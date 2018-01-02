var express = require('express');
var router = express.Router();
var User = require('../models/User');
/*
router.use(function(req,res,next){
  console.log('There is a requesting.');
  next();
})
*/
router.post('/',function(req,res,next){
  console.log("---reg")
  console.log("req.body:",req.body);
  console.log("req.body.username:",req.body.username);
  console.log("req.body.password:",req.body.password);
  console.log("req.body.password0:",req.body.password0);
  console.log("req.body.email:",req.body.email);
  var username = req.body.username;
  var password = req.body.password;
  var password0 = req.body.password0;
  var email = req.body.email;

  var usernameavailable=false;
  var emailavailable=false;
  if(password!=password0){
    return res.send("password error");
  }

  User.find({username:username},function(err,user){
    if(err){
      return res.status(400).send("err in get /user");
    }

    if(user.length){
      return res.send("user exist");
    }
    usernameavailable=true;
    if(usernameavailable){
      console.log("-------------");
      User.find({email:email},function(err,user){
        if(err){
          return res.status(400).send("err in find /user");
        }
        if(user.length){
          return res.send("email used");
        }
        emailavailable=true;
        if(emailavailable){
          User.create({username:username,password:password,email:email},function(err,user){
            if(err){
              return res.status(400).send("err in post /task");
            }else{
              return res.send("success");
            }
          })
        }
      })
    }
  })



});

module.exports=router;

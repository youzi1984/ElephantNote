var express = require('express');
var router = express.Router();

var User=require('../models/User');
/*
router.use(function(req,res,next){
  console.log('There is a requesting.');
  next();
})
*/
router.get('/',function(req,res,next){
  console.log("---login");
  console.log("req.query:",req.query);
  console.log("req.query.username",req.query.username);
  console.log("req.query.password",req.query.password);

  var selectedusername=req.query.username;
  var selectedpassword=req.query.password;
  User.find({username:selectedusername},function(err,user){
    if(err){
      return res.status(400).send("err in get /user");
    }
    if(!user.length){
      return res.send("user not exist");
    }
    if(user[0].password!=selectedpassword){
      return res.send("wrong password");
    }
    console.log("user.email:",user[0].email);
    return res.send(user[0].email);
  })
});

module.exports=router;

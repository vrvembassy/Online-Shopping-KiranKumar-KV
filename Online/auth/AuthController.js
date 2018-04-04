var express = require('express');
var router = express.Router();
var bodyParser = require('body-parser');

var VerifyToken = require('./VerifyToken');

router.use(bodyParser.urlencoded({ extended: false }));
router.use(bodyParser.json());
var db=require('../db/auth_db')

/**
 * Configure JWT
 */
var jwt = require('jsonwebtoken'); // used to create, sign, and verify tokens
var bcrypt = require('bcryptjs');
var config = require('../config'); // get config file

router.post('/login', function(req, res) {
 let email = req.body.email;
 let password = req.body.password;
  db.findOne(email, function (err, resp) {
    if (err) return res.status(500).send('Error on the server.');
    if (!resp) return res.status(404).send('No user found.');
    // check if the password is valid
    var passwordIsValid = bcrypt.compareSync(req.body.password, resp.password);
 
    if (!passwordIsValid) return res.status(401).send({ auth: false, token: null });

    // if user is found and password is valid
    // create a token
    var token = jwt.sign({ id: resp.username }, config.secret, {
      expiresIn: 86400 // expires in 24 hours
    });
    console.log(token);
    // return the information including token as JSON
    res.status(200).send({ auth: true, token: token });
  });

});

router.get('/logout', function(req, res) {
  res.status(200).send({ auth: false, token: null });
});

router.post('/register', function(req, res) {
  var hashedPassword = bcrypt.hashSync(req.body.password, 8);

  db.createNew({
    name : req.body.username,
    email : req.body.email,
    password : hashedPassword
  },  
  function (err, resp) {
    if (err) return res.status(500).send("There was a problem registering the user`.");

    // if user is registered without errors
    // create a token
    var token = jwt.sign({ id: req.body.name }, config.secret, {
      expiresIn: 86400 // expires in 24 hours
    });

    res.status(200).send({ auth: true, token: token });
  });

});

router.get('/me', VerifyToken, function(req, res, next) {
console.log(req.userId);
  db.findById(req.userId, function (err, resp) {
    if (err) return res.status(500).send("There was a problem finding the user.");
    if (!resp) return res.status(404).send("No user found.");
    console.log(resp);
    res.status(200).send({status:"User Found"});
  });
});

module.exports = router;

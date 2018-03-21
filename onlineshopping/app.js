var express = require('express');
var app = express();
var db = require('./db');

var product = require('./products/product');
app.use('/admin', product,(req,res,next)=>{
    res.status(200).send("Success");
});

module.exports = app;

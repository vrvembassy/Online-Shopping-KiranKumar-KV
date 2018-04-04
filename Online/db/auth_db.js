var pg = require('pg');
//conect to postgres 
let connectionParams = {
    host: "localhost",
    port: 5432,
    user: "postgres",
    password: "root",
    database: "online"
  }
  const con = new pg.Client(connectionParams);

  module.exports.createUser = function(name, email, password)
  {
    //console.log(username);
    con.connect();
    query1 = "Insert Into tbl_user(username, email, password) values(' "+name + "','" + email + "','"+ password + "')";
    return con.query(new pg.Query(query1));
  }


  module.exports.findOne = function(email, cb){
    con.connect();
    let query2 ="SELECT username,password from tbl_user Where email=$1";
   con.query(query2, [email], (err,res)=>{

    if(err){
      if(cb) cb(err,null);
      return;
    }
     //console.log(err ? err.stack : res.rows)
     console.log(res.rows[0]);
     if(cb) cb(null, res.rows[0]);
     con.end()
   }
 
  );
  }

  module.exports.findById = function(username, cb){
    console.log('findById.username=',username);
    let query3 = "select * from tbl_user where username=$1"
    con.connect()
    con.query(query3,[username],(err,res)=>{
      if(err){
        if(cb) cb(err,null);
        return;
      }
      else{
        console.log(res.rows[0]);
        if(cb) cb(null,res.rows[0]);
        con.end();     
      }
    })
  }

  module.exports.createNew = function({name,email,password},cb){
    let query4 = "insert into tbl_user (username,email,password) values (' "+name + "','" + email + "','"+ password + "')";
    con.connect();
    con.query(query4,(err,res)=>{
      if(err){
        if(cb) cb(err,null);
        return;
      }
      else{
        if(cb) cb(null,"success");
        con.end();
      }
    })


  } 

  

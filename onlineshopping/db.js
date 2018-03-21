var pg = require('pg');
//conect to postgres 
let connectionParams = {
    host: "localhost",
    port: 5432,
    user: "postgres",
    password: "root",
    database: "onlineshopping"
  }


  //add products
module.exports.addProducts = function(title,price,desc,sku,cb){
    const con = new pg.Client(connectionParams);
      con.connect();
      query = "insert into products(title,price,description,sku) values ('"+title+"','"+price+"','"+desc+"','"+sku+"') returning id as retid";
      con.query(query,(err,res)=>{
          if(err){
              if(cb) cb(err,null);
              return;
          }
   
              if (cb)
                cb(null,res.rows[0].retid);
          
      });   
  }

  //access products
module.exports.FetchProducts = function(cb)
 {
    const con = new pg.Client(connectionParams);
    con.connect();
    query2 = "SELECT title,price,description,sku FROM products";
    con.query(query2,(err,res)=>{
        if(err){
            if(cb) cb(err,null);
            return;
        }

        if(cb) cb(null,res);
        con.end();
    });
  }

  //access product by using id
module.exports.FetchById = function(id,cb){
    const con = new pg.Client(connectionParams);
    con.connect();
    query3 = "SELECT id,title,price,description,sku FROM products where id=$1"
    con.query(query3,[id],(err,res)=>{
        if(err){
            if(cb) cb(err,null);
            return;
        }
        if(cb) cb(null,res.rows[0]);
        con.end();       
    });
}

//modify products
module.exports.ModifyProducts = function(title,price,description,sku,id,cb) {
    const con = new pg.Client(connectionParams);
    con.connect();
    query4 = "UPDATE products SET title=$1,price=$2,description=$3,sku=$4 where id=$5";
    con.query(query4,[title,price,description,sku,id],(err,res)=>{
        if(err){
            if(cb) cb(err,null);
            return;
        }
            if(cb) cb(null,res);
            con.end();
    });
}

//delete products
module.exports.deleteProduct = function(id,cb){
    const con = new pg.Client(connectionParams);
    con.connect();
    query5 = "DELETE from products where id=$1";
    con.query(query5,[id],(err,res)=>{
        if(err){
            if(cb) cb(err,null);
            return;
        }
        if(cb) cb(null,res);
        con.end();
    });
}
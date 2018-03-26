var pg = require('pg');
//conect to postgres 
let connectionParams = {
    host: "localhost",
    port: 5432,
    user: "postgres",
    password: "root",
    database: "online"
}

//insert orders details
module.exports.addOrders = function(cid,pstat,ostat,cb){
    const con = new pg.Client(connectionParams);
    con.connect();
    query1 = "INSERT INTO orders(chkoutid, pstatus, ostatus) values($1, $2, $3) returning orderid";
    con.query(query1,[cid,pstat,ostat],(err,resp)=>{
        if(err){
            if(cb) cb(err,null);
            con.end();
            return;
        }
        if(cb) cb(null, resp.rows[0].orderid);
        con.end();
    });
}

//fetch order details
module.exports.getOrder = function(id){
    const con = new pg.Client(connectionParams);
    con.connect();
    query2 = "SELECT * FROM orders WHERE orderid=$1";
    con.query(query2,[id],(err,resp)=>{
        if(err){
            if(cb) cb(err,null);
            con.end();
            return;
        }
        if(cb) cb(null,resp.rows[0]);
        con.end();
    });
}

//update order details
module.exports.modifyOrder = function(cid, pstat, ostat, id, cb){
    const con = new pg.Client(connectionParams);
    con.connect();
    query3 = "UPDATE orders set chkoutid=$1, pstatus=$2, ostatus=$3 WHERE orderid=$4";
    con.query(query3,[cid,pstat,ostat,id],(err,resp)=>{
        if(err){
            if(cb) cb(err,null);
            con.end();  
            return;
        }
        if(cb) cb(null,resp);
        con.end();
    })
}

//delete order details
module.exports.deleteOrder = function(id){
    const con = new pg.Client(connectionParams);
    con.connect();
    query4 = "DELETE FROM orders WHERE id=$1";
    con.query(query4,[id],(err,resp)=>{
        if(err){
            if(cb) cb(err,null);
            con.end();  
            return;
        }
        if(cb) cb(null,resp);
        con.end();
    })
}
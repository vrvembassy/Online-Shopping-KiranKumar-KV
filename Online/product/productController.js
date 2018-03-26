var express = require('express');
var router = express.Router();
var bodyParser = require('body-parser');

router.use(bodyParser.urlencoded({ extended: false }));
router.use(bodyParser.json());

//product database
var db = require('../db/product_db');

//add the products
router.post('/addProduct',(req,res)=>{
    let name = req.body.name;
    let price = req.body.price; 
    let desc = req.body.description;
    let sku = req.body.sku;
    db.addProducts(name,price,desc,sku,(err,resp)=>{
        if(err) return res.status(500).send('Error on the server');
        if(!resp) return res.status(404).send('No Items added');
        res.status(200).send({productid:resp,status:"success"});
    });
});

//get all the products
router.get('/viewproducts',(req,res)=>{
    db.FetchProducts((err,resp)=>{
        if(err) return res.status(500).send('Error on the server.');
        if(!resp) return res.status(404).send('No Item to display');
        res.status(200).send({products:resp.rows})
    });
})

//get products by using id
router.get('/viewproducts/:id',(req,res)=>{
    let id = req.params.id;
    db.FetchById(req.params.id,(err,resp)=>{
        if(err) return res.status(500).send('Error on the server');
        if(!resp) return res.status(404).send('No Items for perticular id');
        res.status(200).send({title:resp.title,price:resp.price,description:resp.description,sku:resp.sku});
    });
});

//Modify product
router.get('/modify/:id',(req,res)=>{
    let id = req.params.id;
    db.FetchById(id,(err,resp)=>{
        if(err) return res.status(500).send('Error on the server');
        if(!resp) return res.status(404).send('No Items for perticular id');
        res.status(200).send({id:resp.id,title:resp.title,price:resp.price,description:resp.description,sku:resp.sku});
        router.put('/modify/'+resp.id,(req1,res1)=>{
            let title = req1.body.title;
            let price = req1.body.price;
            let description = req1.body.description; 
            let sku = req1.body.sku;
            db.ModifyProducts(title,price,description,sku,resp.id,(err1,resp1)=>{
                if(err1) return res1.status(500).send('Error on the server');
                if(!resp1) return res1.status(404).send('Oops... Update failed!');
                res1.status(200).send({status:"success"});    
            })
        })
    })
})


//delete product 
router.delete('/delete/:id',(req,res)=>{
    let id = req.params.id;
    db.deleteProduct(id,(err,resp)=>{
        if(err) return res.status(500).send('Error on the server');
        if(!resp) return res.status(404).send('No Items to delete');
        res.status(200).send({status:"Deleted successfully"});  
    });
});

module.exports = router;

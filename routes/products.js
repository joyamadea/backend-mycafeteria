const express = require('express');
const connection = require('../connection');
const lodash = require('lodash');
const router = express.Router();

router.get('/',(req,res) => {
    query = "SELECT * FROM products";
    connection.query(query, (err, result) => {
        if (!err) {
            res.status(200).json({ status: true, "data": result});
        } else {
            return res.status(500).json(err);
        }
    })
})

router.get('/:id', (req,res) => {
    const id = req.params.id;
    query = "SELECT * FROM products WHERE categoryID = ?";
    connection.query(query, [id], (err, result) => {
        if (!err) {
            res.status(200).json({ status: true, "data": result});
        } else {
            return res.status(500).json(err);
        }
    })
})

router.get('/detail/:id', (req,res) => {
    const id = req.params.id;
    query = "SELECT p.productID, p.name, p.stock, p.price, p.description, p.imageURL, c.name AS category FROM products AS p INNER JOIN category AS c ON p.categoryID=c.categoryID WHERE p.productID = ?                                                                                      ";
    connection.query(query, [id], (err, result) => {
        if (!err) {
            if (result.length > 0) {
                res.status(200).json({ status: true, "data": result[0]});
            } else {
                res.status(404).json({ message: "No product found"});
            }
            
        } else {
            return res.status(500).json(err);
        }
    })
})


module.exports = router;
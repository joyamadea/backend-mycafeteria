const express = require('express');
const connection = require('../connection');
const router = express.Router();

router.post('/add',(req,res) => {
    let body = req.body;
    query = `
    INSERT INTO order (customerID, status) VALUES (?, "IN PROGRESS");
    `;
    connection.query(query, [body.userID, body.productID, body.quantity], (err, result) => {
        if (!err) {
            res.status(200).json({ message: "Added successfully to cart "});
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

module.exports = router;
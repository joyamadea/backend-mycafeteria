const express = require('express');
const connection = require('../connection');
const lodash = require('lodash');
const router = express.Router();

router.get('/',(req,res) => {
    query = "SELECT * FROM category";
    connection.query(query, (err, result) => {
        if (!err) {
            res.status(200).json({ status: true, "data": result});
        } else {
            return res.status(500).json(err);
        }
    })
})

module.exports = router;
const express = require('express');
const connection = require('../connection');
const lodash = require('lodash');
const router = express.Router();

// router.get('/',(req,res) => {
//     connection.getConnection()
//     .then(() => {
//         var result = connection.query("SELECT * FROM products");
//         return result;
//         }).then((result) => {
//             console.log(res.status(200).json({ status: true, "data": result}));
//         }).catch((error) => {
//         console.log(error.message);
//     })
// })

// router.get('/:id', (req,res) => {
//     connection.getConnection()
//     .then(() => {
//         const id = req.params.id;
//         var query = "SELECT * FROM products WHERE categoryID = ?";
//         var result = connection.query(query);
//         return result;
//     }).then((result) => {
//         res.status(200).json({ status: true, "data": result})
//     })
// })

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

// router.get('/', async function(req,res) {
//     res.status(200).send({id:1});
//     try {
//         const query = "SELECT * FROM products";
//         const rows = await connection.query(query);
//         res.status(200).json(rows);
//     } catch (err) {
//         res.status(400).send(err.message);
//     }
// });

router.get('/',(req,res,next) => {
    connection.then(connection => {
        console.log('working');
    }).then((result) => {
        res.status(200).json({ status: true, "data": "true"});
    }).catch(error => {
        console.log(error.message);
    })
})

module.exports = router;
const express = require("express");
var cors = require('cors');
const connection = require('./connection');
const productRoute = require('./routes/products');
// const mariadb = require("mariadb");
// const lodash = require("lodash");
// const { request, response } = require("express");

var app = express();
app.use(cors);
app.use(express.urlencoded({ extended: true}));
app.use(express.json());

// app.get('/', (request,response) => {
//     response.status(200).json({name: 'joy'});
// })

app.use('/products', productRoute);

// app.get("/", (request, response) => {
//     connection.then(connection => {
//         var result = connection.query("SELECT * FROM products");
//         console.log("res", result);
//         lodash.difference(result['meta']);
//         return result;
//     }).then((result) => {
//         response.status(200).json({ status: true, "data": result});
//     }).catch(error => {
//         console.log(error.message);
//     })
// })

module.exports = app;

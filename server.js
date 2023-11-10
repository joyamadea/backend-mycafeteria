// 
const express = require('express');
var cors = require('cors');

const PORT = process.env.PORT || '8080';

const app = express();
app.use(cors());
app.use(express.json());
app.use(express.urlencoded({ extended: true}));

const productRouter = require('./routes/products');
const categoryRouter = require('./routes/categories');
const cartRouter = require('./routes/cart');

app.use('/products', productRouter);
app.use('/categories', categoryRouter);
app.use('/cart', cartRouter);

app.listen(PORT, () => {
    console.log(`Listening for requests on port ${PORT}`);
})
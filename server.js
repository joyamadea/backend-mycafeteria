// 
const express = require('express');
var cors = require('cors');

const PORT = process.env.PORT || '8080';

const app = express();
app.use(cors());
app.use(express.json());
app.use(express.urlencoded({ extended: true}));

app.get('/', (request, response) => {
    response.status(200).json({name: "joy a"});
})

const productRouter = require('./routes/products');
const categoryRouter = require('./routes/categories');

app.use('/products', productRouter);
app.use('/categories', categoryRouter);

app.listen(PORT, () => {
    console.log(`Listening for requests on port ${PORT}`);
})
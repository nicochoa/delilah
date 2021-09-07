const express = require('express');
const app = express();
const port = '4000';
const productRoutes = require('./src/routes/products');
const userRoutes = require('./src/routes/users');
const orderRoutes = require('./src/routes/orders');
const jwt = require('jsonwebtoken');
const expressJwt = require('express-jwt');
require('dotenv').config({path: "./.env"});
const claveJwt = process.env.CLAVEJWT

app.use(express.json());
app.use(expressJwt({ secret: claveJwt, algorithms: ['HS256']}).unless({ path: ["/users/login" , "/users/register"]}))

app.use('/products', productRoutes);
app.use('/order', orderRoutes);
app.use('/users', userRoutes);


app.use((err, req, res, next) => {
    if (!err) {
        return next();
    }
    console.log(JSON.stringify(err));
    return res.status(500)
        .json("Se ha producido un error inesperado.");
});

app.listen(port , () => console.log(`Se ha iniciado en el puerto ${port}`))
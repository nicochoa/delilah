const sequelize = require('../controllers/index');
const { 
    findAllProductos ,
    findProductsName , 
    addingProduct ,
    changingProduct , 
    deleteProduct
  } = require('../models/products.js');
//funciones con los querys

module.exports = {
    respondAllProducts: async(req,res) => {
        /*USERS AND ADMINS SHOULD BE ABLE TO SEE 
        ALL PRODUCTS */
        let results = await findAllProductos();
        if (!results[0]) {
            res.status(200).send("en el momento no hay inventario");
        } else {
            response = {
                error: false,
                codigo: 200,
                mensaje: 'estos son todos los productos',
                result: results
            }
            res.send(response);
        }
    },
    productsByName: async(req,res) => {
        /*USERS AND ADMINS SHOULD BE ABLE TO SEE 
        ALL PRODUCTS */
        let { search } = req.params
        console.log(search);
        let results = await findProductsName(search);
        console.log(results);
        if (!results[0]) {
            res.status(200).send("en el momento no hay inventario");
        } else {
            response = {
                error: false,
                codigo: 200,
                mensaje: 'estos son todos los productos',
                result: results
            }
            res.send(response);
        }
    },
    addingProduct: async (req, res) => {
        let result = await addingProduct(req);
        if (typeof result == "string" ) {
            res.status(406).send(result);
        } else {
            response = {
                error: false,
                    codigo: 200,
                    mensaje: 'se añadio un producto',
                    result: req.body.dishName
            }
            res.send(response)
        }
    },
    changingProduct: async(req, res) => {
        let result = await changingProduct(req);
        if (typeof result =="string") {
            res.status(406).send(result);
        } else {
            response = {
                error: false,
                codigo: 200,
                mensaje: 'se ha modificado el articulo',
                result: req.body.dishName
            }
            res.send(response);
        }
    },
    deleteProduct: async (req, res) => {
        let result = await deleteProduct(req);
        if (typeof result =="string") {
            res.status(406).send(result);
        } else {
            response = {
                error: false,
                codigo: 200,
                mensaje: 'se ha eliminado el articulo',
                result: req.body.dishName
            }
            res.send(response);
        }
    }
}
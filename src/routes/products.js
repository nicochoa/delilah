const express = require('express');
const router = express.Router();
const { 
    respondAllProducts,
    productsByName,
    addingProduct,
    changingProduct,
    deleteProduct
} = require('../controllers/products');

// rutas de get post y demas desde  products 
router.get('/all', respondAllProducts);
router.get('/:search', productsByName);
router.post('/', addingProduct);
router.put('/', changingProduct);
router.delete('/', deleteProduct);




module.exports = router;
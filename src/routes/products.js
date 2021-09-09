const express = require('express');
const router = express.Router();
const { 
    respondAllProducts,
    productsByName,
    addingProduct,
    changingProduct,
    deleteProduct
} = require('../controllers/products');

const {
    validateUserRole
} = require('../middlewares/index.js')

// rutas de get post y demas desde  products 
router.get('/all', respondAllProducts);
router.get('/:search', productsByName);
router.post('/', validateUserRole, addingProduct);
router.put('/', validateUserRole, changingProduct);
router.delete('/', validateUserRole, deleteProduct);




module.exports = router;
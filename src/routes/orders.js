const express = require('express');
const router = express.Router();
const { 
    respondAllOrders,
    respondOrderNumber,
    addingOrder,
    changingOrder,
    deleteOrder
} = require('../controllers/orders');

const {
    validateUserRole
} = require('../middlewares/index.js')

// rutas de get post y demas desde  orders 

router.get('/all', validateUserRole, respondAllOrders);
router.get('/:ordernumber', respondOrderNumber);
router.post('/', addingOrder);
router.put('/', changingOrder);
router.delete('/', deleteOrder);


module.exports = router;
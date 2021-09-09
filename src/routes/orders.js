const express = require('express');
const router = express.Router();
const { 
    respondAllOrders,
    respondOrderNumber,
    addingOrder,
    changingOrder,
    changingStatus,
    deleteOrder
} = require('../controllers/orders');

const {
    validateUserRole
} = require('../middlewares/index.js')

// rutas de get post y demas desde  orders 

router.get('/all', validateUserRole, respondAllOrders);
router.get('/:ordernumber', respondOrderNumber);
router.post('/', addingOrder);
router.put('/',validateUserRole, changingOrder);
router.put('/estado', validateUserRole, changingStatus);
router.delete('/',validateUserRole, deleteOrder);


module.exports = router;
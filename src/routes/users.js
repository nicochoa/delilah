const { response } = require('express');
const express = require('express');
const router = express.Router();
const { 
    respondAllUsers,
    respondUserInfo,
    addingUser,
    changingUser,
    deleteUser
} = require('../controllers/user.js');

const {
    validateUserInfo, 
    validateUserRole, 
    validateToRegister
} = require('../middlewares/index.js');

// rutas de get post y demas desde  users 

router.get('/allusers', validateUserRole, validateUserInfo, respondAllUsers);
router.post('/login',validateUserInfo, respondUserInfo);
router.post('/register', validateToRegister, addingUser);
router.put('/', validateUserInfo, changingUser);
router.delete('/', validateUserInfo, deleteUser);


module.exports = router;
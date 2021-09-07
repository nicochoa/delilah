const sequelize = require('../controllers/index');
const jwt = require('jsonwebtoken');
const { findUser, addUser , findAllUsers , updateUser , deleteUser} = require('../models/user.js');
const claveJwt = process.env.CLAVEJWT;
//HANDLERS DE LOS ENDPOINTS 
let response = {
    error: false,
    codigo: 200,
    mensaje: ''
};
module.exports = {
    respondAllUsers: async(req,res) => {
        // ONLY ADMINS CAN RETRIVE THIS INFO  
        let user = await findUser(req.body.email);
        console.log(user)
        if (user.role == "user") {
            res.status(400).send('you are not authorized')
        }else {
            let results = await findAllUsers();
            // let results = "findAllUsers()";
            response = {
                error: false,
                codigo: 200,
                mensaje: 'estos son todos los usuarios',
                result: results
            }
            res.send(response);
        }
    },
    respondUserInfo:  async(req, res) => {
        // EACH USER CAN ONLY SEE ITS INFO 
        console.log("llegamosa user info ");
        let user = await findUser(req.body.email);
        if (!user[0]) {
            res.status(400).send('you are not authorized')
        } else {
            console.log(user);
            let token = jwt.sign({
                user: user.email
            }, claveJwt);
            
            console.log({user, token});
            response = {
                error: false,
                codigo: 200,
                mensaje: 'info del usuario',
                result: {
                    userName: user[0].userName,
                    name: user[0].name,
                    lastname: user[0].lastname,
                    email: user[0].email,
                    phone: user[0].phone,
                    address: user[0].address,
                    role: user[0].role
                }
            }
            res.status(200).send({response, token})
        }
    },
    addingUser: async (req, res) => {
        /*ONLY USERS CAN BE REGISTER , ITS EXPETED ADMIN´S DATA TO BE ADDED 
        DIRECTLY TO D.B., SO IT ENSURES SAFETY */
        let user = await findUser(req.body.email)
        if (user[0]) {
            res.status(400).send('el usuario ya existe')
        } else {
            console.log(req.body);
            let newUser = await addUser(req);
            response = {
                error: false,
                codigo: 200,
                mensaje: 'se añadio el usuario'
            }
            res.status(200).send(response);
        }
    },
    changingUser: async(req, res) => {
        //EACH USER SHOULD ONLY BE ABLE TO CHANGE ITS OWN INFO NOT OTHERS
        let user = await findUser(req.body.email)
        if (!user[0]) {
            res.status(400).send('NO se modifico el usuario')
        } else {
            console.log(req.body);
            let newUser = await updateUser(req);
            console.log(newUser);
            response = {
                error: false,
                codigo: 200,
                mensaje: 'se modifico el usuario'
            }
            res.status(200).send(response);
        }
    },
    deleteUser: async (req, res) => {
        //EACH USER CAN ONLY REMOVES ITS INFO 
        let user = await findUser(req.body.email)
        if (!user[0] || req.body.delConfirm == "no") {
            res.status(400).send('NO se ELIMINO el usuario')
        } else {
            console.log(req.body);
            let deletedUser = await deleteUser(req);
            console.log(deletedUser);
            response = {
                error: false,
                codigo: 200,
                mensaje: `se elimino el usuario ${req.body.email}`
            }
            res.status(200).send(response);
        }
    }
}
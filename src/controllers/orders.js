const sequelize = require('../controllers/index');
const {
    findAllOrders,
    findOrderNumber,
    addingOrder,
    changingOrder,
    changingStatus,
    deleteOrder
} = require('../models/orders.js')

//funciones con los querys

module.exports = {
    respondAllOrders: async (req,res) => {
        // SOLO ADMIN PUEDE ACCEDER ACA
        let results = await findAllOrders();
        if (!results[0]) {
            res.status(404).send("en el momento no hay ordenes")
        } else {
            response = {
                error: false,
                codigo: 200,
                mensaje: 'estas son todas ordenes',
                result: results
            }
            res.send(response);
        }
    }, 
    respondOrderNumber: async (req, res) => {
        let results = await findOrderNumber(req);
        if (!results[0]) {
            res.status(404).send("en el momento no hay ordenes")
        } else {
            response = {
                error: false,
                codigo: 200,
                mensaje: 'esta es su orden',
                result: results
            }
            res.send(response);
        }
    },
    addingOrder: async (req, res) => {
        let results = await addingOrder(req);
        if (!results || results.length == 0) {
            res.status(406).send("no se creo la orden 😱")
        } else {
            response = {
                error: false,
                codigo: 200,
                mensaje: 'se creo su orden',
                result: results
            }
            res.send(response);
        }
    },
    changingOrder: async(req, res) => {
        //SOLO LAS QUE EL USUARIO CREO
        let results = await changingOrder(req);
        if (!results || results.length == 0) {
            res.status(406).send("no se modifico la orden 🤯")
        } else {
            response = {
                error: false,
                codigo: 200,
                mensaje: 'se modifico su orden',
                result: results
            }
            res.send(response);
        }
    },
    changingStatus: async(req, res) => {
        //SOLO LAS QUE EL USUARIO CREO
        let results = await changingStatus(req);
        if (!results || results.length == 0) {
            res.status(406).send("no se modifico la orden 🤯")
        } else {
            response = {
                error: false,
                codigo: 200,
                mensaje: 'se modifico su orden',
                result: results
            }
            res.send(response);
        }
    },
    deleteOrder: async(req, res) => {
        //SOLO LAS QUE EL USUARIO CREO
        let results = await deleteOrder(req);
        if (!results || results.length == 0 || results[1].length == 0) {
            res.status(404).send("no se elimino ninguna orden 😵")
        } else {
            response = {
                error: false,
                codigo: 200,
                mensaje: 'se elimino su orden',
                result: results
            }
            res.send(response);
        }
    }
}
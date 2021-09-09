const sequelize = require('../controllers/index');

async function findAllOrders(req){
    let orders = await sequelize.query(
        'SELECT orders.state AS ESTADO , orders.orderTime AS HORA, orders.orderNumber AS NUMERO, GROUP_CONCAT(CONCAT (productsPerOrders.amount, :space , products.dishName)) AS DESCRIPCION, orders.paymentMethod AS TIPO_PAGO, SUM(productsPerOrders.amount * products.price) AS TOTAL , users.userName AS USUARIO, users.address AS DIRECCION  FROM `orders` INNER JOIN `productsPerOrders` ON orders.orderNumber = productsPerOrders.orderNumber INNER JOIN `products` ON productsPerOrders.idProduct = products.id INNER JOIN `users` ON orders.idUser = users.id GROUP BY orders.orderNumber;',
        {
            replacements: { 
                space: ' - '
            },
            type:"SELECT"
        }
    );
    return orders;
}
async function findOrderNumber(req){
    let order = await sequelize.query(
        'SELECT orders.state AS ESTADO , orders.orderTime AS HORA, orders.orderNumber AS NUMERO, GROUP_CONCAT(CONCAT (productsPerOrders.amount, :space , products.dishName)) AS DESCRIPCION, orders.paymentMethod AS TIPO_PAGO, SUM(productsPerOrders.amount * products.price) AS TOTAL , users.userName AS USUARIO, users.address AS DIRECCION  FROM `orders` INNER JOIN `productsPerOrders` ON orders.orderNumber = productsPerOrders.orderNumber INNER JOIN `products` ON productsPerOrders.idProduct = products.id INNER JOIN `users` ON orders.idUser = users.id WHERE orders.orderNumber = :order ;',
        {
            replacements: { 
                order: req.params.ordernumber,
                space: ' - '
            },
            type:"SELECT"
        }
    );
    return order;
}
async function addingOrder(req){
    /*
    -primero crear la orden en la tabla de ordenes
    */
    let newOrder = await sequelize.query(
        'INSERT INTO `orders`(`state`, `orderTime`, `idUser`, `paymentMethod`) VALUES (:state , :time , :idUser , :payment )',
        {
            replacements: { 
                state: 'nuevo',
                time: req.body.time,
                idUser: req.body.idUser,
                payment: req.body.payment
            },
            type:"INSERT"
        }
    );
    // let newOrderProducts;
    req.body.products.forEach( async (element) => {
        let newOrderProducts = await sequelize.query(
            'INSERT INTO `productsPerOrders`( `orderNumber`, `idProduct`, `amount`) VALUES (:orderNumber,:idProduct,:amount)',
            {
                replacements: { 
                    orderNumber: newOrder[0],
                    idProduct: element.proId,
                    amount: element.amount
                },
                type:"INSERT"
            }
        );
    });
    return newOrder;
}       
async function changingOrder(req){
    let toChange = await sequelize.query(
        'SELECT * FROM `orders` WHERE orders.orderNumber = :orderId',
        {
            replacements: { 
                orderId: req.body.orderId
            },
            type:"SELECT"
        }
    );
    if (toChange[0]) {
        let order = await sequelize.query(
            'UPDATE `orders` SET `state`= :state,`idUser`= :userId,`paymentMethod`= :payment WHERE `orderNumber`= :orderId',
            {
                replacements: { 
                    state: req.body.state,
                    orderId: req.body.orderId,
                    userId: req.body.userId,
                    payment: req.body.payment
                },
                type:"UPDATE"
            }
        );
        let freshProd = await sequelize.query(
            'DELETE FROM `productsPerOrders` WHERE productsPerOrders.orderNumber = :orderNumber',
            {
                replacements: { 
                    orderNumber: req.body.orderId,
                },
                type:"DELETE"
            }
        );
        req.body.products.forEach( async (element) => {
            let newOrderProducts = await sequelize.query(
                'INSERT INTO `productsPerOrders`( `orderNumber`, `idProduct`, `amount`) VALUES (:orderNumber,:idProduct,:amount)',
                {
                    replacements: { 
                        orderNumber: req.body.orderId,
                        idProduct: element.proId,
                        amount: element.amount
                    },
                    type:"INSERT"
                }
            );
        });
        return order;
    } else {
        return 'no se modifico la orden';
    }
}

async function changingStatus(req){
    let toChange = await sequelize.query(
        'SELECT * FROM `orders` WHERE orders.orderNumber = :orderId',
        {
            replacements: { 
                orderId: req.body.orderId
            },
            type:"SELECT"
        }
    );
    if (toChange[0]) {
        let order = await sequelize.query(
            'UPDATE `orders` SET `state`= :state WHERE `orderNumber`= :orderId',
            {
                replacements: { 
                    state: req.body.state,
                    orderId: req.body.orderId
                },
                type:"UPDATE"
            }
        );
        return order;
    } else {
        return 'no se modifico la orden';
    }
}

async function deleteOrder(req){
    let toDelete = await sequelize.query(
        'SELECT * FROM `orders` WHERE orders.orderNumber = :orderNumber',
        {
            replacements: { 
                orderNumber: req.body.orderId
            },
            type:"SELECT"
        }
    );
    if (toDelete[0]) {
        let orders = await sequelize.query(
            'DELETE FROM `orders` WHERE `orders.orderNumber` = :orderNumber',
            {
                replacements: { orderNumber: req.body.orderId},
                type:"DELETE"
            }
        );
        let prodPerOrders = await sequelize.query(
            'DELETE FROM `productsPerOrders` WHERE `productsPerOrders.orderNumber` = :orderNumber',
            {
                replacements: { orderNumber: req.body.orderId},
                type:"DELETE"
            }
        );
        return {orders,prodPerOrders};
    } else {
        return ['no se elimino ningun producto',toDelete]
    };
}

module.exports = {
    findAllOrders,
    findOrderNumber,
    addingOrder,
    changingOrder,
    changingStatus,
    deleteOrder
}
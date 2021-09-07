const sequelize = require('../controllers/index');

async function findAllProductos(req){
    let products = await sequelize.query(
        'SELECT * FROM `products`',
        {
            type:"SELECT"
        }
    );
    console.log(products);
    return products;
}

async function findProductsName(req){
    let products = await sequelize.query(
        'SELECT * FROM `products` WHERE products.dishName LIKE :description',
        {
            replacements: { description: `%${req}%`},
            type:"SELECT"
        }
    );
    return products;
}
async function addingProduct(req){
    let toAdd = await sequelize.query(
        'SELECT * FROM `products` WHERE products.dishName = :dishName',
        {
            replacements: { 
                dishName: req.body.dishName
            },
            type:"SELECT"
        }
    );
    if (!toAdd[0]) {
        let newProduct = await sequelize.query(
            'INSERT INTO `products`(`urlImg`, `dishName`, `price`) VALUES (:urlImg, :dishName, :price)',
            {
                replacements: { 
                    urlImg: req.body.urlImg,
                    dishName: req.body.dishName,
                    price: req.body.price
                },
                type:"INSERT"
            }
        );
        return newProduct;
    } else {
        return "el producto ya existe"
    }
}

async function changingProduct(req){
    let toChange = await sequelize.query(
        'SELECT * FROM `products` WHERE products.id = :id',
        {
            replacements: { 
                id: req.body.id
            },
            type:"SELECT"
        }
    );
    if (toChange[0]) {
        let product = await sequelize.query(
            'UPDATE `products` SET `urlImg`= :urlImg ,`dishName`= :dishName,`price`= :price WHERE `id` = :id',
            {
                replacements: { 
                    id: req.body.id,
                    urlImg: req.body.urlImg,
                    dishName: req.body.dishName,
                    price: req.body.price
                },
                type:"UPDATE"
            }
        );
        return product;
    } else {
        return 'no se modifico el producto'
    }
}

async function deleteProduct(req){
    let toDelete = await sequelize.query(
        'SELECT * FROM `products` WHERE products.id = :id',
        {
            replacements: { 
                id: req.body.id
            },
            type:"SELECT"
        }
    );
    if (toDelete[0]) {
        let product = await sequelize.query(
            'DELETE FROM `products` WHERE `id` = :id',
            {
                replacements: { id: req.body.id},
                type:"DELETE"
            }
        );
        return product;
    } else {
        return 'no se elimino ningun producto'
    };
}

module.exports = {
    findAllProductos,
    findProductsName,
    addingProduct,
    changingProduct,
    deleteProduct
}
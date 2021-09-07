const sequelize = require('../controllers/index');

async function findUser(req){
    let user = await sequelize.query(
        'SELECT * FROM `users` WHERE users.email= :email',
        {
            replacements: { email: req},
            type:"SELECT"

        }
    );
    console.log(user);
    return user;
}
async function findAllUsers(){
    let user = await sequelize.query(
        'SELECT `id`,`userName`, `name`, `lastname`, `email`, `phone`, `address`, `role` FROM `users`',
        {
            type:sequelize.QueryTypes.SELECT
        }
    );
    console.log(user);
    return user;
}

async function addUser(req){
    let user = await sequelize.query(
        'INSERT INTO `users` (`userName`,`name` , `lastname`, `email` , `phone`, `address` , `password`, `role`) VALUES (:userName, :name , :lastname, :email , :phone, :address , :password, :role)',
        {
            replacements: { 
                userName: req.body.userName,
                name: req.body.name,
                lastname:req.body.lastname,
                email: req.body.email,
                phone: req.body.phone,
                address: req.body.address,
                password: req.body.password,
                role: 'user'
            },
            type:sequelize.QueryTypes.INSERT
        }
    );
    console.log(user);
    return user;
}

async function updateUser(req){
    let user = await sequelize.query(
        'UPDATE `users` SET `userName`= :userName, `name`= :name,`lastname`= :lastname,`phone`= :phone,`address`= :address,`password`= :password WHERE `email`= :email',
        {
            replacements: { 
                userName: req.body.userName,
                name: req.body.name,
                lastname:req.body.lastname,
                email: req.body.email,
                phone: req.body.phone,
                address: req.body.address,
                password: req.body.password,
                role: 'user'
            },
            type:sequelize.QueryTypes.UPDATE
        }
    );
    console.log(user);
    return user;
}

async function deleteUser(req){
    let user = await sequelize.query(
        'DELETE FROM `users` WHERE `email` = :email',
        {
            replacements: { 
                email: req.body.email
            },
            type:sequelize.QueryTypes.DELETE
        }
    );
    console.log(user);
    return user;
}

module.exports = {
    findUser,
    addUser,
    findAllUsers,
    updateUser,
    deleteUser
}
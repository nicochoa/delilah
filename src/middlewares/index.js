

// module.exports = {
//     validateUserInfo  :  (req, res, next)=>{
//        if (req.email.includes("@") && req.password !== "") {
//             console.log(req.email);
//             console.log(req.password);
//             console.log("info validada");
//             next();
//        } else {
//            res.status(400).send(" the email or password are not valid")
//        }
//     },
//     validateToRegister :  (req, res, next)=>{
//         if (req.email.includes("@") && req.password !== "" && req.name != "" && req.phone != "" && req.address != "") {
//              next();
//         } else {
//             res.status(400).send(" the email or password are not valid")
//         }
//     },
//     validateUserRole : (req,res,next)=>{
//         let { role } = req.body;
//         if(role == "admin"){
//             console.log("rol validado")
//             next();
//         }else {
//             res.status(400).send(" you are not authorized here 😵")
//         }
//     }
// }


function validateUserInfo (req, res, next){
    if (req.body.email.includes("@") &&req.body.email!=="" && req.body.password !== "") {
        console.log(req.body.email);
        console.log(req.body.password);
        console.log("info validada");
        next();
    } else {
        res.status(400).send(" the email or password are not valid")
    }
}
function validateToRegister (req, res, next){
    if (req.body.email.includes("@") && req.body.password !== "" && req.body.name != "" && req.body.phone != "" && req.body.address != "") {
         next();
    } else {
        res.status(400).send(" the email or password are not valid")
    }
}
function validateUserRole (req,res,next){
    let { role } = req.body;
    if(role == "admin"){
        console.log("rol validado")
        next();
    }else {
        res.status(400).send(" you are not authorized here 😵")
    }
}


 module.exports = {
    validateUserInfo,
    validateToRegister,
    validateUserRole
 }
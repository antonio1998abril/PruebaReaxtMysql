const router=require('express').Router()
const loginController=require('../controller/Login')
const afterController=require('../controller/after')
const auth = require('../middleware/auth');

router.get('/convertir', loginController.convert)

router.route('/login')
    .get(loginController.login)
    .post(auth,loginController.postlogin)


module.exports=router
const router=require('express').Router()
const loginController=require('../controller/Login')

router.route('/login')
    .post(loginController.login)
router.route('/get')
    .get(loginController.getdata)
router.route('/update')
    .put(loginController.update)

module.exports=router
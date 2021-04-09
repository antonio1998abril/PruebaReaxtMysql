var dbconn = require('../config/db');
const bcrypt=require('bcrypt');

module.exports={
    getuser : async(req, res) => {
        res.json("coneccted")
    }

}
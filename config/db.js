'use strict';

const mysql=require('mysql');
    const dbconn=mysql.createConnection({
    hostname:'localhost',
    user:'root',
    password:'',
    database:'prueba'

        });
        dbconn.connect(function(err){
            if(err) throw err;
        console.log("Database Connected")
        });

module.exports=dbconn
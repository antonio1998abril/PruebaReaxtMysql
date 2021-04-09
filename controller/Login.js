var dbconn = require('./../config/db');


module.exports = {
    login: async(req, res) => {
            const {nombre, password} = req.body;
            dbconn.query('SELECT * FROM user WHERE nombre = ? AND password = ?',[nombre, password], async function(err,result){
                //mysql retorna un array de objetos pero yo solo busco el match del primero
                const data=JSON.stringify(result)
                const toobject =JSON.parse(data)
                const singleobject=Object.assign({},result)
                const senddata=singleobject[0]

                if(toobject.length === 0){
                    res.json(false)
                }else{
                    res.json(senddata)
                }
            })
        },
    
    getdata: async(req, res) => {
        dbconn.query('SELECT * FROM user', async function (err, result){
          const  newresult =JSON.stringify(result)
           const toObject =JSON.parse(newresult)
            res.json(toObject)
  
        })
    },
    update: async (req, res) => {
        const {nombre,password,_id}=req.body
        const year= new Date();


        console.log('seenvian',req.body)
        dbconn.query('SELECT * FROM user WHERE _id = ?',[_id], async function (err, result){
           const data =JSON.stringify(result)
           const json =JSON.parse(data);

             if(!json[1]){
                 console.log(year)
                dbconn.query('UPDATE user SET nombre = ?, password = ?, modificacion=? WHERE _id = ?',[nombre, password, year, _id],async function(err ,result){
                    res.json(result)
                })
                
            } 
        })
    }


};

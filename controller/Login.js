var dbconn = require('./../config/db');
const bcrypt=require('bcrypt');

module.exports={
    convert : async(req, res) => {
        dbconn.query ('SELECT password FROM user',async function(err,result){
            var data=JSON.stringify(result);
            const json =JSON.parse(data);
            ///cambiar la position del array
            const pass=json[1]
            const passwordHash= await bcrypt.hash(pass.password,10);
         const contra=pass.password
        console.log(contra)    
        console.log(passwordHash)

            dbconn.query('SELECT * FROM user WHERE password= ?',[contra],async(err,get)=>{
                const data=JSON.stringify(get)
                const json=JSON.parse(data)
                value=json[0].id
               console.log('contraseña',value)
                
                     dbconn.query('UPDATE user SET password=? WHERE id=?',[passwordHash,value],async function(err,result){
              
                        return res.json({error:false,result:result})
                    }) 
                 
               
            });
        })
            },
    postlogin:async(req,res)=>{
        try{
            
            var logged={
                user: function(){
                 const {name}=req.body;
                 req.session.loggedin=true;
                 req.session.name=name;
                }
            }   
         logged.user();
         res.json({logged:"true"})
         
         }catch(err){
             return res.status(302).json({msg:err.message})
         }
    },
    login: async(req, res) =>{
            try{
                const session=req.session.name;
                if(session)
                    res.json(session)
                
            }catch(err){
                return res.status(500).json({msg:err.message})
            }
        },
    



};

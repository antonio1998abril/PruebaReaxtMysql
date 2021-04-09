import  { useState,useEffect } from 'react'
import Axios from 'axios'

/* import AdminPost from '../components/mainpages/CreatePost/AdminPost' */

function UserApi() {
    const [isLogged,setIsLogged]=useState(false)
    
    
///Para mandar datos de un componente a otro declaras el dato que ocupas
    const [userid,setuserid]=useState('')
    const [username,setUsername]=useState('')
/* GLOBAL */
const [getlogin,setLogin]=useState({})

    useEffect(() =>{
        const getlogin = async () => {
            const res = await Axios.get('/convertir')
            setLogin(res.data)  
        }
        getlogin()   
    },[])

console.log(getlogin)
/////////localstorage no lo necesito XD
    localStorage.setItem('userid',userid)
    localStorage.setItem('name',username)

    return {
        isLogged:[isLogged,setIsLogged],
        ///lo mandas a donde?, a donde lo quieras mandar en este caso Begin
        userid:[userid,setuserid],
      
    }
  
}

export default UserApi

import axios from 'axios'
import  { useState,useEffect } from 'react'

function UserApi() {
    const [isLogged, setIsLogged]=useState(false)
    const [fieldUser, setFieldUser] = useState([])
    const [callback ,setCallback] = useState(false)

    useEffect(() =>{
        const getlogin = async () => {
           const userlog= localStorage.getItem("islogged")
            if(userlog)
            setIsLogged(true)
        }
        getlogin()   
    },[])

    useEffect(()=>{
        const getData= async() => {
            await axios.get('/get').then((data)=>{
                setFieldUser(data.data)
            })
        }
        getData()
    },[callback])

    return {
        isLogged:[isLogged,setIsLogged],
        fieldUser:[fieldUser, setFieldUser],
        callback:[callback,setCallback]
    }
  
}

export default UserApi

import React ,{ useState } from 'react'
import axios from 'axios'

const initialState = {
    nombre :'', 
    password :''
}

function Login()  {    
    const [user,setUser]=useState(initialState)
    const [errorMessage, setErrorMessage] = useState("");
  
    const errorClick = () => {
        setErrorMessage("Hubo un Error")
    }
    const Closemodal = () => {
        window.location.href="/";
    }

    const onChangeInput = e => {
        const {name, value} = e.target;
        setUser({...user, [name]:value})
    }
    const loginSubmit = async e => {
        e.preventDefault()

        await axios.post('/login',{...user}).then(result =>{
       const data= JSON.stringify(result.data)
       const parse =JSON.parse(data)
       

        if(!result.data === false){
            window.location.href="/";
            localStorage.setItem('islogged',true)
            localStorage.setItem('username',parse.nombre)
           
            
        }else {
            errorClick()
        }
        })
    }
    

    return (
        <>
            <div className="login-form">
                <form onSubmit={loginSubmit}>
                    <h2 className="text-center">LOGIN</h2>
                    <div className = "form-group">
                        <label className = ""> Nombre</label>
                        <input 
                        className = "form-control"
                        type = "text"
                        name = "nombre"
                        value = {user.nombre}
                        autoComplete="on"
                        placeholder = "Ingresa tu nombre" onChange={onChangeInput}/>
                    </div>
                    <div className = "form-group">
                        <label className = "">Password</label>
                        <input
                        className = "form-control" 
                            type = "password" 
                            name = "password" 
                            value={user.password} 
                            autoComplete="on"
                            placeholder="Ingresar Contraseña" onChange={onChangeInput}/>
                    </div>
                    <button type = "submit" className = "btn btn-primary btn-block" >ENTRAR</button>
                </form>
            </div>

            {
                errorMessage && 
                <div className="error"> 
                    <div className="modal-content">
                        <span className="close" onClick={() => Closemodal()}>&times;</span>
                        <div className="text-center">
                            {errorMessage} 
                        </div>
                       
                    </div>
                </div>
            }
        </>
    )
}

export default Login



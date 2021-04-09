import React, {useState}  from 'react'
import {Button, Modal, ModalHeader, ModalBody, ModalFooter, FormGroup, Input ,Label} from 'reactstrap';
import axios from 'axios'



function Modaluser({nombre, password, userid }) {
    
    const initialState = {
        nombre :nombre, 
        password :password,
        _id :userid
    }

    const [ismodal, setmodal] = useState(true)
    const [user,setUser]=useState(initialState)
    

    const cerrarmodal = () => {
        setmodal(false)
        window.location.href="/";
    }

    const onChangeInput = e => {
        const {name, value} = e.target;
        setUser({...user, [name]:value})
    }

    const loginSubmit = async e => {
        e.preventDefault()
      
        await axios.put('/update',{...user}).then(result =>{
            localStorage.removeItem('username')
            localStorage.removeItem('islogged')
            
            window.location.href="/";
        })
    }

    const modalstyle={
        position: "absolute",
        top: "50%",
        left: "50%",
        transform : "Translate(-50%, -50%)"
    }
    return (
        <>
            <Modal isOpen={ismodal} style={modalstyle}>
        <ModalHeader>
            Update
        </ModalHeader>
        <ModalBody>
            <FormGroup>
                <Label for="nombre">Nombre </Label>
                <Input typw="text" name="nombre" defaultValue={nombre}  onChange={onChangeInput}></Input>
            </FormGroup>

            <FormGroup>
                <Label for="contraseña">Password </Label>
                <Input type="password" name="password" defaultValue={password}  onChange={onChangeInput}></Input>
            </FormGroup>
        </ModalBody>
        <ModalFooter>
                <Button  onClick={loginSubmit} type = "submit" color="primary">Aceptar</Button>
                <Button color="scondary" onClick={cerrarmodal}>Cerrar</Button>
        </ModalFooter>
    </Modal>
        </>
        
    )
}

export default Modaluser

import React, {useState} from 'react'
import Upmodal from './Modaluser'
import {Button} from 'reactstrap';

function Items({info}) {
    localStorage.setItem("username",info.nombre)
    const [actual, setactual]=useState(false)

    const Update = () =>{
        setactual(true)
    }
 
    return (
        <tr>
            <td className="text-sm text-center">
            {info.nombre}
            </td>
            <td className="text-sm text-center">
                {info.apertura}
            </td>
            <td className="text-sm text-center">
                {info.modificacion}
            </td>
            <td  className="project-actions text-fixed update">
            
            {/* <Link> <img src={update} alt="update" /></Link> */}
        <Button color="success" onClick={Update}>Update</Button>
            </td>

            {
                actual ? <Upmodal nombre={info.nombre} password={info.password} userid={info._id}/> :null 
            }
        </tr>
    )
}

export default Items

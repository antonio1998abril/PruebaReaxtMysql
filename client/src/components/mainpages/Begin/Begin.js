import React, { useContext } from 'react'
import { Link } from 'react-router-dom'
import { GlobalState } from '../../../GlobalState'

import Items from '../../items/Items'
function Begin() {
    const state = useContext(GlobalState)
    const [items] =state.userAPI.fieldUser

    /* const [callback, setCallback] = state.userAPI.callback */

    const logoutUser = async () => {
        localStorage.removeItem('islogged')
        localStorage.removeItem('username')
        window.location.href="/";
    }
    const name = localStorage.getItem("username")
    return (
        <>
        <div className="container">
        <div className="logoutposition">
        <h6  className="desplazar">{name} </h6>
            <h6 className="desplazar"><Link  to ="/" onClick={logoutUser}>Logout</Link> </h6>
        </div>
            <table className="table table-dark">
                
                    <thead className="thead-">
                        <tr className="text-center">
                            <th>Nombre Completo</th>
                            <th>Creation date</th>
                            <th>Update date</th>
                            <th>Action</th>
                        </tr>
                    </thead>
                        <tbody className="table-hover ">
                        {items.map(info=>{
                            return <Items key={info._id} info={info} />
                            })
                        }    
                        </tbody>          
                </table>
        </div>
        </>
    )
}

export default Begin

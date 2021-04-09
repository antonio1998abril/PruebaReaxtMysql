import React,{useContext} from 'react'
import {Switch,Route}from 'react-router-dom'
import { GlobalState } from '../../GlobalState'
import Begin from './Begin/Begin'
import Login from './auth/Login'
import NotFound from './NotFound/NotFound'

function Pages() {
    const  state= useContext(GlobalState)
    const [isLogged]=state.userAPI.isLogged

    return (
        <div>
            <Switch>
                <Route path="/" exact component={isLogged ? Begin:Login}></Route>
                <Route path="/login" exact component={isLogged ? Begin:Login}></Route>
                <Route path="*" exact component={NotFound}></Route>
            </Switch>
        </div>
    )
}

export default Pages

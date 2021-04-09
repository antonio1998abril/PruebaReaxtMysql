import Axios from 'axios'
import React, {createContext,useState,useEffect} from 'react'
import UserAPI from './api/UserApi'


export const GlobalState = createContext()

export const DataProvider=({children})=>{

    const [GlobalPosts,setGolbalPosts]=useState([]);

/* 
    useEffect(()=>{
        const firstLogin = localStorage.getItem('firstLogin')
        if(firstLogin){
            const refreshToken=async()=>{
                 const ver=await Axios.get('/user/refresh_token')      
                setToken(ver.data.token) 
   
                setTimeout(()=>{
                    refreshToken()
                },15000)
            
            }
            refreshToken()
        }
        else{
            
        }        
    },[]) */

 
    


    const state={
     
        userAPI:UserAPI(),
        //socletio
        post:[GlobalPosts,setGolbalPosts],
     
      
    }
   
    return(
        <GlobalState.Provider value={state}>
        {children}
        </GlobalState.Provider>
    )
}


const express=require('express');
const app=express();

const cors= require('cors')
const session = require('express-session');

const defaultroute=require('./routes/User');
const http =require('http').Server(app)
app.use(express.json())
app.use(express.urlencoded({extended:true}));
app.use(cors());


app.use(session({
    secret: 'secret',
    resave: true,
    saveUninitialized: true
}));

app.use('/',defaultroute)
if(process.env.NODE_ENV === 'production'){
    app.use(express.static('client/build'))
    app.get('*', (req, res) => {
        res.sendFile(path.join(__dirname, 'client', 'build', 'index.html'))
    })
}

//Run server
const PORT = process.env.PORT || 5000
http.listen(PORT, () =>{
    console.log('Server is running on port', PORT)
})
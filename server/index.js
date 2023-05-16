//imports from packages
const express = require("express");
const mongoose = require('mongoose');
//imports from files
const authRouter=require("./routes/auth");

//INIT
const PORT=3000;
const app=express();
const DB="mongodb+srv://Sonia:Sonia1812@cluster0.3dmskt3.mongodb.net/?retryWrites=true&w=majority";

//middleware
app.use(express.json());
app.use(authRouter);

//connections
mongoose
.connect(DB)
.then( ()=>{
    console.log('Connection Successful');
})
.catch((e) =>{
    console.log(e);
});

app.listen(PORT,"0.0.0.0",()=> {
    console.log(`connected at port ${PORT} heloooo`);
    //  console.log('connected at port'+PORT);
});

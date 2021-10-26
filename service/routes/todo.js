const connection = require('../connection.js');
const route = require('express').Router();
const todoMiddleware = require('../middleware/todo.js');
route.post('/',todoMiddleware.nullCheck,todoMiddleware.dateCheck,(req,res)=>{
    try {
        connection.query(`insert into todo values('')`)
    } catch (error) {
        
    }
})

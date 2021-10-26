const mysql = require('mysql2');
require('dotenv').config();

const connection = mysql.createConnection(
    {
        host: process.env.DB_HOST,
        user:process.env.DB_USERNAME,
        password:process.env.DB_PASSWORD,
        database:"todo_flutter"
    }
)

connection.connect((err)=>{
    if(err){
        console.log(err);
        return;
    }
    console.log("Connected to database");
})

module.exports = connection;
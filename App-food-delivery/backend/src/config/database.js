const mysql = require('mysql2/promise');
const logger = require ('../utils/logger');

const pool = mysql.createPool({
        host: process.env.DB_HOST,
        port: process.env.DB_PORT,
        user: process.env.DB_USER,
    password: process.env.DB_PASSWORD,
    database: process.env.DB_NAME,
    waitForConnections: true, 
    connectionLimit: true,
    queueLimit: 10,
    enableKeepAlive: true,
    KeepAliveInitialDelay: 0
});

async function testConnection() {
    try{
        const connection = await pool.getConnection();
        logger.info('Database connection established successfully');
        connection.release();
        return true;
    }catch(error){
        logger.error('failed to connect to database', error);
        throw error;
    }
}
module.exports = { pool, testConnection };
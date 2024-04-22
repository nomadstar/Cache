import pg from 'pg';

// referencia : https://node-postgres.com/features/connecting

const { Client } = pg;

  
const client = new Client({
    user: 'tililin',
    host: '172.0.0.3',
    database: 'minimi',
    password: 'tililin',
    port: '5432'
});
 

module.exports = client;
import pg from 'pg';
const { Client } = pg

const posgresito = new Client({
    user: 'postgrevieja',
    host: 'localhost',
    database: 'minimi',
    password: 'postgrevieja',
    port: 5432

});

module.exports = posgresito;
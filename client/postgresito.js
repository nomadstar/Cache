// referencia : https://node-postgres.com/features/connecting

import pg from 'pg'
const { Client } = pg

  
const client = new Client({
    

})
 
await client.connect()
 
await client.query('SELECT NOW()')
 
await client.end()
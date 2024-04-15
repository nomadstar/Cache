import express from 'express';
import { createClient } from 'redis';
import pg from 'pg';

const { Client } = pg
// remember JSON type -> modules


const cachitos = createClient({ url: 'redis://redis:6379'});
const posgresito = new Client({
    user: 'postgrevieja',
    host: 'localhost',
    database: 'minimi',
    password: 'postgrevieja',
    port: 5432

});

const app = express();

app.get('/', (req, res) => {
  res.send('Hello Mommy!');
});

app.get('/task/:id', async(req, res) => {
  const { id } = req.params;
  try {
    await cachitos.connect();
    const task = cachitos.get(`task:${id}`);
    await cachitos.disconnect();    
    if(task) return res.send({origin:'cache',data: JSON.parse(task)});
    await posgresito.connect();
    const { rows } = await posgresito.query(`SELECT * FROM tasks WHERE id = ${id}`);
    await posgresito.end();
    if(rows.length === 0) return res.send('Mommy, no encontré la tarea 😭');
    res.send('I ❤️ U!');

  } catch (error) {
   res.send(error); 
  }
});

app.listen(3000, () => {
  console.log('Time to make your super vieja proud!');
});
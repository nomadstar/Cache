import express from 'express';
import posgresito from './postgresito.js';
import cluster from './redis.js';


const app = express();

try {
  app.get('/', async(req, res) => {
    res.send('Hello Mommy!');
    try {
      await posgresito.connect();
      res.send('Hay un elefante!');
    } catch (error) {
      res.send(error);
    }
    try {
      await cluster.connect();
      res.send('Hay un rojo!');
    } catch (error) {
      res.send(error);
    }
  });  
} catch (error) {
  res.send(error);
}




app.listen(3000, () => {
  console.log('Time to make your super vieja proud!');
});
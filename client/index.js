
var grpc = require('@grpc/grpc-js');

import express from 'express';

const app = express();


var database = require('./database_grpc_pb');
var redis = require('./redis_grpc_pb');




app.listen(3000, () => {
  console.log('Time to make your super vieja proud!');
});
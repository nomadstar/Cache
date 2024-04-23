// GENERATED CODE -- DO NOT EDIT!

'use strict';
var grpc = require('grpc');
var reddis_pb = require('./reddis_pb.js');

function serialize_redis_RedisRequest(arg) {
  if (!(arg instanceof reddis_pb.RedisRequest)) {
    throw new Error('Expected argument of type redis.RedisRequest');
  }
  return Buffer.from(arg.serializeBinary());
}

function deserialize_redis_RedisRequest(buffer_arg) {
  return reddis_pb.RedisRequest.deserializeBinary(new Uint8Array(buffer_arg));
}

function serialize_redis_RedisResponse(arg) {
  if (!(arg instanceof reddis_pb.RedisResponse)) {
    throw new Error('Expected argument of type redis.RedisResponse');
  }
  return Buffer.from(arg.serializeBinary());
}

function deserialize_redis_RedisResponse(buffer_arg) {
  return reddis_pb.RedisResponse.deserializeBinary(new Uint8Array(buffer_arg));
}


// Servicio gRPC para interactuar con Redis
var RedisServiceService = exports.RedisServiceService = {
  query: {
    path: '/redis.RedisService/Query',
    requestStream: false,
    responseStream: false,
    requestType: reddis_pb.RedisRequest,
    responseType: reddis_pb.RedisResponse,
    requestSerialize: serialize_redis_RedisRequest,
    requestDeserialize: deserialize_redis_RedisRequest,
    responseSerialize: serialize_redis_RedisResponse,
    responseDeserialize: deserialize_redis_RedisResponse,
  },
  // Método RPC para realizar la consulta en Redis
};

exports.RedisServiceClient = grpc.makeGenericClientConstructor(RedisServiceService);

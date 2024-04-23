// GENERATED CODE -- DO NOT EDIT!

'use strict';
var grpc = require('grpc');
var database_pb = require('./database_pb.js');

function serialize_postgres_PostgresRequest(arg) {
  if (!(arg instanceof database_pb.PostgresRequest)) {
    throw new Error('Expected argument of type postgres.PostgresRequest');
  }
  return Buffer.from(arg.serializeBinary());
}

function deserialize_postgres_PostgresRequest(buffer_arg) {
  return database_pb.PostgresRequest.deserializeBinary(new Uint8Array(buffer_arg));
}

function serialize_postgres_PostgresResponse(arg) {
  if (!(arg instanceof database_pb.PostgresResponse)) {
    throw new Error('Expected argument of type postgres.PostgresResponse');
  }
  return Buffer.from(arg.serializeBinary());
}

function deserialize_postgres_PostgresResponse(buffer_arg) {
  return database_pb.PostgresResponse.deserializeBinary(new Uint8Array(buffer_arg));
}


// Servicio gRPC para interactuar con PostgreSQL
var PostgresServiceService = exports.PostgresServiceService = {
  query: {
    path: '/postgres.PostgresService/Query',
    requestStream: false,
    responseStream: false,
    requestType: database_pb.PostgresRequest,
    responseType: database_pb.PostgresResponse,
    requestSerialize: serialize_postgres_PostgresRequest,
    requestDeserialize: deserialize_postgres_PostgresRequest,
    responseSerialize: serialize_postgres_PostgresResponse,
    responseDeserialize: deserialize_postgres_PostgresResponse,
  },
  // Método RPC para realizar la consulta en PostgreSQL
};

exports.PostgresServiceClient = grpc.makeGenericClientConstructor(PostgresServiceService);

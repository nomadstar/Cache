import { createClient } from 'redis';


const cluster = createClient({
    rootNodes: [
        {
           host: '172.0.0.4',
           port: 6379
        }
    ]
});

cluster.on('error', (err) => console.log('Redis Cluster Error', err));

module.exports = cluster;
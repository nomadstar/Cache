import { createClient } from 'redis';


const cluster = createClient({
    rootNodes: [
        {
            url: 'redis://172.0.0.4:6379',
        }
    ]
});

cluster.on('error', (err) => console.log('Redis Cluster Error', err));

module.exports = cluster;
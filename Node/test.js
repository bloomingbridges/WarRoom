var net = require('net');

var client = net.connect({port: 6666/*, host: "107.21.216.112"*/}, function() { 
  console.log('Connection established!');
  client.write('Hello Server!\r\n');
});

client.on('data', function(data) {
  console.log(data.toString());
});

client.on('end', function() {
  console.log('client disconnected');
});

console.log("Testing..");
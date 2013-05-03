var net = require('net');
var mySocket;

var server = net.createServer(function(socket) {
  mySocket = socket;
  mySocket.on("connect", onConnect);
  mySocket.on("data", onData);
});

function onConnect() {
	console.log("=== Connection to Client established!");
}

function onData(details) {
	console.log(details);
	// TODO Make sure passphrase is correct ////////////////////////////////////
	// TODO Process incoming data //////////////////////////////////////////////
}

server.listen(8080, '127.0.0.1');
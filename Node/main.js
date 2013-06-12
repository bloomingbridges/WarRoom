
// Modules /////////////////////////////////////////////////////////////////////

var net = require('net')
  , nodemailer = require("nodemailer")
  , credentials = require("./credentials.js");


// Globals /////////////////////////////////////////////////////////////////////

var port = process.env.PORT || 6666;
var mySocket;

var transport = nodemailer.createTransport("SMTP", {
    service: "Gmail",
    auth: {
        user: credentials.user,
        pass: credentials.pwd
    }
});

var testEmail = {
	from: "▇▇▇▇▇▇▇▇▇▇▇▇ <missilenotificationsystem@gmail.com>",
	to: "Evildoer <j@lostwith.me>",
	subject: "▇▇▇▇▇ Test",
	text: "Yo James",
	html: "<h1>Hey Jimbo</h1><p>You just killed a fair amount of people. THX.</p>"
};


// Flash ///////////////////////////////////////////////////////////////////////

var server = net.createServer(function(socket) {
  mySocket = socket;
  mySocket.setEncoding('utf8');
  mySocket.on("connect", onConnect);
  mySocket.on("data", onData);
});

function onConnect() {
	console.log("=== Connection to Client established!");
}

function onData(data) {
	console.log(data.toString());
	var details = JSON.parse(data.toString().slice(0,-1));
	console.log(details);
	//sendEmail(null, 1000);
	// TODO Make sure passphrase is correct ////////////////////////////////////
	// TODO Process incoming data //////////////////////////////////////////////
}


// Mail ////////////////////////////////////////////////////////////////////////

function sendEmail(recipient, impact) {
	transport.sendMail(testEmail, function(error, response) {
		if (error) {
			console.log(error);
		}
		else {
			console.log("Mail has been sent successfully :>");
			console.log(response);
		}
	});
}


// GO //////////////////////////////////////////////////////////////////////////

server.listen(port, '127.0.0.1');
console.log("TCP SERVER LISTENING ON PORT " + port + " YO!");


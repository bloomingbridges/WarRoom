
// Modules /////////////////////////////////////////////////////////////////////

var net = require('net')
  , nodemailer = require('nodemailer')
  , http = require('http')
  , connect = require('connect')
  , _ = require('underscore')
  , credentials = require("./credentials.js");


// Globals /////////////////////////////////////////////////////////////////////

var port = process.env.PORT || 6666
	, mySocket
	, policy;

var missiles = [];

var transport = nodemailer.createTransport("SMTP", {
    service: "Gmail",
    auth: {
        user: credentials.user,
        pass: credentials.pwd
    }
});

var emailTemplate = {
	from: "▇▇▇▇▇▇▇▇▇▇▇▇ <missilenotificationsystem@gmail.com>",
	to: "",
	bcc: "brueckner.florian@gmail.com",
	subject: "▇▇▇ ▇▇▇▇ ▇▇▇▇▇▇▇▇▇▇▇▇ : ▇▇▇▇▇▇▇▇▇▇▇▇",
	html: ""
};

var emailReceiverTemplate = _.template("Gallery visitor <<%= email %>>");

var emailBodyTemplate = _.template("<h1>Missile impact notification</h1>"
	+ "<p>Dear visitor,\n This is an automated confirmation email informing you that the missile you launched killed around <%= impact %> people.</p>");

// missiles.push({
// 	impact:1000,
// 	arrival: new Date().getTime() + 3000,
// 	email:"brueckner.florian@googlemail.com"
// })

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
	if (data == '<policy-file-request/>\0') {
		console.log("Policy file requested..");
		mySocket.end(policy + '\0');
	} else {
		console.log(data.toString());
		var details = JSON.parse(data.toString().slice(0,-1));
		if(validateAdress(details.email)) {
			var now = new Date().getTime();
			details.arrival += now;
			missiles.push(details);
		} else {
			console.log("XXX INVALID EMAIL ADDRESS");
		}
	}
}


// Mail ////////////////////////////////////////////////////////////////////////

function validateAdress(address) {
	var ATPOS = address.indexOf('@')
	  , POSTSTRING = "", AMOUNTDOTS = 0;
	if (ATPOS >= 1) {
		POSTSTRING = address.substr(ATPOS);
		AMOUNTDOTS = POSTSTRING.split(".").length - 1;
		console.log("=== VALIDATION RESULTS", "@: "+ATPOS, ".: "+AMOUNTDOTS);
		if (AMOUNTDOTS > 0 && AMOUNTDOTS <= 2)
			return true;
		else return false;
	} 
	else return false;
}

function checkForImpact() {
	var now = new Date().getTime();
	//console.log("=== CHECK: " + now);
	for (var i=0; i<missiles.length; i++) {
		var m = missiles[i];
		if (now >= m.arrival) {
			sendEmail(m);
			missiles.splice(i,1);
		}
	}
}

function sendEmail(meta) {
	emailTemplate.to = emailReceiverTemplate(meta);
	emailTemplate.html = emailBodyTemplate(meta);
	console.log("=== SENDING EMAIL TO " + meta.email + " [" + meta.impact + "]");
	//console.log(emailTemplate);
	transport.sendMail(emailTemplate, function(error, response) {
		if (error) {
			console.log(error);
		}
		else {
			console.log("=== MAIL HAS BEEN SENT SUCCESSFULLY!");
			//console.log(response);
		}
	});
}

// Debug ///////////////////////////////////////////////////////////////////////

if (port === 6666) {
	http.createServer(function (req, res) {
	  res.writeHead(200, {'Content-Type': 'text/html'});
	  res.write("<!DOCTYPE html>\n");
	  res.write("<html><head><meta charset=\"utf-8\">");
	  res.write("<title>WarRoom DEBUG</title><style>");
	  res.write("body{background:#111;color:#FF00FF;font-family:monospace}");
	  res.write("body{padding:0}");
	  res.write("ul{padding:0 0 0 15px;list-style:square;font-size:10px;}");
	  res.write("</style></head><body>");
	  res.write(logMissiles());
	  res.end("</body></html>");
	}).listen(7777, function() {
		console.log("=== DEBUG PAGE AVAILABLE ON PORT 7777");
	});
}

function logMissiles() {
	var log = "";
	if (missiles.length > 0) {
		log += "<ul>";
		for (var i=0; i<missiles.length; i++) {
			var m = missiles[i];
			log += "<li>";
			log += m.email + " ==> " + m.impact + " [ " + m.arrival + " ]\n"; 
			log += "</li>";
		}
		log += "</ul>";
	} 
	else {
		log += "█";
	}
	return log;
}


// GO //////////////////////////////////////////////////////////////////////////

require('fs').readFile(__dirname+"/public/crossdomain.xml", 'utf8', function (err, file) {
	if (err) throw err;
	policy = file;
	server.listen(port);
	console.log("=== TCP SERVER LISTENING ON PORT " + port + " YO!");
	connect()
	  .use(connect.static(__dirname+"/public"))
	  .listen(8888);
	console.log("=== SERVING FILES ON PORT 8888..");
	setInterval(checkForImpact, 1000);
});


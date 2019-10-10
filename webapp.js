var http = require('http')
var os = require("os");

http.createServer(onRequest).listen(8080);
console.log('Server has started');

function onRequest(request, response){
  response.writeHead(200);
  response.write('Hello World of Noders! Message from host: ' + os.hostname());
  response.end();
}

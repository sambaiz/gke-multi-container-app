var http = require('http');
var handleRequest = function(request, response) {
  if(process.env.TYPE == "GATEWAY"){
    console.log('Passed.');
    var options = {
      host: 'service',
      port: 8080,
      method: 'GET'
    };
    var req = http.request(options, function(res) {
      data = ""
      res.on('data', function (chunk) {
        data+=chunk;
      });

      res.on('end', () => {
        response.writeHead(200);
        response.end(data);
      });
    });
    req.on('error', function(e) {
      response.writeHead(500)
      response.end(e.message);
    });
    req.end();
  }else{
    console.log('Received.');
    response.writeHead(200);
    response.end('ok');
  }
};
var www = http.createServer(handleRequest);
www.listen(8080);

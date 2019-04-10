const http = require('http')

http.createServer(async (req, res) => {
  res.write('Hello World! - NodeJs HTTP')
  res.end()
}).listen(3000)

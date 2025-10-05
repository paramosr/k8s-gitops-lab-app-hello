import http from 'node:http';
const port = process.env.PORT || 3000;
http.createServer((_, res) => { res.writeHead(200); res.end('hello-api v1\n'); })
  .listen(port, () => console.log(`listening on ${port}`));

import asynchttpserver, asyncdispatch, strutils
var server = newAsyncHttpServer()
proc Do_GET(req: Request) {.async.} =
  echo "What's your command? "
  var command: string = readLine(stdin)
  await req.respond(Http200, command, newHttpHeaders({ "Content-Type": "text/html" })) 
  if req.reqMethod == HttpPost :
   echo req.body
       
waitFor server.serve(Port(80), Do_GET, address = "127.0.0.1")

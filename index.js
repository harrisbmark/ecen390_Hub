var app = require("express")();
var http = require("http").Server(app);
var pg = require("pg");
var io = require("socket.io")(http);

var pg_connection = "tcp://laser-tag:bgt56yhn@localhost/laser-tag";
var pg_client = new pg.Client(pg_connection);

pg_client.connect();

var pg_query = pg_client.query("LISTEN watchers");

app.get("/", function(req, res){
  res.sendFile(__dirname + "/index.html");
});

/*io.on("connection", function(socket)
{
  io.emit("connected", { connected: true});
  socket.on("ready", function(data)
  {
    pg_client.on("notification", function(title)
    {
      io.emit("update", { message: title } );
    });
  });
});*/

io.on("connection", function(socket)
{
  /*socket.on("hit", function(player_number)
  {
    console.log("hit", player_number);
    io.emit("hit", player_number); 
  });*/

  pg_client.on("notification", function(title)
  {
    if (JSON.parse(title.payload).hits !== undefined && JSON.parse(title.payload).player_frequency !== undefined)
    {
      io.emit("hit", JSON.parse(title.payload).player_frequency - 1, JSON.parse(title.payload).hits);
    }

    else if (JSON.parse(title.payload).shots !== undefined && JSON.parse(title.payload).palyer_frequency !== undefined)
    {
      io.emit("shot", JSON.parse(title.payload).palyer_frequency - 1, JSON.parse(title.payload).shots);
    }

    else
    {
      console.log("Error!", title);
    }
  });
});

http.listen(3000, function(){
  console.log("Listening on *:3000");
});

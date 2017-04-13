var express = require("express");
var app = express();
var http = require("http").Server(app);
var pg = require("pg");
var io = require("socket.io")(http);
var bp = require("body-parser");

var pg_connection = "tcp://lasertag:bgt56yhn@localhost/lasertag";
var pg_client = new pg.Client(pg_connection);
var pg_query = pg_client.query("LISTEN watchers");

pg_client.connect();

app.use(bp.urlencoded(
{
  extended: true
}));

app.get("/", function(req, res)
{
  res.sendFile(__dirname + "/index.html");
});

app.post("/", function(req, res)
{
  //console.log(req.body);
  if (req.body.action !== undefined)
  {
    if (req.body.action == "hit")
    {
      var hits_query = "UPDATE player" + req.body.player_hit + ".hits SET hits=hits+1 WHERE player_frequency=($1)";

      pg_client.query(hits_query, [req.body.by_player], function(error, result)
      {
        //console.log(error, result);
      });
    }

    else if (req.body.action == "shot")
    {
      var shots_query = "UPDATE shots SET shots=shots+1 WHERE player_frequency=($1)";

      pg_client.query(shots_query, [req.body.player], function(error, result)
      {
        //console.log(error, result);
      });
    }

    res.status(200).send(req.body);
  }

  else
  {
    res.status(500).send(req.body);
  }
});

io.on("connection", function(socket)
{
  socket.emit("connected", {connected: true});

  pg_client.query("SELECT row_to_json(r) FROM (SELECT * FROM hits) r", function(error, result)
  {
    //console.log(result);
    socket.emit("hits", result);
  });

  pg_client.query("SELECT row_to_json(r) FROM (SELECT * FROM shots) r", function(error, result)
  {
    //console.log(result);
    socket.emit("shots", result);
  });

  pg_client.query("SELECT row_to_json(r) FROM (SELECT * FROM takedowns) r", function(error, result)
  {
    //console.log(result);
    socket.emit("takedowns", result);
  });

  socket.on("ready", function(data)
  {
    //console.log("ready");

    pg_client.on("notification", function(title)
    {
      // Used for debugging the grabbed notification.
      //console.log("notification", title.payload);

      if (JSON.parse(title.payload).takedowns !== undefined && JSON.parse(title.payload).player_frequency !== undefined)
      {
        //console.log("takedown");
        io.emit("takedown", JSON.parse(title.payload).player_frequency - 1, JSON.parse(title.payload).takedowns);
      }

      else if (JSON.parse(title.payload).hits !== undefined && JSON.parse(title.payload).player_frequency !== undefined)
      {
        //console.log("hit");
        io.emit("hit", JSON.parse(title.payload).player_frequency - 1, JSON.parse(title.payload).hits);
      }

      else if (JSON.parse(title.payload).shots !== undefined && JSON.parse(title.payload).player_frequency !== undefined)
      {
        //console.log("shot");
        io.emit("shot", JSON.parse(title.payload).player_frequency - 1, JSON.parse(title.payload).shots);
      }

      else
      {
        //console.log("Error!", title);
      }
    });
  });
});

http.listen(3000, function()
{
  console.log("Listening on *:3000");
});

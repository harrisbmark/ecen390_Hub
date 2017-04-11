# ECEN390 Laser Tag Hub

## Statements for Reference
### PostgreSQL
Repeat this 10 times to create the player 1-10 hit tables.
```sql
CREATE TABLE playerX.hits (player_frequency SERIAL NOT NULL PRIMARY KEY, hits integer);
```

Create the function that will be ran by the triggers (notify for NodeJS sockets):
```sql
CREATE FUNCTION notify_trigger() RETURNS trigger AS $$ DECLARE BEGIN PERFORM pg_notify('watchers', row_to_json(NEW)::text); RETURN new; END; $$ LANGUAGE plpgsql;
```

Trigger for the playerX hits table:
```sql
CREATE TRIGGER playerX.hits_trigger AFTER UPDATE ON playerX.hits FOR EACH ROW EXECUTE PROCEDURE notify_trigger();
```

Trigger for the shots table:
```sql
CREATE TRIGGER shots_trigger AFTER UPDATE ON shots FOR EACH ROW EXECUTE PROCEDURE notify_trigger();
```

SQL script execution:
```bash
psql -h localhost -d lasertag -U lasertag -p 5432 -a -q -f ./lasertag.sql
```

### Docker
Delete all images and containers (optional):
```bash
docker rm $(docker ps -a -q)
docker rmi $(docker images -q)
```

Build the Dokcer image
```bash
docker build -t lasertag .
```

Run the image and create a container
```bash
docker run -P --name lasertag lasertag
```

Attach to Docker image:
```bash
docker ps
docker exec -it --user [username] [container] /bin/bash
```

## Additional Sources
- [Listening and Notifying with NodeJS - (bjorngylling)](http://bjorngylling.com/2011-04-13/postgres-listen-notify-with-node-js.html)
- [Get Started with Sockets - (socket.io)](https://socket.io/get-started/chat/)
- [Creating a Real-Time Web Application with PostgreSQL and NodeJS - (darrenoneill)](http://darrenoneill.co.uk/post/real-time-web-apps-postgresql-and-node/)
- [Updating Triggers with PostgreSQL - (stackoverflow)](http://stackoverflow.com/questions/25271883/postgresql-update-trigger)
- [Updating PostgreSQL - (postgresqltutorial)](http://www.postgresqltutorial.com/postgresql-update/)
- [Creating a PostgreSQL Service in Docker - (docs.docker)](https://docs.docker.com/engine/examples/postgresql_service/)
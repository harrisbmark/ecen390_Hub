# ECEN390 Laser Tag Hub

## Statements for Reference
### PostgreSQL
```
CREATE FUNCTION notify_trigger() RETURNS trigger AS $$ DECLARE BEGIN PERFORM pg_notify('watchers', row_to_json(NEW)::text); RETURN new; END; $$ LANGUAGE plpgsql;
```

```
CREATE TABLE player1.hits (player_frequency SERIAL NOT NULL PRIMARY KEY, hits integer);
```

```
CREATE TRIGGER hits_table_trigger AFTER UPDATE ON hits FOR EACH ROW EXECUTE PROCEDURE notify_trigger();
```

```
CREATE TRIGGER shots_table_trigger AFTER UPDATE ON shots FOR EACH ROW EXECUTE PROCEDURE notify_trigger();
```

## Additional Sources
- [Listening and Notifying with NodeJS - (bjorngylling)](http://bjorngylling.com/2011-04-13/postgres-listen-notify-with-node-js.html)
- [Get Started with Sockets - (socket.io)](https://socket.io/get-started/chat/)
- [Creating a Real-Time Web Application with PostgreSQL and NodeJS - (darrenoneill)](http://darrenoneill.co.uk/post/real-time-web-apps-postgresql-and-node/)
- [Updating Triggers with PostgreSQL - (stackoverflow)](http://stackoverflow.com/questions/25271883/postgresql-update-trigger)
- [Updating PostgreSQL - (postgresqltutorial)](http://www.postgresqltutorial.com/postgresql-update/)
- [Creating a PostgreSQL Service in Docker - (docs.docker)](https://docs.docker.com/engine/examples/postgresql_service/)
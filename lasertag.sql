CREATE TABLE shots (player_frequency SERIAL NOT NULL PRIMARY KEY, shots integer);

CREATE SCHEMA player1;
CREATE SCHEMA player2;
CREATE SCHEMA player3;
CREATE SCHEMA player4;
CREATE SCHEMA player5;
CREATE SCHEMA player6;
CREATE SCHEMA player7;
CREATE SCHEMA player8;
CREATE SCHEMA player9;
CREATE SCHEMA player10;

CREATE TABLE player1.hits (player_frequency SERIAL NOT NULL PRIMARY KEY, hits integer);
CREATE TABLE player2.hits (player_frequency SERIAL NOT NULL PRIMARY KEY, hits integer);
CREATE TABLE player3.hits (player_frequency SERIAL NOT NULL PRIMARY KEY, hits integer);
CREATE TABLE player4.hits (player_frequency SERIAL NOT NULL PRIMARY KEY, hits integer);
CREATE TABLE player5.hits (player_frequency SERIAL NOT NULL PRIMARY KEY, hits integer);
CREATE TABLE player6.hits (player_frequency SERIAL NOT NULL PRIMARY KEY, hits integer);
CREATE TABLE player7.hits (player_frequency SERIAL NOT NULL PRIMARY KEY, hits integer);
CREATE TABLE player8.hits (player_frequency SERIAL NOT NULL PRIMARY KEY, hits integer);
CREATE TABLE player9.hits (player_frequency SERIAL NOT NULL PRIMARY KEY, hits integer);
CREATE TABLE player10.hits (player_frequency SERIAL NOT NULL PRIMARY KEY, hits integer);

CREATE FUNCTION notify_trigger() RETURNS trigger AS $$ DECLARE BEGIN PERFORM pg_notify('watchers', row_to_json(NEW)::text); RETURN new; END; $$ LANGUAGE plpgsql;

CREATE TRIGGER shots_table_trigger AFTER UPDATE ON shots FOR EACH ROW EXECUTE PROCEDURE notify_trigger();

CREATE TRIGGER player1_shots_trigger AFTER UPDATE ON player1.hits FOR EACH ROW EXECUTE PROCEDURE notify_trigger();
CREATE TRIGGER player2_shots_trigger AFTER UPDATE ON player2.hits FOR EACH ROW EXECUTE PROCEDURE notify_trigger();
CREATE TRIGGER player3_shots_trigger AFTER UPDATE ON player3.hits FOR EACH ROW EXECUTE PROCEDURE notify_trigger();
CREATE TRIGGER player4_shots_trigger AFTER UPDATE ON player4.hits FOR EACH ROW EXECUTE PROCEDURE notify_trigger();
CREATE TRIGGER player5_shots_trigger AFTER UPDATE ON player5.hits FOR EACH ROW EXECUTE PROCEDURE notify_trigger();
CREATE TRIGGER player6_shots_trigger AFTER UPDATE ON player6.hits FOR EACH ROW EXECUTE PROCEDURE notify_trigger();
CREATE TRIGGER player7_shots_trigger AFTER UPDATE ON player7.hits FOR EACH ROW EXECUTE PROCEDURE notify_trigger();
CREATE TRIGGER player8_shots_trigger AFTER UPDATE ON player8.hits FOR EACH ROW EXECUTE PROCEDURE notify_trigger();
CREATE TRIGGER player9_shots_trigger AFTER UPDATE ON player9.hits FOR EACH ROW EXECUTE PROCEDURE notify_trigger();
CREATE TRIGGER player10_shots_trigger AFTER UPDATE ON player10.hits FOR EACH ROW EXECUTE PROCEDURE notify_trigger();

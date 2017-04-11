-- Create the shots table
CREATE OR REPLACE TABLE shots (player_frequency SERIAL NOT NULL PRIMARY KEY, shots integer);

-- Create all the schemas for the different players (used for the hit tables)
CREATE OR REPLACE SCHEMA player1;
CREATE OR REPLACE SCHEMA player2;
CREATE OR REPLACE SCHEMA player3;
CREATE OR REPLACE SCHEMA player4;
CREATE OR REPLACE SCHEMA player5;
CREATE OR REPLACE SCHEMA player6;
CREATE OR REPLACE SCHEMA player7;
CREATE OR REPLACE SCHEMA player8;
CREATE OR REPLACE SCHEMA player9;
CREATE OR REPLACE SCHEMA player10;

-- Create all the hit tables for each player
CREATE OR REPLACE TABLE player1.hits (player_frequency SERIAL NOT NULL PRIMARY KEY, hits integer);
CREATE OR REPLACE TABLE player2.hits (player_frequency SERIAL NOT NULL PRIMARY KEY, hits integer);
CREATE OR REPLACE TABLE player3.hits (player_frequency SERIAL NOT NULL PRIMARY KEY, hits integer);
CREATE OR REPLACE TABLE player4.hits (player_frequency SERIAL NOT NULL PRIMARY KEY, hits integer);
CREATE OR REPLACE TABLE player5.hits (player_frequency SERIAL NOT NULL PRIMARY KEY, hits integer);
CREATE OR REPLACE TABLE player6.hits (player_frequency SERIAL NOT NULL PRIMARY KEY, hits integer);
CREATE OR REPLACE TABLE player7.hits (player_frequency SERIAL NOT NULL PRIMARY KEY, hits integer);
CREATE OR REPLACE TABLE player8.hits (player_frequency SERIAL NOT NULL PRIMARY KEY, hits integer);
CREATE OR REPLACE TABLE player9.hits (player_frequency SERIAL NOT NULL PRIMARY KEY, hits integer);
CREATE OR REPLACE TABLE player10.hits (player_frequency SERIAL NOT NULL PRIMARY KEY, hits integer);

-- Insert 10 values into the shots table
INSERT INTO shots (shots) VALUES (0);
INSERT INTO shots (shots) VALUES (0);
INSERT INTO shots (shots) VALUES (0);
INSERT INTO shots (shots) VALUES (0);
INSERT INTO shots (shots) VALUES (0);
INSERT INTO shots (shots) VALUES (0);
INSERT INTO shots (shots) VALUES (0);
INSERT INTO shots (shots) VALUES (0);
INSERT INTO shots (shots) VALUES (0);
INSERT INTO shots (shots) VALUES (0);

-- Insert 10 values into each player hit table
INSERT INTO player1.hits (hits) VALUES (0);
INSERT INTO player1.hits (hits) VALUES (0);
INSERT INTO player1.hits (hits) VALUES (0);
INSERT INTO player1.hits (hits) VALUES (0);
INSERT INTO player1.hits (hits) VALUES (0);
INSERT INTO player1.hits (hits) VALUES (0);
INSERT INTO player1.hits (hits) VALUES (0);
INSERT INTO player1.hits (hits) VALUES (0);
INSERT INTO player1.hits (hits) VALUES (0);
INSERT INTO player1.hits (hits) VALUES (0);

INSERT INTO player2.hits (hits) VALUES (0);
INSERT INTO player2.hits (hits) VALUES (0);
INSERT INTO player2.hits (hits) VALUES (0);
INSERT INTO player2.hits (hits) VALUES (0);
INSERT INTO player2.hits (hits) VALUES (0);
INSERT INTO player2.hits (hits) VALUES (0);
INSERT INTO player2.hits (hits) VALUES (0);
INSERT INTO player2.hits (hits) VALUES (0);
INSERT INTO player2.hits (hits) VALUES (0);
INSERT INTO player2.hits (hits) VALUES (0);

INSERT INTO player3.hits (hits) VALUES (0);
INSERT INTO player3.hits (hits) VALUES (0);
INSERT INTO player3.hits (hits) VALUES (0);
INSERT INTO player3.hits (hits) VALUES (0);
INSERT INTO player3.hits (hits) VALUES (0);
INSERT INTO player3.hits (hits) VALUES (0);
INSERT INTO player3.hits (hits) VALUES (0);
INSERT INTO player3.hits (hits) VALUES (0);
INSERT INTO player3.hits (hits) VALUES (0);
INSERT INTO player3.hits (hits) VALUES (0);

INSERT INTO player4.hits (hits) VALUES (0);
INSERT INTO player4.hits (hits) VALUES (0);
INSERT INTO player4.hits (hits) VALUES (0);
INSERT INTO player4.hits (hits) VALUES (0);
INSERT INTO player4.hits (hits) VALUES (0);
INSERT INTO player4.hits (hits) VALUES (0);
INSERT INTO player4.hits (hits) VALUES (0);
INSERT INTO player4.hits (hits) VALUES (0);
INSERT INTO player4.hits (hits) VALUES (0);
INSERT INTO player4.hits (hits) VALUES (0);

INSERT INTO player5.hits (hits) VALUES (0);
INSERT INTO player5.hits (hits) VALUES (0);
INSERT INTO player5.hits (hits) VALUES (0);
INSERT INTO player5.hits (hits) VALUES (0);
INSERT INTO player5.hits (hits) VALUES (0);
INSERT INTO player5.hits (hits) VALUES (0);
INSERT INTO player5.hits (hits) VALUES (0);
INSERT INTO player5.hits (hits) VALUES (0);
INSERT INTO player5.hits (hits) VALUES (0);
INSERT INTO player5.hits (hits) VALUES (0);

INSERT INTO player6.hits (hits) VALUES (0);
INSERT INTO player6.hits (hits) VALUES (0);
INSERT INTO player6.hits (hits) VALUES (0);
INSERT INTO player6.hits (hits) VALUES (0);
INSERT INTO player6.hits (hits) VALUES (0);
INSERT INTO player6.hits (hits) VALUES (0);
INSERT INTO player6.hits (hits) VALUES (0);
INSERT INTO player6.hits (hits) VALUES (0);
INSERT INTO player6.hits (hits) VALUES (0);
INSERT INTO player6.hits (hits) VALUES (0);

INSERT INTO player7.hits (hits) VALUES (0);
INSERT INTO player7.hits (hits) VALUES (0);
INSERT INTO player7.hits (hits) VALUES (0);
INSERT INTO player7.hits (hits) VALUES (0);
INSERT INTO player7.hits (hits) VALUES (0);
INSERT INTO player7.hits (hits) VALUES (0);
INSERT INTO player7.hits (hits) VALUES (0);
INSERT INTO player7.hits (hits) VALUES (0);
INSERT INTO player7.hits (hits) VALUES (0);
INSERT INTO player7.hits (hits) VALUES (0);

INSERT INTO player8.hits (hits) VALUES (0);
INSERT INTO player8.hits (hits) VALUES (0);
INSERT INTO player8.hits (hits) VALUES (0);
INSERT INTO player8.hits (hits) VALUES (0);
INSERT INTO player8.hits (hits) VALUES (0);
INSERT INTO player8.hits (hits) VALUES (0);
INSERT INTO player8.hits (hits) VALUES (0);
INSERT INTO player8.hits (hits) VALUES (0);
INSERT INTO player8.hits (hits) VALUES (0);
INSERT INTO player8.hits (hits) VALUES (0);

INSERT INTO player9.hits (hits) VALUES (0);
INSERT INTO player9.hits (hits) VALUES (0);
INSERT INTO player9.hits (hits) VALUES (0);
INSERT INTO player9.hits (hits) VALUES (0);
INSERT INTO player9.hits (hits) VALUES (0);
INSERT INTO player9.hits (hits) VALUES (0);
INSERT INTO player9.hits (hits) VALUES (0);
INSERT INTO player9.hits (hits) VALUES (0);
INSERT INTO player9.hits (hits) VALUES (0);
INSERT INTO player9.hits (hits) VALUES (0);

INSERT INTO player10.hits (hits) VALUES (0);
INSERT INTO player10.hits (hits) VALUES (0);
INSERT INTO player10.hits (hits) VALUES (0);
INSERT INTO player10.hits (hits) VALUES (0);
INSERT INTO player10.hits (hits) VALUES (0);
INSERT INTO player10.hits (hits) VALUES (0);
INSERT INTO player10.hits (hits) VALUES (0);
INSERT INTO player10.hits (hits) VALUES (0);
INSERT INTO player10.hits (hits) VALUES (0);
INSERT INTO player10.hits (hits) VALUES (0);

-- Create a view to show the total takedowns for each player
CREATE OR REPLACE VIEW takedowns AS SELECT (SELECT hits FROM player1.hits WHERE player_frequency=1) +
       (SELECT hits FROM player2.hits WHERE player_frequency=1) +
       (SELECT hits FROM player3.hits WHERE player_frequency=1) +
       (SELECT hits FROM player4.hits WHERE player_frequency=1) +
       (SELECT hits FROM player5.hits WHERE player_frequency=1) +
       (SELECT hits FROM player6.hits WHERE player_frequency=1) +
       (SELECT hits FROM player7.hits WHERE player_frequency=1) +
       (SELECT hits FROM player8.hits WHERE player_frequency=1) +
       (SELECT hits FROM player9.hits WHERE player_frequency=1) +
       (SELECT hits FROM player10.hits WHERE player_frequency=2) AS player_1,
       (SELECT hits FROM player1.hits WHERE player_frequency=2) +
       (SELECT hits FROM player2.hits WHERE player_frequency=2) +
       (SELECT hits FROM player3.hits WHERE player_frequency=2) +
       (SELECT hits FROM player4.hits WHERE player_frequency=2) +
       (SELECT hits FROM player5.hits WHERE player_frequency=2) +
       (SELECT hits FROM player6.hits WHERE player_frequency=2) +
       (SELECT hits FROM player7.hits WHERE player_frequency=2) +
       (SELECT hits FROM player8.hits WHERE player_frequency=2) +
       (SELECT hits FROM player9.hits WHERE player_frequency=2) +
       (SELECT hits FROM player10.hits WHERE player_frequency=2) AS player_2,
       (SELECT hits FROM player1.hits WHERE player_frequency=3) +
       (SELECT hits FROM player2.hits WHERE player_frequency=3) +
       (SELECT hits FROM player3.hits WHERE player_frequency=3) +
       (SELECT hits FROM player4.hits WHERE player_frequency=3) +
       (SELECT hits FROM player5.hits WHERE player_frequency=3) +
       (SELECT hits FROM player6.hits WHERE player_frequency=3) +
       (SELECT hits FROM player7.hits WHERE player_frequency=3) +
       (SELECT hits FROM player8.hits WHERE player_frequency=3) +
       (SELECT hits FROM player9.hits WHERE player_frequency=3) +
       (SELECT hits FROM player10.hits WHERE player_frequency=3) AS player_3,
       (SELECT hits FROM player1.hits WHERE player_frequency=4) +
       (SELECT hits FROM player2.hits WHERE player_frequency=4) +
       (SELECT hits FROM player3.hits WHERE player_frequency=4) +
       (SELECT hits FROM player4.hits WHERE player_frequency=4) +
       (SELECT hits FROM player5.hits WHERE player_frequency=4) +
       (SELECT hits FROM player6.hits WHERE player_frequency=4) +
       (SELECT hits FROM player7.hits WHERE player_frequency=4) +
       (SELECT hits FROM player8.hits WHERE player_frequency=4) +
       (SELECT hits FROM player9.hits WHERE player_frequency=4) +
       (SELECT hits FROM player10.hits WHERE player_frequency=4) AS player_4,
       (SELECT hits FROM player1.hits WHERE player_frequency=5) +
       (SELECT hits FROM player2.hits WHERE player_frequency=5) +
       (SELECT hits FROM player3.hits WHERE player_frequency=5) +
       (SELECT hits FROM player4.hits WHERE player_frequency=5) +
       (SELECT hits FROM player5.hits WHERE player_frequency=5) +
       (SELECT hits FROM player6.hits WHERE player_frequency=5) +
       (SELECT hits FROM player7.hits WHERE player_frequency=5) +
       (SELECT hits FROM player8.hits WHERE player_frequency=5) +
       (SELECT hits FROM player9.hits WHERE player_frequency=5) +
       (SELECT hits FROM player10.hits WHERE player_frequency=5) AS player_5,
       (SELECT hits FROM player1.hits WHERE player_frequency=6) +
       (SELECT hits FROM player2.hits WHERE player_frequency=6) +
       (SELECT hits FROM player3.hits WHERE player_frequency=6) +
       (SELECT hits FROM player4.hits WHERE player_frequency=6) +
       (SELECT hits FROM player5.hits WHERE player_frequency=6) +
       (SELECT hits FROM player6.hits WHERE player_frequency=6) +
       (SELECT hits FROM player7.hits WHERE player_frequency=6) +
       (SELECT hits FROM player8.hits WHERE player_frequency=6) +
       (SELECT hits FROM player9.hits WHERE player_frequency=6) +
       (SELECT hits FROM player10.hits WHERE player_frequency=6) AS player_6,
       (SELECT hits FROM player1.hits WHERE player_frequency=7) +
       (SELECT hits FROM player2.hits WHERE player_frequency=7) +
       (SELECT hits FROM player3.hits WHERE player_frequency=7) +
       (SELECT hits FROM player4.hits WHERE player_frequency=7) +
       (SELECT hits FROM player5.hits WHERE player_frequency=7) +
       (SELECT hits FROM player6.hits WHERE player_frequency=7) +
       (SELECT hits FROM player7.hits WHERE player_frequency=7) +
       (SELECT hits FROM player8.hits WHERE player_frequency=7) +
       (SELECT hits FROM player9.hits WHERE player_frequency=7) +
       (SELECT hits FROM player10.hits WHERE player_frequency=7) AS player_7,
       (SELECT hits FROM player1.hits WHERE player_frequency=8) +
       (SELECT hits FROM player2.hits WHERE player_frequency=8) +
       (SELECT hits FROM player3.hits WHERE player_frequency=8) +
       (SELECT hits FROM player4.hits WHERE player_frequency=8) +
       (SELECT hits FROM player5.hits WHERE player_frequency=8) +
       (SELECT hits FROM player6.hits WHERE player_frequency=8) +
       (SELECT hits FROM player7.hits WHERE player_frequency=8) +
       (SELECT hits FROM player8.hits WHERE player_frequency=8) +
       (SELECT hits FROM player9.hits WHERE player_frequency=8) +
       (SELECT hits FROM player10.hits WHERE player_frequency=8) AS player_8,
       (SELECT hits FROM player1.hits WHERE player_frequency=9) +
       (SELECT hits FROM player2.hits WHERE player_frequency=9) +
       (SELECT hits FROM player3.hits WHERE player_frequency=9) +
       (SELECT hits FROM player4.hits WHERE player_frequency=9) +
       (SELECT hits FROM player5.hits WHERE player_frequency=9) +
       (SELECT hits FROM player6.hits WHERE player_frequency=9) +
       (SELECT hits FROM player7.hits WHERE player_frequency=9) +
       (SELECT hits FROM player8.hits WHERE player_frequency=9) +
       (SELECT hits FROM player9.hits WHERE player_frequency=9) +
       (SELECT hits FROM player10.hits WHERE player_frequency=9) AS player_9,
       (SELECT hits FROM player1.hits WHERE player_frequency=10) +
       (SELECT hits FROM player2.hits WHERE player_frequency=10) +
       (SELECT hits FROM player3.hits WHERE player_frequency=10) +
       (SELECT hits FROM player4.hits WHERE player_frequency=10) +
       (SELECT hits FROM player5.hits WHERE player_frequency=10) +
       (SELECT hits FROM player6.hits WHERE player_frequency=10) +
       (SELECT hits FROM player7.hits WHERE player_frequency=10) +
       (SELECT hits FROM player8.hits WHERE player_frequency=10) +
       (SELECT hits FROM player9.hits WHERE player_frequency=10) +
       (SELECT hits FROM player10.hits WHERE player_frequency=1) AS player_10;

-- Create a view to show total hits for each player.
CREATE OR REPLACE VIEW hits AS SELECT (SELECT hits FROM player1.hits WHERE player_frequency=1) +
       (SELECT hits FROM player1.hits WHERE player_frequency=2) +
       (SELECT hits FROM player1.hits WHERE player_frequency=3) +
       (SELECT hits FROM player1.hits WHERE player_frequency=4) +
       (SELECT hits FROM player1.hits WHERE player_frequency=5) +
       (SELECT hits FROM player1.hits WHERE player_frequency=6) +
       (SELECT hits FROM player1.hits WHERE player_frequency=7) +
       (SELECT hits FROM player1.hits WHERE player_frequency=8) +
       (SELECT hits FROM player1.hits WHERE player_frequency=9) +
       (SELECT hits FROM player1.hits WHERE player_frequency=10) AS player_1,
       (SELECT hits FROM player2.hits WHERE player_frequency=1) +
       (SELECT hits FROM player2.hits WHERE player_frequency=2) +
       (SELECT hits FROM player2.hits WHERE player_frequency=3) +
       (SELECT hits FROM player2.hits WHERE player_frequency=4) +
       (SELECT hits FROM player2.hits WHERE player_frequency=5) +
       (SELECT hits FROM player2.hits WHERE player_frequency=6) +
       (SELECT hits FROM player2.hits WHERE player_frequency=7) +
       (SELECT hits FROM player2.hits WHERE player_frequency=8) +
       (SELECT hits FROM player2.hits WHERE player_frequency=9) +
       (SELECT hits FROM player2.hits WHERE player_frequency=10) AS player_2,
       (SELECT hits FROM player3.hits WHERE player_frequency=1) +
       (SELECT hits FROM player3.hits WHERE player_frequency=2) +
       (SELECT hits FROM player3.hits WHERE player_frequency=3) +
       (SELECT hits FROM player3.hits WHERE player_frequency=4) +
       (SELECT hits FROM player3.hits WHERE player_frequency=5) +
       (SELECT hits FROM player3.hits WHERE player_frequency=6) +
       (SELECT hits FROM player3.hits WHERE player_frequency=7) +
       (SELECT hits FROM player3.hits WHERE player_frequency=8) +
       (SELECT hits FROM player3.hits WHERE player_frequency=9) +
       (SELECT hits FROM player3.hits WHERE player_frequency=10) AS player_3,
       (SELECT hits FROM player4.hits WHERE player_frequency=1) +
       (SELECT hits FROM player4.hits WHERE player_frequency=2) +
       (SELECT hits FROM player4.hits WHERE player_frequency=3) +
       (SELECT hits FROM player4.hits WHERE player_frequency=4) +
       (SELECT hits FROM player4.hits WHERE player_frequency=5) +
       (SELECT hits FROM player4.hits WHERE player_frequency=6) +
       (SELECT hits FROM player4.hits WHERE player_frequency=7) +
       (SELECT hits FROM player4.hits WHERE player_frequency=8) +
       (SELECT hits FROM player4.hits WHERE player_frequency=9) +
       (SELECT hits FROM player4.hits WHERE player_frequency=10) AS player_4,
       (SELECT hits FROM player5.hits WHERE player_frequency=1) +
       (SELECT hits FROM player5.hits WHERE player_frequency=2) +
       (SELECT hits FROM player5.hits WHERE player_frequency=3) +
       (SELECT hits FROM player5.hits WHERE player_frequency=4) +
       (SELECT hits FROM player5.hits WHERE player_frequency=5) +
       (SELECT hits FROM player5.hits WHERE player_frequency=6) +
       (SELECT hits FROM player5.hits WHERE player_frequency=7) +
       (SELECT hits FROM player5.hits WHERE player_frequency=8) +
       (SELECT hits FROM player5.hits WHERE player_frequency=9) +
       (SELECT hits FROM player5.hits WHERE player_frequency=10) AS player_5,
       (SELECT hits FROM player6.hits WHERE player_frequency=1) +
       (SELECT hits FROM player6.hits WHERE player_frequency=2) +
       (SELECT hits FROM player6.hits WHERE player_frequency=3) +
       (SELECT hits FROM player6.hits WHERE player_frequency=4) +
       (SELECT hits FROM player6.hits WHERE player_frequency=5) +
       (SELECT hits FROM player6.hits WHERE player_frequency=6) +
       (SELECT hits FROM player6.hits WHERE player_frequency=7) +
       (SELECT hits FROM player6.hits WHERE player_frequency=8) +
       (SELECT hits FROM player6.hits WHERE player_frequency=9) +
       (SELECT hits FROM player6.hits WHERE player_frequency=10) AS player_6,
       (SELECT hits FROM player7.hits WHERE player_frequency=1) +
       (SELECT hits FROM player7.hits WHERE player_frequency=2) +
       (SELECT hits FROM player7.hits WHERE player_frequency=3) +
       (SELECT hits FROM player7.hits WHERE player_frequency=4) +
       (SELECT hits FROM player7.hits WHERE player_frequency=5) +
       (SELECT hits FROM player7.hits WHERE player_frequency=6) +
       (SELECT hits FROM player7.hits WHERE player_frequency=7) +
       (SELECT hits FROM player7.hits WHERE player_frequency=8) +
       (SELECT hits FROM player7.hits WHERE player_frequency=9) +
       (SELECT hits FROM player7.hits WHERE player_frequency=10) AS player_7,
       (SELECT hits FROM player8.hits WHERE player_frequency=1) +
       (SELECT hits FROM player8.hits WHERE player_frequency=2) +
       (SELECT hits FROM player8.hits WHERE player_frequency=3) +
       (SELECT hits FROM player8.hits WHERE player_frequency=4) +
       (SELECT hits FROM player8.hits WHERE player_frequency=5) +
       (SELECT hits FROM player8.hits WHERE player_frequency=6) +
       (SELECT hits FROM player8.hits WHERE player_frequency=7) +
       (SELECT hits FROM player8.hits WHERE player_frequency=8) +
       (SELECT hits FROM player8.hits WHERE player_frequency=9) +
       (SELECT hits FROM player8.hits WHERE player_frequency=10) AS player_8,
       (SELECT hits FROM player9.hits WHERE player_frequency=1) +
       (SELECT hits FROM player9.hits WHERE player_frequency=2) +
       (SELECT hits FROM player9.hits WHERE player_frequency=3) +
       (SELECT hits FROM player9.hits WHERE player_frequency=4) +
       (SELECT hits FROM player9.hits WHERE player_frequency=5) +
       (SELECT hits FROM player9.hits WHERE player_frequency=6) +
       (SELECT hits FROM player9.hits WHERE player_frequency=7) +
       (SELECT hits FROM player9.hits WHERE player_frequency=8) +
       (SELECT hits FROM player9.hits WHERE player_frequency=9) +
       (SELECT hits FROM player9.hits WHERE player_frequency=10) AS player_9,
       (SELECT hits FROM player10.hits WHERE player_frequency=1) +
       (SELECT hits FROM player10.hits WHERE player_frequency=2) +
       (SELECT hits FROM player10.hits WHERE player_frequency=3) +
       (SELECT hits FROM player10.hits WHERE player_frequency=4) +
       (SELECT hits FROM player10.hits WHERE player_frequency=5) +
       (SELECT hits FROM player10.hits WHERE player_frequency=6) +
       (SELECT hits FROM player10.hits WHERE player_frequency=7) +
       (SELECT hits FROM player10.hits WHERE player_frequency=8) +
       (SELECT hits FROM player10.hits WHERE player_frequency=9) +
       (SELECT hits FROM player10.hits WHERE player_frequency=10) AS player_10;

-- Create function to return the takedown value for a player
CREATE OR REPLACE FUNCTION get_takedown_value(player_frequency integer) RETURNS TABLE (fc json) AS $$ BEGIN IF player_frequency = 1 THEN RETURN QUERY SELECT json_build_object('player_frquency', player_frequency, 'takedowns', player_1) FROM takedowns; ELSIF player_frequency = 2 THEN RETURN QUERY SELECT json_build_object('player_frquency', player_frequency, 'takedowns', player_2) FROM takedowns; ELSIF player_frequency = 3 THEN RETURN QUERY SELECT json_build_object('player_frquency', player_frequency, 'takedowns', player_3) FROM takedowns; ELSIF player_frequency = 4 THEN RETURN QUERY SELECT json_build_object('player_frquency', player_frequency, 'takedowns', player_4) FROM takedowns; ELSIF player_frequency = 5 THEN RETURN QUERY SELECT json_build_object('player_frquency', player_frequency, 'takedowns', player_5) FROM takedowns; ELSIF player_frequency = 6 THEN RETURN QUERY SELECT json_build_object('player_frquency', player_frequency, 'takedowns', player_6) FROM takedowns; ELSIF player_frequency = 7 THEN RETURN QUERY SELECT json_build_object('player_frquency', player_frequency, 'takedowns', player_7) FROM takedowns; ELSIF player_frequency = 8 THEN RETURN QUERY SELECT json_build_object('player_frquency', player_frequency, 'takedowns', player_8) FROM takedowns; ELSIF player_frequency = 9 THEN RETURN QUERY SELECT json_build_object('player_frquency', player_frequency, 'takedowns', player_9) FROM takedowns; ELSIF player_frequency = 10 THEN RETURN QUERY SELECT json_build_object('player_frquency', player_frequency, 'takedowns', player_10) FROM takedowns; ELSE RETURN QUERY SELECT json_build_object('player_frquency', 0, 'takedowns', 0) FROM takedowns; END IF; RETURN; END; $$ LANGUAGE plpgsql;

-- Create function to return the hits value for a player
CREATE OR REPLACE FUNCTION get_hit_value(player_frequency integer) RETURNS TABLE (fc json) AS $$ BEGIN IF player_frequency = 1 THEN RETURN QUERY SELECT json_build_object('player_frquency', player_frequency, 'hits', player_1) FROM hits; ELSIF player_frequency = 2 THEN RETURN QUERY SELECT json_build_object('player_frquency', player_frequency, 'hits', player_2) FROM hits; ELSIF player_frequency = 3 THEN RETURN QUERY SELECT json_build_object('player_frquency', player_frequency, 'hits', player_3) FROM hits; ELSIF player_frequency = 4 THEN RETURN QUERY SELECT json_build_object('player_frquency', player_frequency, 'hits', player_4) FROM hits; ELSIF player_frequency = 5 THEN RETURN QUERY SELECT json_build_object('player_frquency', player_frequency, 'hits', player_5) FROM hits; ELSIF player_frequency = 6 THEN RETURN QUERY SELECT json_build_object('player_frquency', player_frequency, 'hits', player_6) FROM hits; ELSIF player_frequency = 7 THEN RETURN QUERY SELECT json_build_object('player_frquency', player_frequency, 'hits', player_7) FROM hits; ELSIF player_frequency = 8 THEN RETURN QUERY SELECT json_build_object('player_frquency', player_frequency, 'hits', player_8) FROM hits; ELSIF player_frequency = 9 THEN RETURN QUERY SELECT json_build_object('player_frquency', player_frequency, 'hits', player_9) FROM hits; ELSIF player_frequency = 10 THEN RETURN QUERY SELECT json_build_object('player_frquency', player_frequency, 'hits', player_10) FROM hits; ELSE RETURN QUERY SELECT json_build_object('player_frquency', 0, 'hits', 0) FROM hits; END IF; RETURN; END; $$ LANGUAGE plpgsql;

-- Create the function to be used by the triggers on tables (announces a 'watcher' for NodeJS socekt)
CREATE OR REPLACE FUNCTION notify_table_trigger() RETURNS trigger AS $$ DECLARE BEGIN PERFORM pg_notify('watchers', jsonb_merge(get_takedown_value(player_frequency), get_hit_value(player_frequency))); RETURN NULL; END; $$ LANGUAGE plpgsql;

-- Create the function to be used by the triggers on the takedown view (announces a 'watcher' for NodeJS socekt)
--CREATE OR REPLACE FUNCTION notify_takedowns_view_trigger() RETURNS trigger AS $$ DECLARE BEGIN PERFORM pg_notify('watchers', get_takedown_value(NEW.player_frequency)::text); RETURN new; END; $$ LANGUAGE plpgsql;

-- Create the function to be used by the triggers on the hits view (announces a 'watcher' for NodeJS socekt)
--CREATE OR REPLACE FUNCTION notify_hits_view_trigger() RETURNS trigger AS $$ DECLARE BEGIN PERFORM pg_notify('watchers', get_hit_value(NEW.player_frequency)::text); RETURN new; END; $$ LANGUAGE plpgsql;

-- Create trigger for the shots table
--CREATE TRIGGER shots_table_trigger AFTER UPDATE ON shots FOR EACH ROW EXECUTE PROCEDURE notify_table_trigger();

-- Create trigger for the takedown view
--CREATE TRIGGER takedown_view_trigger AFTER UPDATE ON takedowns FOR EACH ROW EXECUTE PROCEDURE notify_takedowns_view_trigger();

-- Create trigger for the hit view
--CREATE TRIGGER hits_view_trigger AFTER UPDATE ON hits EXECUTE FOR EACH ROW PROCEDURE notify_hits_view_trigger();

-- Create all the triggers for the player hit tables
CREATE TRIGGER player1_shots_trigger AFTER UPDATE ON player1.hits FOR EACH ROW EXECUTE PROCEDURE notify_table_trigger();
CREATE TRIGGER player2_shots_trigger AFTER UPDATE ON player2.hits FOR EACH ROW EXECUTE PROCEDURE notify_table_trigger();
CREATE TRIGGER player3_shots_trigger AFTER UPDATE ON player3.hits FOR EACH ROW EXECUTE PROCEDURE notify_table_trigger();
CREATE TRIGGER player4_shots_trigger AFTER UPDATE ON player4.hits FOR EACH ROW EXECUTE PROCEDURE notify_table_trigger();
CREATE TRIGGER player5_shots_trigger AFTER UPDATE ON player5.hits FOR EACH ROW EXECUTE PROCEDURE notify_table_trigger();
CREATE TRIGGER player6_shots_trigger AFTER UPDATE ON player6.hits FOR EACH ROW EXECUTE PROCEDURE notify_table_trigger();
CREATE TRIGGER player7_shots_trigger AFTER UPDATE ON player7.hits FOR EACH ROW EXECUTE PROCEDURE notify_table_trigger();
CREATE TRIGGER player8_shots_trigger AFTER UPDATE ON player8.hits FOR EACH ROW EXECUTE PROCEDURE notify_table_trigger();
CREATE TRIGGER player9_shots_trigger AFTER UPDATE ON player9.hits FOR EACH ROW EXECUTE PROCEDURE notify_table_trigger();
CREATE TRIGGER player10_shots_trigger AFTER UPDATE ON player10.hits FOR EACH ROW EXECUTE PROCEDURE notify_table_trigger();


-- SELECT all the tables and views to check that they are correct
SELECT * FROM shots;

SELECT * FROM player1.hits;
SELECT * FROM player2.hits;
SELECT * FROM player3.hits;
SELECT * FROM player4.hits;
SELECT * FROM player5.hits;
SELECT * FROM player6.hits;
SELECT * FROM player7.hits;
SELECT * FROM player8.hits;
SELECT * FROM player9.hits;
SELECT * FROM player10.hits;

SELECT * FROM hits;
SELECT * FROM takedowns;

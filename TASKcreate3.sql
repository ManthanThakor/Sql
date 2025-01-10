USE soccer2;

CREATE TABLE soccer_country (
    country_id INT PRIMARY KEY,
    country_abbr CHAR(4),
    country_name VARCHAR(40)
);

INSERT INTO soccer_country (country_id, country_abbr, country_name) 
VALUES
    (1, 'AFG', 'abcd'),
    (2, 'IND', 'efgh'),
    (3, 'AUS', 'ijkl');

SELECT * FROM soccer_country;

CREATE TABLE soccer_city (
    city_id INT PRIMARY KEY,
    city_name VARCHAR(25),
    country_id INT
);

INSERT INTO soccer_city (city_id, city_name, country_id) 
VALUES
    (1, 'wxyz', 1),
    (2, 'qrst', 2),
    (3, 'uvwx', 3);

SELECT * FROM soccer_city;

CREATE TABLE soccer_venue (
    venue_id INT PRIMARY KEY,
    venue_name VARCHAR(30),
    city_id INT,
    aud_capacity INT
);

INSERT INTO soccer_venue (venue_id, venue_name, city_id, aud_capacity) 
VALUES
    (1, 'stadium_abc', 1, 50000),
    (2, 'stadium_def', 2, 60000),
    (3, 'stadium_ghi', 3, 55000);

SELECT * FROM soccer_venue;

CREATE TABLE soccer_team (
    team_id INT,
    team_group CHAR(1),
    match_played INT,
    won INT,
    draw INT,
    lost INT,
    goal_for INT,
    goal_against INT,
    goal_diff INT,
    points INT,
    group_position INT
);

INSERT INTO soccer_team (team_id, team_group, match_played, won, draw, lost, goal_for, goal_against, goal_diff, points, group_position) 
VALUES
    (1, 'A', 10, 6, 2, 2, 20, 10, 10, 20, 1),
    (2, 'B', 10, 4, 3, 3, 15, 15, 0, 15, 2),
    (3, 'C', 10, 5, 2, 3, 18, 12, 6, 17, 3);

SELECT * FROM soccer_team;

CREATE TABLE player_mast (
    player_id INT PRIMARY KEY,
    team_id INT,
    jersey_no INT,
    player_name VARCHAR(40),
    pos_to_play CHAR(2),
    dt_of_birth DATE,
    age INT,
    playing_club VARCHAR(40)
);

INSERT INTO player_mast (player_id, team_id, jersey_no, player_name, pos_to_play, dt_of_birth, age, playing_club) 
VALUES
    (1, 1, 10, 'abcd', 'FW', '1995-04-12', 30, 'xyz_club'),
    (2, 2, 7, 'efgh', 'MF', '1993-05-15', 32, 'abc_club'),
    (3, 3, 11, 'ijkl', 'DF', '1990-09-20', 35, 'ghi_club');

SELECT * FROM player_mast;

CREATE TABLE match_mast (
    match_no INT PRIMARY KEY,
    play_stage CHAR(1),
    play_date DATE,
    results CHAR(5),
    decided_by CHAR(1),
    goal_score CHAR(5),
    venue_id INT,
    referee_id INT,
    audience INT,
    pt_of_match INT,
    stop1_sec INT,
    stop2_sec INT
);

INSERT INTO match_mast (match_no, play_stage, play_date, results, decided_by, goal_score, venue_id, referee_id, audience, pt_of_match, stop1_sec, stop2_sec) 
VALUES
    (1, 'G', '2025-01-10', 'W', 'T', '3-1', 1, 1, 50000, 1, 120, 90),
    (2, 'R', '2025-01-12', 'D', 'P', '2-2', 2, 2, 60000, 2, 110, 100),
    (3, 'F', '2025-01-14', 'L', 'P', '1-4', 3, 3, 55000, 3, 130, 120);

SELECT * FROM match_mast;

CREATE TABLE referee_mast (
    referee_id INT PRIMARY KEY,
    referee_name VARCHAR(40),
    country_id INT
);

INSERT INTO referee_mast (referee_id, referee_name, country_id) 
VALUES
    (1, 'abcd', 1),
    (2, 'efgh', 2),
    (3, 'ijkl', 3);

SELECT * FROM referee_mast;

CREATE TABLE coach_mast (
    coach_id INT PRIMARY KEY,
    coach_name VARCHAR(40)
);

INSERT INTO coach_mast (coach_id, coach_name) 
VALUES
    (1, 'abcd'),
    (2, 'efgh'),
    (3, 'ijkl');

SELECT * FROM coach_mast;

CREATE TABLE team_coaches (
    team_id INT,
    coach_id INT
);

INSERT INTO team_coaches (team_id, coach_id) 
VALUES
    (1, 1),
    (2, 2),
    (3, 3);

SELECT * FROM team_coaches;

CREATE TABLE player_booked (
    match_no INT,
    team_id INT,
    player_id INT,
    booking_time VARCHAR(40),
    sent_off CHAR(1),
    play_schedule CHAR(2),
    play_half INT
);

INSERT INTO player_booked (match_no, team_id, player_id, booking_time, sent_off, play_schedule, play_half) 
VALUES
    (1, 1, 1, '40min', 'N', 'H', 1),
    (2, 2, 2, '55min', 'Y', 'A', 2),
    (3, 3, 3, '75min', 'N', 'H', 2);

SELECT * FROM player_booked;

CREATE TABLE player_in_out (
    match_no INT,
    team_id INT,
    player_id INT,
    in_out CHAR(1),
    time_in_out INT,
    play_schedule CHAR(2),
    play_half INT
);

INSERT INTO player_in_out (match_no, team_id, player_id, in_out, time_in_out, play_schedule, play_half) 
VALUES
    (1, 1, 1, 'I', 10, 'H', 1),
    (2, 2, 2, 'O', 45, 'A', 1),
    (3, 3, 3, 'I', 30, 'H', 2);

SELECT * FROM player_in_out;

CREATE TABLE match_details (
    match_no INT,
    play_stage VARCHAR(1),
    team_id INT,
    win_loos VARCHAR(1),
    decided_by VARCHAR(1),
    goal_score INT,
    penailty_score INT,
    ass_ref INT,
    player_gk INT
);

INSERT INTO match_details (match_no, play_stage, team_id, win_loos, decided_by, goal_score, penailty_score, ass_ref, player_gk) 
VALUES
    (1, 'G', 1, 'W', 'T', 3, 0, 1, 1),
    (2, 'R', 2, 'D', 'P', 2, 0, 2, 2),
    (3, 'F', 3, 'L', 'P', 1, 0, 3, 3);

SELECT * FROM match_details;

CREATE TABLE penalty_shootout (
    kick_id INT PRIMARY KEY,
    match_no INT,
    team_id INT,
    player_id INT,
    score_goal VARCHAR(1),
    kick_no INT
);

INSERT INTO penalty_shootout (kick_id, match_no, team_id, player_id, score_goal, kick_no) 
VALUES
    (1, 1, 1, 1, 'Y', 1),
    (2, 2, 2, 2, 'N', 2),
    (3, 3, 3, 3, 'Y', 3);

SELECT * FROM penalty_shootout;

CREATE TABLE goal_details (
    goal_id INT PRIMARY KEY,
    match_no INT,
    player_id INT,
    team_id INT,
    goal_type CHAR(1),
    play_stage CHAR(1),
    goal_schedule VARCHAR(50),
    goal_half INT
);

INSERT INTO goal_details (goal_id, match_no, player_id, team_id, goal_type, play_stage, goal_schedule, goal_half) 
VALUES
    (1, 1, 1, 1, 'N', 'G', '12min', 1),
    (2, 2, 2, 2, 'P', 'R', '23min', 1),
    (3, 3, 3, 3, 'N', 'F', '34min', 2);

SELECT * FROM goal_details;

CREATE TABLE asst_referee_mast (
    ass_ref_id INT PRIMARY KEY,
    ass_ref_name VARCHAR(40),
    country_id INT
);

INSERT INTO asst_referee_mast (ass_ref_id, ass_ref_name, country_id) 
VALUES
    (1, 'abcd', 1),
    (2, 'efgh', 2),
    (3, 'ijkl', 3);

SELECT * FROM asst_referee_mast;

CREATE TABLE match_captain (
    match_no INT,
    team_id INT,
    player_captain INT
);

INSERT INTO match_captain (match_no, team_id, player_captain) 
VALUES
    (1, 1, 1),
    (2, 2, 2),
    (3, 3, 3);

SELECT * FROM match_captain;

CREATE TABLE penalty_gk (
    match_no INT,
    team_id INT,
    player_gk INT
);

INSERT INTO penalty_gk (match_no, team_id, player_gk) 
VALUES
    (1, 1, 1),
    (2, 2, 2),
    (3, 3, 3);

SELECT * FROM penalty_gk;

CREATE TABLE playing_position (
    position_id VARCHAR(2) PRIMARY KEY,
    position_desc VARCHAR(15)
);

INSERT INTO playing_position (position_id, position_desc) 
VALUES
    ('FW', 'Forward'),
    ('MF', 'Midfielder'),
    ('DF', 'Defender');

SELECT * FROM playing_position;

-- Add constraints

ALTER TABLE soccer_city
    ADD CONSTRAINT fk_country_id FOREIGN KEY (country_id) REFERENCES soccer_country(country_id);

ALTER TABLE soccer_venue
	ADD CONSTRAINT fk_city_id FOREIGN KEY (city_id) REFERENCES soccer_city(city_id);

ALTER TABLE match_mast
	ADD CONSTRAINT fk_referee_id FOREIGN KEY (referee_id) REFERENCES referee_mast(referee_id);

ALTER TABLE soccer_team
    ADD CONSTRAINT fk_team_country FOREIGN KEY (team_id) REFERENCES soccer_country(country_id);

ALTER TABLE player_mast
    ADD CONSTRAINT fk_team_id FOREIGN KEY (team_id) REFERENCES soccer_country(country_id);

ALTER TABLE player_booked 
	ADD CONSTRAINT fk_player_booked FOREIGN KEY (team_id) REFERENCES soccer_country(country_id);

ALTER TABLE penalty_shootout
    ADD CONSTRAINT fk_penalty_match FOREIGN KEY (match_no) REFERENCES match_mast(match_no);

ALTER TABLE penalty_shootout
    ADD CONSTRAINT fk_penalty_team FOREIGN KEY (team_id) REFERENCES soccer_team(team_id);

ALTER TABLE soccer_team
    ADD CONSTRAINT uq_team_id UNIQUE (team_id);

ALTER TABLE match_captain
    ADD CONSTRAINT fk_match_captain FOREIGN KEY (match_no) REFERENCES match_mast(match_no);

ALTER TABLE match_captain
    ADD CONSTRAINT fk_team_captain FOREIGN KEY (team_id) REFERENCES soccer_team(team_id);

ALTER TABLE match_captain
    ADD CONSTRAINT fk_player_captain FOREIGN KEY (player_captain) REFERENCES player_mast(player_id);

ALTER TABLE match_details
	ADD CONSTRAINT fk_match_details FOREIGN KEY (match_no) REFERENCES match_mast(match_no);

ALTER TABLE match_details
    ADD CONSTRAINT fk_player_details FOREIGN KEY (player_gk) REFERENCES player_mast(player_id);

ALTER TABLE ass_referee_mast
    ADD CONSTRAINT fk_ass_ref_country FOREIGN KEY (country_id) REFERENCES soccer_country(country_id);

ALTER TABLE goal_details
    ADD CONSTRAINT fk_goal_player FOREIGN KEY (player_id) REFERENCES player_mast(player_id);

ALTER TABLE goal_details
    ADD CONSTRAINT fk_goal_team FOREIGN KEY (team_id) REFERENCES player_mast(player_id);

ALTER TABLE penalty_gk
    ADD CONSTRAINT fk_penalty_gk_match FOREIGN KEY (match_no) REFERENCES match_mast(match_no);

ALTER TABLE penalty_gk
    ADD CONSTRAINT fk_penalty_gk_team FOREIGN KEY (team_id) REFERENCES soccer_country(country_id);

ALTER TABLE penalty_gk
    ADD CONSTRAINT fk_penalty_gk_player FOREIGN KEY (player_gk) REFERENCES player_mast(player_id);

ALTER TABLE player_in_out 
	ADD CONSTRAINT fk_player_in_out FOREIGN KEY (match_no) REFERENCES match_mast(match_no);

ALTER TABLE player_in_out
	ADD CONSTRAINT fk_player_in_out_team FOREIGN KEY (team_id) REFERENCES soccer_country(country_id);

ALTER TABLE player_in_out
	ADD CONSTRAINT fk_player_id FOREIGN KEY (player_id) REFERENCES player_mast(player_id);

ALTER TABLE team_coaches
    ADD CONSTRAINT fk_team_coach FOREIGN KEY (team_id) REFERENCES soccer_team(team_id);

ALTER TABLE team_coaches
    ADD CONSTRAINT fk_coach_id FOREIGN KEY (coach_id) REFERENCES coach_mast(coach_id);

ALTER TABLE referee_mast
	ADD CONSTRAINT fk_referee_mast FOREIGN KEY (country_id) REFERENCES soccer_country(country_id);

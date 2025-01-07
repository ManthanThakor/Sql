CREATE DATABASE soccer;

USE soccer;

CREATE TABLE soccer_country (
    country_id INT PRIMARY KEY,
    country_abbr CHAR(4),
    country_name VARCHAR(40)
);

CREATE TABLE soccer_city (
  city_id INT PRIMARY KEY,
    city_name VARCHAR(25),
    country_id INT 
);

CREATE TABLE soccer_venue (
    venue_id INT PRIMARY KEY,
    venue_name VARCHAR(30),
    city_id INT,
    aud_capacity INT 
);

CREATE TABLE soccer_team (
    team_id INT,
    team_group CHAR(1) ,
    match_played INT ,
    won INT ,
    draw INT ,
    lost INT ,
    goal_for INT ,
    goal_against INT ,
    goal_diff INT ,
    points INT ,
    group_position INT 
);

CREATE TABLE player_mast (
    player_id INT PRIMARY KEY,
    team_id INT ,
    jersey_no INT ,
    player_name VARCHAR(40) ,
    pos_to_play CHAR(2) ,
    dt_of_birth DATE ,
    age INT ,
    playing_club VARCHAR(40) 
);

CREATE TABLE match_mast (
    match_no INT PRIMARY KEY,
    play_stage CHAR(1) ,
    play_date DATE ,
    results CHAR(5) ,
    decided_by CHAR(1) ,
    goal_score CHAR(5) ,
    venue_id INT ,
    referee_id INT ,
    audience INT ,
    pt_of_match INT ,
    stop1_sec INT ,
    stop2_sec INT 
);

CREATE TABLE referee_mast (
    referee_id INT PRIMARY KEY,
    referee_name VARCHAR(40) ,
    country_id INT 
);

CREATE TABLE coach_mast (
    coach_id INT PRIMARY KEY,
    coach_name VARCHAR(40) 
);

CREATE TABLE team_coaches (
    team_id INT ,
    coach_id INT ,
);

CREATE TABLE player_booked (
    match_no INT ,
    team_id INT ,
    player_id INT ,
    booking_time VARCHAR(40) ,
    sent_off CHAR(1),
    play_schedule CHAR(2),
    play_half INT,
);

CREATE TABLE player_in_out (
    match_no INT ,
    team_id INT ,
    player_id INT ,
	in_out CHAR(1),
    time_in_out INT ,
    play_schedule CHAR(2),
    play_half INT,
);

CREATE TABLE match_details (
	match_no INT,
	play_stage VARCHAR(1),
	team_id INT,
	win_loos VARCHAR(1),
	decided_by VARCHAR(1),
	goal_score INT,
	penailty_score INT,
	ass_ref INT,
	player_gk INT,
);

CREATE TABLE penalty_shootout (
    kick_id INT PRIMARY KEY,
    match_no INT ,
    team_id INT ,
    player_id INT ,
    score_goal VARCHAR(1),
    kick_no INT
);

CREATE TABLE goal_details (
    goal_id INT PRIMARY KEY,
    match_no INT ,
    player_id INT ,
    team_id INT ,
    goal_type CHAR(1) ,
    play_stage CHAR(1),
    goal_schedule CHAR(2),
    goal_half INT
);

CREATE TABLE asst_referee_mast (
    ass_ref_id INT PRIMARY KEY,
    ass_ref_name VARCHAR(40) ,
    country_id INT 
);

CREATE TABLE match_captain (
    match_no INT ,
    team_id INT ,
    player_captain INT ,
);

CREATE TABLE penalty_gk (
    match_no INT ,
    team_id INT ,
    player_gk INT ,
);

CREATE TABLE playing_position(
	position_id VARCHAR(2) PRIMARY KEY ,
	position_desc VARCHAR(15)
);


USE soccer;


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
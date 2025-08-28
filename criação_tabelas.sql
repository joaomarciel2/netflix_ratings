CREATE TABLE weeks_countries(
country_name VARCHAR(300),
country_iso2 VARCHAR(10),
dt_week DATE,
category VARCHAR(100),
weekly_rank INT,
show_title VARCHAR(300),
season_title VARCHAR(300),
cumulative_weeks_in_top_10 INT 
);

CREATE TABLE weeks_global(
dt_week DATE,
category VARCHAR(300),
weekly_rank INT,
show_title VARCHAR(300),
season_title VARCHAR(300),
weekly_hours_viewed INT,
cumulative_weeks_in_top_10 INT 
);

CREATE TABLE most_popular(
category VARCHAR(300),
dt_rank INT,
show_title VARCHAR(300),
season_title VARCHAR(300),
hours_viewed_first_28_days INT 
);

LOAD DATA INFILE "C:/ProgramData/MySQL/MySQL Server 8.0/Uploads/all-weeks-countries.csv"
INTO TABLE weeks_countries
FIELDS TERMINATED BY ',' ENCLOSED BY '"'
LINES TERMINATED BY '\n'
IGNORE 1 ROWS;

LOAD DATA INFILE "C:/ProgramData/MySQL/MySQL Server 8.0/Uploads/all-weeks-global.csv"
INTO TABLE weeks_global
FIELDS TERMINATED BY ',' ENCLOSED BY '"'
LINES TERMINATED BY '\n'
IGNORE 1 ROWS;

LOAD DATA INFILE "C:/ProgramData/MySQL/MySQL Server 8.0/Uploads/most-popular.csv"
INTO TABLE most_popular
FIELDS TERMINATED BY ',' ENCLOSED BY '"'
LINES TERMINATED BY '\n'
IGNORE 1 ROWS;


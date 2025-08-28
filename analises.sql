# Quais as 10 séries que ficaram mais semanas consecutivas no TOP 10 no Brasil?
SELECT show_title,
MAX(cumulative_weeks_in_top_10) AS 'max_weeks',
MIN(weekly_rank) AS 'posicao_maxima_rank',
MAX(weekly_rank) AS 'posicao_minima_rank'
FROM weeks_countries
WHERE country_name = 'Brazil' AND
category = "TV"
GROUP BY show_title
ORDER BY max_weeks DESC
LIMIT 10;

# E os filmes que ficaram mais semanas consecutivas no TOP 10 no Brasil?
SELECT show_title,
MAX(cumulative_weeks_in_top_10) AS 'max_weeks',
MIN(weekly_rank) AS 'max_rank',
MAX(weekly_rank) AS 'min_rank'
FROM weeks_countries
WHERE country_name = 'Brazil' AND
category = "Films"
GROUP BY show_title
ORDER BY max_weeks DESC
LIMIT 10;

# Qual filme teve mais horas assistidas globalmente em uma semana?
SELECT
dt_week,
show_title,
MAX(weekly_hours_viewed) AS 'weekly_hours_viewed',
ROUND((weekly_hours_viewed / 7), 2) AS 'avg_weekly_hours_day'
FROM weeks_global
WHERE category IN ("Films (English)", "Films (Non-English)")
GROUP BY dt_week, show_title, avg_weekly_hours_day
ORDER BY weekly_hours_viewed DESC
LIMIT 1;

# Qual série teve mais horas assistidas globalmente em uma semana?
SELECT
dt_week,
show_title,
MAX(weekly_hours_viewed) AS 'weekly_hours_viewed',
ROUND((weekly_hours_viewed / 7), 2) AS 'avg_weekly_hours_day'
FROM weeks_global
WHERE category IN ("TV (English)", "TV (Non-English)")
GROUP BY dt_week, show_title, avg_weekly_hours_day
ORDER BY weekly_hours_viewed DESC
LIMIT 1;

# Quais filmes foram mais populares globalmente?
SELECT 
show_title,
SUM(weekly_hours_viewed) AS 'sum_weekly_hours_viewed',
COUNT(show_title) AS 'appearances_rank'
FROM weeks_global
WHERE category IN ("Films (Non-English)", "Films (English)")
GROUP BY show_title
ORDER BY sum_weekly_hours_viewed DESC
LIMIT 10;

# E série?
SELECT 
show_title,
SUM(weekly_hours_viewed) AS 'sum_weekly_hours_viewed',
COUNT(show_title) AS 'appearances_rank'
FROM weeks_global
WHERE category IN ("TV (Non-English)", "TV (English)")
GROUP BY show_title
ORDER BY sum_weekly_hours_viewed DESC
LIMIT 10;

# Qual país teve a maior diversidade de títulos no TOP 10 durante todo o período?
SELECT
country_name,
COUNT(DISTINCT show_title) AS 'unique_titles_count'
FROM weeks_countries
GROUP BY country_name
ORDER BY unique_titles_count DESC
LIMIT 3;

# Qual semana teve o maior número de horas assistidas globalmente para séries em inglês?
SELECT
dt_week,
SUM(weekly_hours_viewed) AS 'total_hours'
FROM weeks_global
WHERE category = "TV (English)"
GROUP BY dt_week
ORDER BY total_hours DESC
LIMIT 1;

# Liste os 10 filmes ou séries que apareceram em mais países simultaneamente no TOP 10 em uma mesma semana.
SELECT
dt_week,
show_title,
COUNT(DISTINCT country_name) AS 'countries_count'
FROM weeks_countries
WHERE category IN ("Films")
GROUP BY dt_week, show_title
ORDER BY countries_count DESC
LIMIT 10;

SELECT
dt_week,
show_title,
COUNT(DISTINCT country_name) AS 'countries_count'
FROM weeks_countries
WHERE category IN ("TV")
GROUP BY dt_week, show_title
ORDER BY countries_count DESC
LIMIT 10;


# Quais títulos entraram no TOP 10 global e não estavam no TOP 10 da América do Sul naquela semana?
SELECT
g.show_title,
COUNT(g.show_title) AS 'count_titles'
FROM weeks_global g
LEFT JOIN weeks_countries c
ON g.show_title = c.show_title AND
g.dt_week = c.dt_week AND
c.country_name IN ('Argentina', 'Bolivia', 'Brazil', 'Chile', 'Colombia', 'Ecuador', 'Guyana', 'Paraguay', 'Peru', 'Suriname', 'Uruguay', 'Venezuela')
WHERE c.show_title IS NULL AND
g.category IN ("TV (English)", "TV (Non-English)")
GROUP BY g.show_title
ORDER BY count_titles DESC;

SELECT
g.show_title,
COUNT(g.show_title) AS 'count_titles'
FROM weeks_global g
LEFT JOIN weeks_countries c
ON g.show_title = c.show_title AND
g.dt_week = c.dt_week AND
c.country_name IN ('Argentina', 'Bolivia', 'Brazil', 'Chile', 'Colombia', 'Ecuador', 'Guyana', 'Paraguay', 'Peru', 'Suriname', 'Uruguay', 'Venezuela')
WHERE c.show_title IS NULL AND
g.category IN ("Films (English)", "Films (Non-English)")
GROUP BY g.show_title
ORDER BY count_titles DESC;




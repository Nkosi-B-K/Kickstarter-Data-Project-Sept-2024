#database and table for kickstarter project was set up using database and table import wizards.
# DATA SOURCE - KAGGLE

USE ksprojects;

SELECT * FROM ks_projects
ORDER BY deadline ASC;

## I want to know the most sought after main categories in Kickstarter
select main_category, count(main_category) as main_category_no
FROM ks_projects
GROUP BY main_category
ORDER BY main_category_no DESC;

SELECT DISTINCT state
from ks_projects;

SELECT *
FROM ks_projects;

#I WOULD LIKE TO UNDERSTAND THE TIMEFRAME THIS DATASET COVERS IN ORDER TO DRAW A BETTER UNDERSTANDING OF POSSIBLE TRENDS
SELECT MIN(deadline)
FROM ks_projects;
#2009-07-15

SELECT MAX(deadline)
FROM ks_projects;
#2018-02-06

#2010 was a FIFA WORLD CUP YEAR - I WANT TO KNOW WHAT TRENDS MAY PICKED UP IN THAT YEAR
SELECT main_category, COUNT(DISTINCT deadline) AS number_of_deadlines
FROM ks_projects
WHERE deadline BETWEEN '2010-01-01' AND '2010-12-31'
GROUP BY main_category
ORDER BY number_of_deadlines DESC;

#THE TREND IS NOTHING TO NOTE ALTHOUGH FILM AND VIDEO HAD HIGHER SUBMISSIONS DURING THE YEAR 2010
# I WILL DIG DEEPER BY LOOKING INTO THE categories which had deadlines in the same time period

SELECT DISTINCT category
FROM ks_projects;

SELECT DISTINCT main_category
FROM ks_projects;

SELECT main_category, category, country, COUNT(deadline) AS number_of_deadlines
FROM ks_projects
WHERE deadline BETWEEN '2010-01-01' AND '2010-12-31'
GROUP BY main_category, category, country
ORDER BY number_of_deadlines DESC;

#ULTIMATELY THERE ARE NO SIGNIFICANT TRENDS IN THIS PERIOD WITH CONSIDERATION GIVEN TO THE FIFA WORLD CUP
#THE EVENT ONLY TOOK PLACE FROM 11 - 10 JULY AND DRAWS MAJOR SPONSORS AND BROADCASTERS THIS MIGHT BE CAUSE SUCH LOW KICKSTARTER EFFORTS

SELECT *
FROM ks_projects;

#I WOULD LIKE TO SEE A KICKSTARTER USAGE COMPARISON BETWEEN COUNTRIES WITH THE PREDICITION THAT THE SERVICE IS USED
#MOSTLY IN THE USE

SELECT DISTINCT country
FROM ks_projects;


SELECT country, count(country) as country_frequency
FROM ks_projects
GROUP BY country
ORDER BY country_frequency DESC;

SELECT *
FROM ks_projects;

# I WOULD LIKE TO SEE WHERE THE MOST SUCCESSFUL KICKSTARTER INITIATIVES ORIGINATE FROM BY COUNTRY
# I WOULD ALSO LIKE TO SEE WHERE MOST FAILURE HAVE OCCURRED
# IT WOULD ALSO BE INTERESTING TO VIEW CONDITIONS UNDERWHICH SUSPENSIONS TAKE PLACE AND WHICH COUNTRIES
# ENCOUNTERED THE MOST SUSPENSIONS

SELECT DISTINCT state
FROM ks_projects;

SELECT country, state, count(state) as no_of_failed
FROM ks_projects
WHERE state = 'failed'
GROUP BY state, country
ORDER BY no_of_failed DESC;

SELECT country, state, count(state) as no_of_successful
FROM ks_projects
WHERE state = 'successful'
GROUP BY state, country
ORDER BY no_of_successful DESC;

SELECT country,
       SUM(CASE WHEN state = 'failed' THEN 1 ELSE 0 END) AS no_of_failed,
       SUM(CASE WHEN state = 'successful' THEN 1 ELSE 0 END) AS no_of_successful
FROM ks_projects
GROUP BY country
ORDER BY no_of_failed DESC, no_of_successful DESC
LIMIT 10;

SELECT country, state, count(state) as no_of_suspended
FROM ks_projects
WHERE state = 'suspended'
GROUP BY state, country
ORDER BY no_of_suspended DESC;

#THE DATA CONCERNING SUSPENSIONS SHOWS ONLY ONE SUSPENSION IN THE TIME PERIOD OF THE DATA
#THAT IS, ONE SUSPENSION IN THE US.

SELECT *
FROM ks_projects;

#I WOULD LIKE TO SEE WHAT THE AVERAGE GOAL PER COUNTRY IS - WITH THE ASSUMPTION MADE THAT THE HGIHEST AVERAGE WILL
#BE SEEIN THE US GIVEN THE RESULTS OF PREVIOUS DATA EXTRACTION. 

SELECT country, ROUND(AVG(goal), 2) as avg_goal_by_country
FROM ks_projects
GROUP BY country
ORDER BY avg_goal_by_country DESC;

SELECT ID, state, country
FROM ks_projects
WHERE state = 'live';

SELECT category, COUNT(pledged) AS total_pledged
FROM ks_projects
GROUP BY category
ORDER BY total_pledged DESC
LIMIT 10;

SELECT * 
from ks_projects;

SELECT category, COUNT(pledged) AS total_pledged
FROM ks_projects
where category = 'Product Design';
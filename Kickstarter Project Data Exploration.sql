
-- Kickstarter Data Exploration
-- Scenario: The product team is considering launching a campaign on Kickstarter to test the viability of some offerings.
-- I've been asked to pull data that will help the team understand what might influence the success of a campaign.

SELECT *
FROM ks_prj;


-- Top 10 successful projects with most amount of money pledged.

SELECT `name`, main_category, goal_usd, pledged_usd
FROM ks_prj
WHERE state = 'successful'
ORDER BY pledged_usd DESC
LIMIT 10;


-- Top 10 successful projects with most amount of backers.

SELECT `name`, main_category, backers
FROM ks_prj
WHERE state = 'successful'
ORDER BY backers DESC
LIMIT 10;


-- Since we are a company, we want to consider a project of at least 100 backers and at least $20,000 pledged.
-- Using CTEs to find the percentage of success of main categories
-- Successful main categories / Total main categories

WITH success_main_cat AS
(
SELECT main_category, COUNT(main_category) AS c_success
FROM ks_prj
WHERE state = 'successful'
AND backers >= 100
AND pledged_usd >= 20000
GROUP BY main_category
),
total AS
(
SELECT main_category, COUNT(main_category) AS c_total
FROM ks_prj
GROUP BY main_category
)
SELECT t.main_category,
ROUND(((smc.c_success/ t.c_total) * 100), 1) AS pct_success
FROM total t
JOIN success_main_cat smc
ON t.main_category = smc.main_category
GROUP BY t.main_category
ORDER BY pct_success DESC;


-- Looking at failed projects with at least 100 backers and at least $20,000 pledged and percentage pledged.

SELECT `name`, main_category, goal_usd, pledged_usd, 
ROUND((pledged_usd/goal_usd) * 100, 1) AS pct_pledged,
backers, deadline, launched
FROM ks_prj
WHERE state = 'failed'
AND backers >= 100
AND pledged_usd >= 20000;


-- Calculate averages for goal, pledged amounts, backers, pledged per backer with success metrics
-- Amount of time if takes for a project to be successful according to the main categories

WITH prj_size AS
(
SELECT main_category,
ROUND(AVG(goal_usd)) AS avg_goal, 
ROUND(AVG(pledged_usd)) AS avg_pledged,
ROUND(AVG(backers)) AS avg_backers,
SUM(pledged_usd) AS pledged_sum, 
SUM(backers) AS backers_sum,
SUM(DATEDIFF(deadline, launched)) AS ks_days
FROM ks_prj
WHERE state = 'successful'
AND backers >= 100
AND pledged_usd >= 20000
GROUP BY main_category
)
SELECT main_category, avg_goal, avg_pledged, avg_backers,
ROUND((pledged_sum/backers_sum)) AS pledged_per_backer,
ks_days, 
ROUND((ks_days/365) * 12) AS ks_months
FROM prj_size
GROUP BY main_category
ORDER BY avg_pledged DESC;


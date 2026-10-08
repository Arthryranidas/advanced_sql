/*Find the “best-value” skills for Data Analysts
 Business Requirement- Management wants to identify skills that are both highly demanded and associated with high-paying Data Analyst jobs. Return skills where demand is above the average skill demand and the skill's average salary is above the overall Data Analyst average salary. Rank them by salary.*/
 --1. First answer this ques as your first step: "How demanded and how well-paid is each skill?"
 --for that, we need to make a CTE which will have demand for each skill and average salary for each skill.
--calculates demand + average salary for each skill.
WITH skill_stats AS (
    SELECT s.skills AS skills,
           COUNT(*) AS demand_count,
           ROUND(AVG(j.salary_year_avg),0) AS avg_salary
    FROM job_postings_fact AS j
    JOIN skills_job_dim AS sj ON j.job_id = sj.job_id
    JOIN skills_dim AS s ON sj.skill_id = s.skill_id
    WHERE j.job_title = 'Data Analyst' AND j.salary_year_avg IS NOT NULL
    GROUP BY s.skills
),
benchmarks AS (
    SELECT ROUND(AVG(demand_count),0) AS avg_demand,
           ROUND(AVG(avg_salary),0) AS avg_sal
    FROM skill_stats
 )
 
--then join the tables and query the skills that have demand and salary above the average benchmarks.

 SELECT ss.skills AS skill,
        ss.demand_count AS demand,
        ss.avg_salary AS salary
 FROM skill_stats AS ss
 CROSS JOIN benchmarks AS b
 WHERE ss.demand_count > b.avg_demand AND   --we dont use 'ON' for cross join
    ss.avg_salary > b.avg_sal
 ORDER BY salary DESC;        

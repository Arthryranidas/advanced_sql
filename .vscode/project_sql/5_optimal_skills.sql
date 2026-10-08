/*what are the most optimal skills to learn (aka its in high demand and high-paying skill
--identify skills in high demand with high avg salaries for data analyst roles,
--concentrate on remote position with specified salaries
--Q.  Top 5 most demanded Data Analyst skills + their average salaries*/

SELECT 
    skills_dim.skills AS skill,
    COUNT(*) AS demand_count,
    ROUND(AVG(job_postings_fact.salary_year_avg), 0) AS avg_salary
FROM job_postings_fact
INNER JOIN skills_job_dim
    ON job_postings_fact.job_id = skills_job_dim.job_id
INNER JOIN skills_dim
    ON skills_job_dim.skill_id = skills_dim.skill_id
WHERE job_postings_fact.job_title_short = 'Data Analyst'
    AND job_postings_fact.salary_year_avg IS NOT NULL
GROUP BY skills_dim.skills
HAVING COUNT(*) > 10
ORDER BY avg_salary DESC, demand_count DESC
LIMIT 25;
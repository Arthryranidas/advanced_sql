/*
use the top 10 highest paying jobs from the first query, keep this query as a CTE 
AND THEN, add the specific skills required for this roles, for that
we need to join (inner join) the top_paying_jobs table with the skills_job_dim and then finally with the skills_dim table because we cant directly join the skills_dim with the top_paying_jobs table.
now why inner join between TPJ table and sjd table? because we only want jobs with having skills, we dont care the jobs which have no skills at all. so it must be the common one, having both job and its skill,so we use INNER JOIN.
End the query with ORDER BY salary_year_avg DESC, so that we can see the highest paying jobs with their skills at the top of the result set.
the final line is useful even though you already used ORDER BY in the CTE, because the CTE's ordering is for selecting the top 10, while the final ordering is for the final output to set the salary and get in desc order.
*/
WITH top_paying_jobs AS (
    SELECT job_id, job_title_short,
        salary_year_avg, job_location,
        c.name AS company_name
    FROM job_postings_fact AS j
    LEFT JOIN company_dim AS c ON j.company_id = c.company_id
        WHERE salary_year_avg IS NOT NULL AND job_title_short = 'Data Analyst' AND job_location= 'Anywhere'
        ORDER BY salary_year_avg DESC
        LIMIT 10
)

SELECT top_paying_jobs.*, skills_dim.skills AS skill_name
 FROM top_paying_jobs 
INNER JOIN skills_job_dim ON top_paying_jobs.job_id = skills_job_dim.job_id
INNER JOIN skills_dim ON skills_job_dim.skill_id = skills_dim.skill_id
ORDER BY salary_year_avg DESC;

/*what are the top demanded skills in the job market for data analyst?
join job postings to inner join table similar to query2 
identify top5 in demand skills for data analyst
focus on all job postings. why? because we want to see the overall demand across the entire market */

SELECT job_title_short, skills ,
    COUNT(*) AS job_count 
 FROM job_postings_fact
INNER JOIN skills_job_dim ON job_postings_fact.job_id = skills_job_dim.job_id
INNER JOIN skills_dim ON skills_job_dim.skill_id = skills_dim.skill_id
WHERE job_title_short = 'Data Analyst'
GROUP BY skills,job_title_short
ORDER BY COUNT(*) DESC
LIMIT 5;

/*
This query retrieves the top paying jobs for a specific role and location including with company names.
salary should not be null, job title should be 'Data Analyst', and job location should be 'Anywhere'.
*/
SELECT job_title_short,
    salary_year_avg, job_location, c.name AS company_name
 FROM job_postings_fact AS j
 LEFT JOIN company_dim AS c ON j.company_id = c.company_id
    WHERE salary_year_avg IS NOT NULL AND job_title_short = 'Data Analyst' AND job_location= 'Anywhere'
    ORDER BY salary_year_avg DESC
    LIMIT 10;
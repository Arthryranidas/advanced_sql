/* Find companies offering unusually high-paying Data Analyst jobs
🏢Business Requirement
The recruitment team wants to identify companies whose Data Analyst jobs have an average salary higher than the overall Data Analyst salary, while also having at least 5 Data Analyst postings. Show the companies ranked by average salary.*/
WITH high_paying_companies AS (
    SELECT cd.name AS company_name,
        ROUND(AVG(j.salary_year_avg)) AS avg_sal_data_analyst
    FROM job_postings_fact AS j
    INNER JOIN company_dim AS cd ON j.company_id = cd.company_id
    WHERE j.job_title = 'Data Analyst'
    AND j.salary_year_avg IS NOT NULL
    GROUP BY cd.name
    HAVING COUNT(*) >= 5
),
--OVERALL BENCHMARK: Calculate the overall average salary for Data Analyst jobs across all companies
    overall_avg_salary AS (
    SELECT ROUND(AVG(salary_year_avg)) AS overall_avg_salary
    FROM job_postings_fact
    WHERE job_title = 'Data Analyst'
    AND salary_year_avg IS NOT NULL
    )

SELECT company_name, avg_sal_data_analyst, overall_avg_salary
 FROM high_paying_companies
    CROSS JOIN overall_avg_salary
    WHERE avg_sal_data_analyst > overall_avg_salary
    ORDER BY avg_sal_data_analyst DESC
    ;
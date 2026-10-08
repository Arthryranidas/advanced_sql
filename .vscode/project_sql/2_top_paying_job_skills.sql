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

/* below one is the json copy of the above file, so it is optional and simply kept here
[
  {
    "job_id": 552322,
    "job_title_short": "Data Analyst",
    "salary_year_avg": "255829.5",
    "job_location": "Anywhere",
    "company_name": "AT&T",
    "skill_name": "sql"
  },
  {
    "job_id": 552322,
    "job_title_short": "Data Analyst",
    "salary_year_avg": "255829.5",
    "job_location": "Anywhere",
    "company_name": "AT&T",
    "skill_name": "python"
  },
  {
    "job_id": 552322,
    "job_title_short": "Data Analyst",
    "salary_year_avg": "255829.5",
    "job_location": "Anywhere",
    "company_name": "AT&T",
    "skill_name": "r"
  },
  {
    "job_id": 552322,
    "job_title_short": "Data Analyst",
    "salary_year_avg": "255829.5",
    "job_location": "Anywhere",
    "company_name": "AT&T",
    "skill_name": "azure"
  },
  {
    "job_id": 552322,
    "job_title_short": "Data Analyst",
    "salary_year_avg": "255829.5",
    "job_location": "Anywhere",
    "company_name": "AT&T",
    "skill_name": "databricks"
  },
  {
    "job_id": 552322,
    "job_title_short": "Data Analyst",
    "salary_year_avg": "255829.5",
    "job_location": "Anywhere",
    "company_name": "AT&T",
    "skill_name": "aws"
  },
  {
    "job_id": 552322,
    "job_title_short": "Data Analyst",
    "salary_year_avg": "255829.5",
    "job_location": "Anywhere",
    "company_name": "AT&T",
    "skill_name": "pandas"
  },
  {
    "job_id": 552322,
    "job_title_short": "Data Analyst",
    "salary_year_avg": "255829.5",
    "job_location": "Anywhere",
    "company_name": "AT&T",
    "skill_name": "pyspark"
  },
  {
    "job_id": 552322,
    "job_title_short": "Data Analyst",
    "salary_year_avg": "255829.5",
    "job_location": "Anywhere",
    "company_name": "AT&T",
    "skill_name": "jupyter"
  },
  {
    "job_id": 552322,
    "job_title_short": "Data Analyst",
    "salary_year_avg": "255829.5",
    "job_location": "Anywhere",
    "company_name": "AT&T",
    "skill_name": "excel"
  },
  {
    "job_id": 552322,
    "job_title_short": "Data Analyst",
    "salary_year_avg": "255829.5",
    "job_location": "Anywhere",
    "company_name": "AT&T",
    "skill_name": "tableau"
  },
  {
    "job_id": 552322,
    "job_title_short": "Data Analyst",
    "salary_year_avg": "255829.5",
    "job_location": "Anywhere",
    "company_name": "AT&T",
    "skill_name": "power bi"
  },
  {
    "job_id": 552322,
    "job_title_short": "Data Analyst",
    "salary_year_avg": "255829.5",
    "job_location": "Anywhere",
    "company_name": "AT&T",
    "skill_name": "powerpoint"
  },
  {
    "job_id": 99305,
    "job_title_short": "Data Analyst",
    "salary_year_avg": "232423.0",
    "job_location": "Anywhere",
    "company_name": "Pinterest Job Advertisements",
    "skill_name": "sql"
  },
  {
    "job_id": 99305,
    "job_title_short": "Data Analyst",
    "salary_year_avg": "232423.0",
    "job_location": "Anywhere",
    "company_name": "Pinterest Job Advertisements",
    "skill_name": "python"
  },
  {
    "job_id": 99305,
    "job_title_short": "Data Analyst",
    "salary_year_avg": "232423.0",
    "job_location": "Anywhere",
    "company_name": "Pinterest Job Advertisements",
    "skill_name": "r"
  },
  {
    "job_id": 99305,
    "job_title_short": "Data Analyst",
    "salary_year_avg": "232423.0",
    "job_location": "Anywhere",
    "company_name": "Pinterest Job Advertisements",
    "skill_name": "hadoop"
  },
  {
    "job_id": 99305,
    "job_title_short": "Data Analyst",
    "salary_year_avg": "232423.0",
    "job_location": "Anywhere",
    "company_name": "Pinterest Job Advertisements",
    "skill_name": "tableau"
  },
  {
    "job_id": 1021647,
    "job_title_short": "Data Analyst",
    "salary_year_avg": "217000.0",
    "job_location": "Anywhere",
    "company_name": "Uclahealthcareers",
    "skill_name": "sql"
  },
  {
    "job_id": 1021647,
    "job_title_short": "Data Analyst",
    "salary_year_avg": "217000.0",
    "job_location": "Anywhere",
    "company_name": "Uclahealthcareers",
    "skill_name": "crystal"
  },
  {
    "job_id": 1021647,
    "job_title_short": "Data Analyst",
    "salary_year_avg": "217000.0",
    "job_location": "Anywhere",
    "company_name": "Uclahealthcareers",
    "skill_name": "oracle"
  },
  {
    "job_id": 1021647,
    "job_title_short": "Data Analyst",
    "salary_year_avg": "217000.0",
    "job_location": "Anywhere",
    "company_name": "Uclahealthcareers",
    "skill_name": "tableau"
  },
  {
    "job_id": 1021647,
    "job_title_short": "Data Analyst",
    "salary_year_avg": "217000.0",
    "job_location": "Anywhere",
    "company_name": "Uclahealthcareers",
    "skill_name": "flow"
  },
  {
    "job_id": 168310,
    "job_title_short": "Data Analyst",
    "salary_year_avg": "205000.0",
    "job_location": "Anywhere",
    "company_name": "SmartAsset",
    "skill_name": "sql"
  },
  {
    "job_id": 168310,
    "job_title_short": "Data Analyst",
    "salary_year_avg": "205000.0",
    "job_location": "Anywhere",
    "company_name": "SmartAsset",
    "skill_name": "python"
  },
  {
    "job_id": 168310,
    "job_title_short": "Data Analyst",
    "salary_year_avg": "205000.0",
    "job_location": "Anywhere",
    "company_name": "SmartAsset",
    "skill_name": "go"
  },
  {
    "job_id": 168310,
    "job_title_short": "Data Analyst",
    "salary_year_avg": "205000.0",
    "job_location": "Anywhere",
    "company_name": "SmartAsset",
    "skill_name": "snowflake"
  },
  {
    "job_id": 168310,
    "job_title_short": "Data Analyst",
    "salary_year_avg": "205000.0",
    "job_location": "Anywhere",
    "company_name": "SmartAsset",
    "skill_name": "pandas"
  },
  {
    "job_id": 168310,
    "job_title_short": "Data Analyst",
    "salary_year_avg": "205000.0",
    "job_location": "Anywhere",
    "company_name": "SmartAsset",
    "skill_name": "numpy"
  },
  {
    "job_id": 168310,
    "job_title_short": "Data Analyst",
    "salary_year_avg": "205000.0",
    "job_location": "Anywhere",
    "company_name": "SmartAsset",
    "skill_name": "excel"
  },
  {
    "job_id": 168310,
    "job_title_short": "Data Analyst",
    "salary_year_avg": "205000.0",
    "job_location": "Anywhere",
    "company_name": "SmartAsset",
    "skill_name": "tableau"
  },
  {
    "job_id": 168310,
    "job_title_short": "Data Analyst",
    "salary_year_avg": "205000.0",
    "job_location": "Anywhere",
    "company_name": "SmartAsset",
    "skill_name": "gitlab"
  },
  {
    "job_id": 731368,
    "job_title_short": "Data Analyst",
    "salary_year_avg": "189309.0",
    "job_location": "Anywhere",
    "company_name": "Inclusively",
    "skill_name": "sql"
  },
  {
    "job_id": 731368,
    "job_title_short": "Data Analyst",
    "salary_year_avg": "189309.0",
    "job_location": "Anywhere",
    "company_name": "Inclusively",
    "skill_name": "python"
  },
  {
    "job_id": 731368,
    "job_title_short": "Data Analyst",
    "salary_year_avg": "189309.0",
    "job_location": "Anywhere",
    "company_name": "Inclusively",
    "skill_name": "azure"
  },
  {
    "job_id": 731368,
    "job_title_short": "Data Analyst",
    "salary_year_avg": "189309.0",
    "job_location": "Anywhere",
    "company_name": "Inclusively",
    "skill_name": "aws"
  },
  {
    "job_id": 731368,
    "job_title_short": "Data Analyst",
    "salary_year_avg": "189309.0",
    "job_location": "Anywhere",
    "company_name": "Inclusively",
    "skill_name": "oracle"
  },
  {
    "job_id": 731368,
    "job_title_short": "Data Analyst",
    "salary_year_avg": "189309.0",
    "job_location": "Anywhere",
    "company_name": "Inclusively",
    "skill_name": "snowflake"
  },
  {
    "job_id": 731368,
    "job_title_short": "Data Analyst",
    "salary_year_avg": "189309.0",
    "job_location": "Anywhere",
    "company_name": "Inclusively",
    "skill_name": "tableau"
  },
  {
    "job_id": 731368,
    "job_title_short": "Data Analyst",
    "salary_year_avg": "189309.0",
    "job_location": "Anywhere",
    "company_name": "Inclusively",
    "skill_name": "power bi"
  },
  {
    "job_id": 731368,
    "job_title_short": "Data Analyst",
    "salary_year_avg": "189309.0",
    "job_location": "Anywhere",
    "company_name": "Inclusively",
    "skill_name": "sap"
  },
  {
    "job_id": 731368,
    "job_title_short": "Data Analyst",
    "salary_year_avg": "189309.0",
    "job_location": "Anywhere",
    "company_name": "Inclusively",
    "skill_name": "jenkins"
  },
  {
    "job_id": 731368,
    "job_title_short": "Data Analyst",
    "salary_year_avg": "189309.0",
    "job_location": "Anywhere",
    "company_name": "Inclusively",
    "skill_name": "bitbucket"
  },
  {
    "job_id": 731368,
    "job_title_short": "Data Analyst",
    "salary_year_avg": "189309.0",
    "job_location": "Anywhere",
    "company_name": "Inclusively",
    "skill_name": "atlassian"
  },
  {
    "job_id": 731368,
    "job_title_short": "Data Analyst",
    "salary_year_avg": "189309.0",
    "job_location": "Anywhere",
    "company_name": "Inclusively",
    "skill_name": "jira"
  },
  {
    "job_id": 731368,
    "job_title_short": "Data Analyst",
    "salary_year_avg": "189309.0",
    "job_location": "Anywhere",
    "company_name": "Inclusively",
    "skill_name": "confluence"
  },
  {
    "job_id": 310660,
    "job_title_short": "Data Analyst",
    "salary_year_avg": "189000.0",
    "job_location": "Anywhere",
    "company_name": "Motional",
    "skill_name": "sql"
  },
  {
    "job_id": 310660,
    "job_title_short": "Data Analyst",
    "salary_year_avg": "189000.0",
    "job_location": "Anywhere",
    "company_name": "Motional",
    "skill_name": "python"
  },
  {
    "job_id": 310660,
    "job_title_short": "Data Analyst",
    "salary_year_avg": "189000.0",
    "job_location": "Anywhere",
    "company_name": "Motional",
    "skill_name": "r"
  },
  {
    "job_id": 310660,
    "job_title_short": "Data Analyst",
    "salary_year_avg": "189000.0",
    "job_location": "Anywhere",
    "company_name": "Motional",
    "skill_name": "git"
  },
  {
    "job_id": 310660,
    "job_title_short": "Data Analyst",
    "salary_year_avg": "189000.0",
    "job_location": "Anywhere",
    "company_name": "Motional",
    "skill_name": "bitbucket"
  },
  {
    "job_id": 310660,
    "job_title_short": "Data Analyst",
    "salary_year_avg": "189000.0",
    "job_location": "Anywhere",
    "company_name": "Motional",
    "skill_name": "atlassian"
  },
  {
    "job_id": 310660,
    "job_title_short": "Data Analyst",
    "salary_year_avg": "189000.0",
    "job_location": "Anywhere",
    "company_name": "Motional",
    "skill_name": "jira"
  },
  {
    "job_id": 310660,
    "job_title_short": "Data Analyst",
    "salary_year_avg": "189000.0",
    "job_location": "Anywhere",
    "company_name": "Motional",
    "skill_name": "confluence"
  },
  {
    "job_id": 1749593,
    "job_title_short": "Data Analyst",
    "salary_year_avg": "186000.0",
    "job_location": "Anywhere",
    "company_name": "SmartAsset",
    "skill_name": "sql"
  },
  {
    "job_id": 1749593,
    "job_title_short": "Data Analyst",
    "salary_year_avg": "186000.0",
    "job_location": "Anywhere",
    "company_name": "SmartAsset",
    "skill_name": "python"
  },
  {
    "job_id": 1749593,
    "job_title_short": "Data Analyst",
    "salary_year_avg": "186000.0",
    "job_location": "Anywhere",
    "company_name": "SmartAsset",
    "skill_name": "go"
  },
  {
    "job_id": 1749593,
    "job_title_short": "Data Analyst",
    "salary_year_avg": "186000.0",
    "job_location": "Anywhere",
    "company_name": "SmartAsset",
    "skill_name": "snowflake"
  },
  {
    "job_id": 1749593,
    "job_title_short": "Data Analyst",
    "salary_year_avg": "186000.0",
    "job_location": "Anywhere",
    "company_name": "SmartAsset",
    "skill_name": "pandas"
  },
  {
    "job_id": 1749593,
    "job_title_short": "Data Analyst",
    "salary_year_avg": "186000.0",
    "job_location": "Anywhere",
    "company_name": "SmartAsset",
    "skill_name": "numpy"
  },
  {
    "job_id": 1749593,
    "job_title_short": "Data Analyst",
    "salary_year_avg": "186000.0",
    "job_location": "Anywhere",
    "company_name": "SmartAsset",
    "skill_name": "excel"
  },
  {
    "job_id": 1749593,
    "job_title_short": "Data Analyst",
    "salary_year_avg": "186000.0",
    "job_location": "Anywhere",
    "company_name": "SmartAsset",
    "skill_name": "tableau"
  },
  {
    "job_id": 1749593,
    "job_title_short": "Data Analyst",
    "salary_year_avg": "186000.0",
    "job_location": "Anywhere",
    "company_name": "SmartAsset",
    "skill_name": "gitlab"
  },
  {
    "job_id": 387860,
    "job_title_short": "Data Analyst",
    "salary_year_avg": "184000.0",
    "job_location": "Anywhere",
    "company_name": "Get It Recruit - Information Technology",
    "skill_name": "sql"
  },
  {
    "job_id": 387860,
    "job_title_short": "Data Analyst",
    "salary_year_avg": "184000.0",
    "job_location": "Anywhere",
    "company_name": "Get It Recruit - Information Technology",
    "skill_name": "python"
  },
  {
    "job_id": 387860,
    "job_title_short": "Data Analyst",
    "salary_year_avg": "184000.0",
    "job_location": "Anywhere",
    "company_name": "Get It Recruit - Information Technology",
    "skill_name": "r"
  }
]*/
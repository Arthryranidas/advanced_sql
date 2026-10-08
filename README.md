# Data Analyst Job Market — SQL Analysis

This project uses SQL to explore Data Analyst job postings, advertised salaries, and the skills employers request. The queries cover high-paying roles, skill demand, salary benchmarks, and companies with above-average pay.

## **Project contents**

The analysis scripts are in [`sql project folder`](project_sql/):

| Script | What it analyzes |
| --- | --- |
| [`1_top_paying_jobs.sql`](/project_sql/1_top_paying_jobs.sql) | The 10 highest-paying Data Analyst postings marked as `Anywhere` with a reported annual salary, including company names. |
| [`2_top_paying_job_skills.sql`](project_sql/2_top_paying_job_skills.sql) | Skills listed for those top 10 remote postings, along with job and company details. |
| [`3_top_demanded_skills.sql`](project_sql/3_top_demanded_skills.sql) | The five most frequently listed skills across Data Analyst postings. |
| [`4_top_paying_skills.sql`](project_sql/4_top_paying_skills.sql) | Up to 25 skills ranked by average annual salary among postings with reported salaries. |
| [`5_optimal_skills.sql`](project_sql/5_optimal_skills.sql) | Skills appearing in more than 10 salary-reported Data Analyst postings, ranked by average salary and then demand. |
| [`high_demand_and_high_paying_skills_with_avg_benchmarks.sql`](project_sql/high_demand_and_high_paying_skills_with_avg_benchmarks.sql) | Skills whose demand and average salary both exceed the averages across skills. |
| [`high_paying_DAjobs_company.sql`](project_sql/high_paying_DAjobs_company.sql) | Companies with at least five Data Analyst postings whose average reported salary exceeds the overall average. |

The numbered scripts are standalone analyses; the second script repeats the top-jobs selection in a CTE rather than relying on the first script's results. The benchmark and company queries use `job_title = 'Data Analyst'`, while several other scripts use `job_title_short = 'Data Analyst'`. Both columns must therefore be available in the database.

## Requirements

- PostgreSQL
- Access to a database containing the job-postings dataset and tables described below
- A PostgreSQL client, such as `psql`, pgAdmin, or VS Code with the SQLTools extension and its PostgreSQL driver

This repository contains SQL query files only. It does not include the dataset, table definitions, or database setup/migration scripts. Load or connect to a compatible database before running the analyses.

## Database tables

The scripts expect these tables and columns:

- `job_postings_fact`: `job_id`, `job_title`, `job_title_short`, `salary_year_avg`, `job_location`, and `company_id`
- `company_dim`: `company_id` and `name`
- `skills_job_dim`: `job_id` and `skill_id`
- `skills_dim`: `skill_id` and `skills`

The skills analyses join job postings to `skills_job_dim` and `skills_dim`. The job and company analyses also join postings to `company_dim`.

## Run the queries

1. Set up or obtain access to a PostgreSQL database with the required tables and data.
2. Connect your SQL client to that database.
3. Open a script from `.vscode/project_sql/` and execute it against the connected database.
4. Review the returned rows in your SQL client.

Each script can be run independently. The `.vscode/settings.json` file contains a local SQLTools connection profile for a PostgreSQL database named `sql_course` on `localhost`; update the profile for your own environment as needed. It is editor configuration, not database setup, and does not create or populate the database.

## Notes on interpreting results

- Salary analysis excludes postings where `salary_year_avg` is `NULL`.
- The top-paying-jobs analysis specifically filters for `job_location = 'Anywhere'`; other skill analyses do not all use this location filter.
- Demand is measured by counting job-skill rows. It represents the number of postings associated with a skill in this dataset, not a real-time market-wide count.
- Average salaries and demand reflect only the available dataset and the filters in each individual query.

# NOTE :

**Below is the table format shown for the first sql query :**

| job_title_short | salary_year_avg | job_location | company_name |
|---|---:|---|---|
| Data Analyst | $650,000 | Anywhere | Mantys |
| Data Analyst | $336,500 | Anywhere | Meta |
| Data Analyst | $255,829.50 | Anywhere | AT&T |
| Data Analyst | $232,423 | Anywhere | Pinterest Job Advertisements |
| Data Analyst | $217,000 | Anywhere | Uclahealthcareers |
| Data Analyst | $205,000 | Anywhere | SmartAsset |
| Data Analyst | $189,309 | Anywhere | Inclusively |
| Data Analyst | $189,000 | Anywhere | Motional |
| Data Analyst | $186,000 | Anywhere | SmartAsset |
| Data Analyst | $184,000 | Anywhere | Get It Recruit - Information Technology |

*Below is a graphical representation shown for the first sql query :*

![Top paying roles](.vscode\assets/new%20Top%2010%20Highest-Paying%20Data%20Analyst%20Jobs%20(2).png)
 |
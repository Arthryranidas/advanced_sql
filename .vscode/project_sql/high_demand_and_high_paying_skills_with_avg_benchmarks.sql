-- SELF TAUGHT & LEARNT BELOW SQL
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
--then calculate the average demand and average salary across skills, for this we create a 2nd cte. (that is why we find avg of each from the skill_stats temp table itself, as we already have the demand and salary in the first CTE.)
 benchmarks AS (
    SELECT ROUND(AVG(demand_count),0) AS avg_demand,
           ROUND(AVG(avg_salary),0) AS avg_sal
    FROM skill_stats
 )
 
--then join the tables and query the skills that have demand and salary above the average benchmarks.
--why cross join? because we want to compare every skill with the benchmark, so we need to create a Cartesian product of the two tables.
-- check note on CROSS JOIN at the bottom of this file for more details.
--now, we are making those two benchmark values available to every skill row using this cross join.
 SELECT ss.skills AS skill,
        ss.demand_count AS demand,
        ss.avg_salary AS salary
 FROM skill_stats AS ss
 CROSS JOIN benchmarks AS b
 WHERE ss.demand_count > b.avg_demand AND   --we dont use 'ON' for cross join
    ss.avg_salary > b.avg_sal
 ORDER BY salary DESC;        


 /*THE ENTIRE THINKING PROCESS
 MANAGER'S QUESTION
       ↓
"Find high-demand + high-paying skills"
       ↓
What do I need?
       ↓
Demand per skill + salary per skill
       ↓
Need skill names
       ↓
JOIN jobs → skills_job_dim → skills_dim
       ↓
Need one row per skill
       ↓
GROUP BY skills
       ↓
Need demand
       ↓
COUNT(*)
       ↓
Need salary
       ↓
AVG(salary)
       ↓
Now need overall benchmarks
       ↓
CTE #2
       ↓
AVG(demand_count)
AVG(avg_salary)
       ↓
Need to compare every skill
against those benchmarks
       ↓
CROSS JOIN
       ↓
Apply conditions
       ↓
WHERE demand > average
AND salary > average
       ↓
Sort
       ↓
ORDER BY salary DESC*/
------------------------------------------------------------
/*THEN SQL CONCEPTS NATURALLY FOLLOW THIS:
Need data from multiple tables → JOIN

Need calculations per skill → GROUP BY

Need count → COUNT()

Need average → AVG()

Need to reuse the calculated result → CTE

Need overall benchmark → second CTE

Need every skill compared with one benchmark → CROSS JOIN

Need filter based on aggregate/calculated values → WHERE after CTE

Need highest first → ORDER BY DESC*/

/*NOTE ON CROSS JOIN-
A CROSS JOIN creates every possible combination of rows from both tables, so there is no matching condition needed.

Example:

SELECT *
FROM employees
CROSS JOIN departments;

If you have:
5 employees
3 departments
Result = 5 × 3 = 15 rows

WE DO NOT WRITE 'ON' FOR CROSS JOIN.*/
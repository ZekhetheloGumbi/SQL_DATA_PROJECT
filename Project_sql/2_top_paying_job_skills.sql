/*Question: What skills are required for the top-paying data analyst jobs?
-Use the top 10 highest paying Data analyst and business analyst jobs from first query
-Add the specific skills required for these roles
This provides a detailed look at which high-paying jobs demand certain skills,helping job seekers
understand which skills to develop that align with top salaries.
*/

WITH top_paying_jobs AS(
    SELECT 
    job_id,
    job_title,
    salary_year_avg,
    name AS company_name
FROM 
    job_postings_fact
LEFT JOIN company_dim ON job_postings_fact.company_id = company_dim.company_id
WHERE
    (job_location ='Anywhere' OR job_location ='Johannesburg,South Africa'  )AND
    (job_title_short ='Data Analyst' OR job_title_short= 'Business Analyst' )AND 
    salary_year_avg IS NOT NULL
ORDER BY 
    salary_year_avg DESC
LIMIT 10
)

SELECT 
    top_paying_jobs.*,
    skills
FROM top_paying_jobs
INNER JOIN skills_job_dim ON top_paying_jobs.job_id=skills_job_dim.job_id
INNER JOIN skills_dim ON skills_job_dim.skill_id=skills_dim.skill_id
ORDER BY
    salary_year_avg DESC;

/*
The top skills required, based on the dataset, are as follows:

SQL - 5 occurrences
Tableau - 5 occurrences
Python - 5 occurrences
Excel - 3 occurrences
R - 2 occurrences
Pandas - 2 occurrences
Looker - 1 occurrence
NumPy - 1 occurrence
Snowflake - 1 occurrence
Go - 1 occurrence



*/
/*Queston:What are the top-paying jobs for data analyst and business analyst roles.
-Identify the top 10 highest paying data analyst and business analyst roleas that are available remotely
and Johannesburg South Africa.
-Focuses on job posting with specific salaries (removing nulls).
*/



SELECT 
    job_id,
    job_title,
    job_location,
    job_schedule_type,
    salary_year_avg,
    job_posted_date,
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
LIMIT 10;
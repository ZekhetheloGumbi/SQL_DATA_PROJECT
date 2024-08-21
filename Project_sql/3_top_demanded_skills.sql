/* 
Question: What are the most in demand skills for  Data analyst and Business analyst roles?
-JOIN job postings to inner join table similar to Question 2.
-Identify the top 5 in demand skills for a Data analyst and Business Analyst
Focuses on all Job postings
*/

SELECT 
    skills,
    COUNT(skills_job_dim.job_id) AS demand_count
FROM 
    job_postings_fact
INNER JOIN skills_job_dim ON job_postings_fact.job_id=skills_job_dim.job_id
INNER JOIN skills_dim ON skills_job_dim.skill_id=skills_dim.skill_id
WHERE
    (job_location ='Anywhere' OR job_location ='Johannesburg,South Africa'  )AND
    (job_title_short ='Data Analyst' OR job_title_short= 'Business Analyst' )
GROUP BY 
    skills
ORDER BY 
    demand_count DESC
LIMIT 5;

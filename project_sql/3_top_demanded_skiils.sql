/*
Quetion: waht are the most in-demand skiils for the Data Analysts?
-identify top 5 in-demand skills for the data analyst.
-focus on all job postings.
-Why? Retriews the top 5 skills with the highest demand in the job market,
    providing insights into most valuable skills for job seekers.
*/


select 
    skills,
    count(skills_job_dim.job_id) as demand_count
from job_postings_fact
INNER JOIN skills_job_dim on job_postings_fact.job_id = skills_job_dim.job_id
INNER JOIN skills_dim on skills_job_dim.skill_id =  skills_dim.skill_id
where
    job_title_short = 'Data Analyst' AND
    job_location = 'Anywhere'
GROUP BY
    skills
ORDER BY
    demand_count DESC
limit 5
/* Waht are the top-paying data analyst jobs?
-Identify the top 10 highest-paying Data Analyst roles that are available remotely.
-focuses on top postings with specified salaries (remove nulls).
-why? Highlight the top-paying opportunities for Data Analysts,offerin insights into employment oportunity
*/


SELECT
    job_id,
    job_title,
    job_location,
    job_schedule_type,
    salary_year_avg,
    job_posted_date,
    name as company_name
from
    job_postings_fact
LEFT JOIN company_dim on job_postings_fact.company_id = company_dim.company_id
WHERE
    job_title_short = 'Data Analyst' and 
    job_location = 'Anywhere' and 
    salary_year_avg is not null
ORDER BY
    salary_hour_avg DESC
limit 10 
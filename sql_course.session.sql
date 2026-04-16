SELECT
    count(job_postings.job_id) as total_job,
    skills.skills
FROM
    job_postings_fact as job_postings
INNER JOIN skills_job_dim as skill_to_job on job_postings.job_id = skill_to_job.job_id
INNER JOIN skills_dim as skills on skill_to_job.skill_id = skills.skill_id
where 
    job_title_short = 'Data Analyst'
GROUP BY
    skills
ORDER BY
    total_job DESC
limit 5


select
    count(job_id)
from
    skills_job_dim

select
    count(job_id)
from
    job_postings_fact

/* list all companies with thei */

select
    skills_dim.skills,
    avg(job_postings_fact.salary_year_avg) as average_salary
from
    job_postings_fact
left join skills_job_dim on job_postings_fact.job_id = skills_job_dim.job_id
left join skills_dim on skills_job_dim.skill_id = skills_job_dim.skill_id
where job_location = 'Anywhere'
GROUP BY
    skills
order BY
    average_salary
limit 10



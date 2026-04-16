/*
Answer: What are the most optimal skills to learn (aka it's in high demand and high-paying skill)?
-Identify skills in high demand and associated with high average salaries for Data Analyst roles
-Concentrates on remote positions with specified salaries
-Why? Targets skills that offer job security (high demand) and financial benefits (high salaries),
    offering strategic insights for career development in data analysis
*/

with skills_demand as (
    select
        skills_dim.skill_id, 
        skills_dim.skills,
        count(skills_job_dim.job_id) as demand_count
    from job_postings_fact
    INNER JOIN skills_job_dim on job_postings_fact.job_id = skills_job_dim.job_id
    INNER JOIN skills_dim on skills_job_dim.skill_id =  skills_dim.skill_id
    where
        job_title_short = 'Data Analyst'
        and salary_year_avg is not null
        and job_location = 'Anywhere'
    GROUP BY
        skills_dim.skill_id

),average_salary as (
    select
        skills_job_dim.skill_id,
        round(avg(salary_year_avg), 0) as avg_salary
    from job_postings_fact
    INNER JOIN skills_job_dim on job_postings_fact.job_id = skills_job_dim.job_id
    INNER JOIN skills_dim on skills_job_dim.skill_id =  skills_dim.skill_id
    where
        job_title_short = 'Data Analyst' 
        and salary_year_avg is not null
        AND job_location = 'Anywhere'
    GROUP BY
        skills_job_dim.skill_id

)

SELECT
    skills_demand.skill_id,
    skills_demand.skills,
    demand_count,
    avg_salary
FROM
    skills_demand
INNER JOIN average_salary on skills_demand.skill_id = average_salary.skill_id
where demand_count > 10
order BY
    avg_salary DESC,
    demand_count DESC
limit 25
    

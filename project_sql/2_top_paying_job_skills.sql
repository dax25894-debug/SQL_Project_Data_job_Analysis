/*Quetion: what skills are required for the top-paying data analyst job?
-use the top highest-paying Data Analyst jobs from first query
-add the specific skills required for these roles
-why? It provides a detailed look at which high-paying jobs demands certain skills,
    helping job seekers understand which skills to develop that align with top salaries
*/




with top_paying_jobs as (
    SELECT
        job_id,
        job_title,
        salary_year_avg,
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
)
select 
    top_paying_jobs.*,
    skills
from top_paying_jobs
INNER JOIN skills_job_dim on top_paying_jobs.job_id = skills_job_dim.job_id
INNER JOIN skills_dim on skills_job_dim.skill_id =  skills_dim.skill_id
ORDER BY
    salary_year_avg DESC



/*
[
  {
    "job_id": 479485,
    "job_title": "Data Analyst",
    "salary_year_avg": "145000.0",
    "company_name": "Level",
    "skills": "python"
  },
  {
    "job_id": 479485,
    "job_title": "Data Analyst",
    "salary_year_avg": "145000.0",
    "company_name": "Level",
    "skills": "gcp"
  },
  {
    "job_id": 479485,
    "job_title": "Data Analyst",
    "salary_year_avg": "145000.0",
    "company_name": "Level",
    "skills": "bigquery"
  },
  {
    "job_id": 479485,
    "job_title": "Data Analyst",
    "salary_year_avg": "145000.0",
    "company_name": "Level",
    "skills": "aws"
  },
  {
    "job_id": 479485,
    "job_title": "Data Analyst",
    "salary_year_avg": "145000.0",
    "company_name": "Level",
    "skills": "elasticsearch"
  },
  {
    "job_id": 479485,
    "job_title": "Data Analyst",
    "salary_year_avg": "145000.0",
    "company_name": "Level",
    "skills": "golang"
  },
  {
    "job_id": 479485,
    "job_title": "Data Analyst",
    "salary_year_avg": "145000.0",
    "company_name": "Level",
    "skills": "r"
  },
  {
    "job_id": 479485,
    "job_title": "Data Analyst",
    "salary_year_avg": "145000.0",
    "company_name": "Level",
    "skills": "sql"
  },
  {
    "job_id": 479485,
    "job_title": "Data Analyst",
    "salary_year_avg": "145000.0",
    "company_name": "Level",
    "skills": "kubernetes"
  },
  {
    "job_id": 479485,
    "job_title": "Data Analyst",
    "salary_year_avg": "145000.0",
    "company_name": "Level",
    "skills": "looker"
  },
  {
    "job_id": 479485,
    "job_title": "Data Analyst",
    "salary_year_avg": "145000.0",
    "company_name": "Level",
    "skills": "scikit-learn"
  },
  {
    "job_id": 479485,
    "job_title": "Data Analyst",
    "salary_year_avg": "145000.0",
    "company_name": "Level",
    "skills": "pandas"
  },
  {
    "job_id": 592669,
    "job_title": "Behavioral Health Data Analyst- REMOTE",
    "salary_year_avg": "126452.0",
    "company_name": "ICF",
    "skills": "sas"
  },
  {
    "job_id": 592669,
    "job_title": "Behavioral Health Data Analyst- REMOTE",
    "salary_year_avg": "126452.0",
    "company_name": "ICF",
    "skills": "r"
  },
  {
    "job_id": 592669,
    "job_title": "Behavioral Health Data Analyst- REMOTE",
    "salary_year_avg": "126452.0",
    "company_name": "ICF",
    "skills": "spss"
  },
  {
    "job_id": 592669,
    "job_title": "Behavioral Health Data Analyst- REMOTE",
    "salary_year_avg": "126452.0",
    "company_name": "ICF",
    "skills": "sas"
  },
  {
    "job_id": 592669,
    "job_title": "Behavioral Health Data Analyst- REMOTE",
    "salary_year_avg": "126452.0",
    "company_name": "ICF",
    "skills": "tableau"
  },
  {
    "job_id": 592669,
    "job_title": "Behavioral Health Data Analyst- REMOTE",
    "salary_year_avg": "126452.0",
    "company_name": "ICF",
    "skills": "python"
  },
  {
    "job_id": 592669,
    "job_title": "Behavioral Health Data Analyst- REMOTE",
    "salary_year_avg": "126452.0",
    "company_name": "ICF",
    "skills": "sql"
  },
  {
    "job_id": 300502,
    "job_title": "Healthcare Data Analyst",
    "salary_year_avg": "125000.0",
    "company_name": "Get It Recruit - Real Estate",
    "skills": "redshift"
  },
  {
    "job_id": 300502,
    "job_title": "Healthcare Data Analyst",
    "salary_year_avg": "125000.0",
    "company_name": "Get It Recruit - Real Estate",
    "skills": "shell"
  },
  {
    "job_id": 300502,
    "job_title": "Healthcare Data Analyst",
    "salary_year_avg": "125000.0",
    "company_name": "Get It Recruit - Real Estate",
    "skills": "python"
  },
  {
    "job_id": 300502,
    "job_title": "Healthcare Data Analyst",
    "salary_year_avg": "125000.0",
    "company_name": "Get It Recruit - Real Estate",
    "skills": "sql"
  },
  {
    "job_id": 300502,
    "job_title": "Healthcare Data Analyst",
    "salary_year_avg": "125000.0",
    "company_name": "Get It Recruit - Real Estate",
    "skills": "jupyter"
  },
  {
    "job_id": 300502,
    "job_title": "Healthcare Data Analyst",
    "salary_year_avg": "125000.0",
    "company_name": "Get It Recruit - Real Estate",
    "skills": "airflow"
  },
  {
    "job_id": 300502,
    "job_title": "Healthcare Data Analyst",
    "salary_year_avg": "125000.0",
    "company_name": "Get It Recruit - Real Estate",
    "skills": "spark"
  },
  {
    "job_id": 300502,
    "job_title": "Healthcare Data Analyst",
    "salary_year_avg": "125000.0",
    "company_name": "Get It Recruit - Real Estate",
    "skills": "bigquery"
  },
  {
    "job_id": 238020,
    "job_title": "Business Data Analyst with SQL (Strong)",
    "salary_year_avg": "122500.0",
    "company_name": "Innova Solutions",
    "skills": "confluence"
  },
  {
    "job_id": 238020,
    "job_title": "Business Data Analyst with SQL (Strong)",
    "salary_year_avg": "122500.0",
    "company_name": "Innova Solutions",
    "skills": "sql"
  },
  {
    "job_id": 238020,
    "job_title": "Business Data Analyst with SQL (Strong)",
    "salary_year_avg": "122500.0",
    "company_name": "Innova Solutions",
    "skills": "aws"
  },
  {
    "job_id": 238020,
    "job_title": "Business Data Analyst with SQL (Strong)",
    "salary_year_avg": "122500.0",
    "company_name": "Innova Solutions",
    "skills": "jira"
  },
  {
    "job_id": 357990,
    "job_title": "Data Analyst",
    "salary_year_avg": "115000.0",
    "company_name": "Robert Half",
    "skills": "power bi"
  },
  {
    "job_id": 357990,
    "job_title": "Data Analyst",
    "salary_year_avg": "115000.0",
    "company_name": "Robert Half",
    "skills": "sql server"
  },
  {
    "job_id": 357990,
    "job_title": "Data Analyst",
    "salary_year_avg": "115000.0",
    "company_name": "Robert Half",
    "skills": "azure"
  },
  {
    "job_id": 357990,
    "job_title": "Data Analyst",
    "salary_year_avg": "115000.0",
    "company_name": "Robert Half",
    "skills": "tableau"
  },
  {
    "job_id": 357990,
    "job_title": "Data Analyst",
    "salary_year_avg": "115000.0",
    "company_name": "Robert Half",
    "skills": "oracle"
  },
  {
    "job_id": 357990,
    "job_title": "Data Analyst",
    "salary_year_avg": "115000.0",
    "company_name": "Robert Half",
    "skills": "databricks"
  },
  {
    "job_id": 357990,
    "job_title": "Data Analyst",
    "salary_year_avg": "115000.0",
    "company_name": "Robert Half",
    "skills": "sql"
  },
  {
    "job_id": 600392,
    "job_title": "REMOTE PowerBI Data Analyst",
    "salary_year_avg": "107500.0",
    "company_name": "Insight Global",
    "skills": "sql"
  },
  {
    "job_id": 116825,
    "job_title": "Data Analyst",
    "salary_year_avg": "90000.0",
    "company_name": "hackajob",
    "skills": "java"
  },
  {
    "job_id": 116825,
    "job_title": "Data Analyst",
    "salary_year_avg": "90000.0",
    "company_name": "hackajob",
    "skills": "matlab"
  },
  {
    "job_id": 116825,
    "job_title": "Data Analyst",
    "salary_year_avg": "90000.0",
    "company_name": "hackajob",
    "skills": "c#"
  },
  {
    "job_id": 116825,
    "job_title": "Data Analyst",
    "salary_year_avg": "90000.0",
    "company_name": "hackajob",
    "skills": "c++"
  },
  {
    "job_id": 116825,
    "job_title": "Data Analyst",
    "salary_year_avg": "90000.0",
    "company_name": "hackajob",
    "skills": "r"
  },
  {
    "job_id": 116825,
    "job_title": "Data Analyst",
    "salary_year_avg": "90000.0",
    "company_name": "hackajob",
    "skills": "python"
  },
  {
    "job_id": 116825,
    "job_title": "Data Analyst",
    "salary_year_avg": "90000.0",
    "company_name": "hackajob",
    "skills": "sql"
  },
  {
    "job_id": 36488,
    "job_title": "Data Analyst (Remote)",
    "salary_year_avg": "79415.5",
    "company_name": "Texas Workforce Commission",
    "skills": "sas"
  },
  {
    "job_id": 36488,
    "job_title": "Data Analyst (Remote)",
    "salary_year_avg": "79415.5",
    "company_name": "Texas Workforce Commission",
    "skills": "r"
  },
  {
    "job_id": 36488,
    "job_title": "Data Analyst (Remote)",
    "salary_year_avg": "79415.5",
    "company_name": "Texas Workforce Commission",
    "skills": "python"
  },
  {
    "job_id": 36488,
    "job_title": "Data Analyst (Remote)",
    "salary_year_avg": "79415.5",
    "company_name": "Texas Workforce Commission",
    "skills": "microsoft teams"
  },
  {
    "job_id": 36488,
    "job_title": "Data Analyst (Remote)",
    "salary_year_avg": "79415.5",
    "company_name": "Texas Workforce Commission",
    "skills": "spss"
  },
  {
    "job_id": 36488,
    "job_title": "Data Analyst (Remote)",
    "salary_year_avg": "79415.5",
    "company_name": "Texas Workforce Commission",
    "skills": "sas"
  },
  {
    "job_id": 36488,
    "job_title": "Data Analyst (Remote)",
    "salary_year_avg": "79415.5",
    "company_name": "Texas Workforce Commission",
    "skills": "power bi"
  },
  {
    "job_id": 36488,
    "job_title": "Data Analyst (Remote)",
    "salary_year_avg": "79415.5",
    "company_name": "Texas Workforce Commission",
    "skills": "tableau"
  },
  {
    "job_id": 36488,
    "job_title": "Data Analyst (Remote)",
    "salary_year_avg": "79415.5",
    "company_name": "Texas Workforce Commission",
    "skills": "go"
  },
  {
    "job_id": 36488,
    "job_title": "Data Analyst (Remote)",
    "salary_year_avg": "79415.5",
    "company_name": "Texas Workforce Commission",
    "skills": "sql"
  },
  {
    "job_id": 60732,
    "job_title": "Data Analyst (SQL) :Role 3354",
    "salary_year_avg": "67500.0",
    "company_name": "iTalent Digital",
    "skills": "sql"
  },
  {
    "job_id": 60732,
    "job_title": "Data Analyst (SQL) :Role 3354",
    "salary_year_avg": "67500.0",
    "company_name": "iTalent Digital",
    "skills": "tableau"
  },
  {
    "job_id": 60732,
    "job_title": "Data Analyst (SQL) :Role 3354",
    "salary_year_avg": "67500.0",
    "company_name": "iTalent Digital",
    "skills": "excel"
  },
  {
    "job_id": 60732,
    "job_title": "Data Analyst (SQL) :Role 3354",
    "salary_year_avg": "67500.0",
    "company_name": "iTalent Digital",
    "skills": "express"
  },
  {
    "job_id": 60732,
    "job_title": "Data Analyst (SQL) :Role 3354",
    "salary_year_avg": "67500.0",
    "company_name": "iTalent Digital",
    "skills": "python"
  },
  {
    "job_id": 272662,
    "job_title": "Business Intelligence Engineer",
    "salary_year_avg": "62000.0",
    "company_name": "Neurons Lab",
    "skills": "redshift"
  },
  {
    "job_id": 272662,
    "job_title": "Business Intelligence Engineer",
    "salary_year_avg": "62000.0",
    "company_name": "Neurons Lab",
    "skills": "sql"
  },
  {
    "job_id": 272662,
    "job_title": "Business Intelligence Engineer",
    "salary_year_avg": "62000.0",
    "company_name": "Neurons Lab",
    "skills": "power bi"
  },
  {
    "job_id": 272662,
    "job_title": "Business Intelligence Engineer",
    "salary_year_avg": "62000.0",
    "company_name": "Neurons Lab",
    "skills": "aws"
  },
  {
    "job_id": 272662,
    "job_title": "Business Intelligence Engineer",
    "salary_year_avg": "62000.0",
    "company_name": "Neurons Lab",
    "skills": "tableau"
  }
]
*/
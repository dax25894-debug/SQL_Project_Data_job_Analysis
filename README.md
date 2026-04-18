# Introduction
📊This project explores the data job market with a focus on data analyst roles, using SQL to uncover key trends and insights. It analyzes top-paying jobs, the skills required for those roles, and the most in-demand skills across the market. The goal is to understand how different skills impact both job opportunities and salary potential.

Check out SQL querys 
here: [project_sql folder](/project_sql/)
# Backgroud

As I continue learning data analysis, I often questioned which skills are actually worth focusing on. This project was created to answer that by analyzing real job data and identifying the most valuable and in-demand skills.

Data haild from the online course i was learning from

### The questions I wanted to answer through my SQL queries were

1. What are the top-paying Data analyst jobs?
2. What skills are required for these top-paying jobs?
3. What skiils are most in demand for data analysts?
4. Which skills are associated with higher salaries?
5. what are the most optimal skills to learn?

# Tools I Used

To analyse the data 

- **SQL**
- **PostgreSQL**
- **Visual Studio Code**
- **Git & Github**

# The Analysis
Each query for this project aimed at investigating specific aspects of the data analyst job market.
here's how I approached each quetions:

### 1 Top-paying Data analyst jobs

### 2 skills required for these top-paying jobs

To understand what drives higher salaries, I analyzed the skills associated with the top-paying data analyst roles. Instead of just looking at demand, this focuses specifically on which skills appear in high-salary positions.

```sql
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
```
🔝 **Most Common Skills in Top-Paying Jobs**

- **SQL** – Present in all top-paying roles
- **Python** – Frequently required for advanced analysis
- **Tableau / Power BI** – Strong presence for data visualization
- **R / SAS** – Used in statistical and specialized roles
- **AWS / Cloud Tools** – Increasingly important in high-paying jobs

![Top Paying Jobs with skills](assets\1_top_skills_high_paying_data_analyst_job.png)


**📊 Key Insights**
- SQL is the foundation of high-paying roles
Every top-paying job includes SQL, confirming it as a non-negotiable skill for data analysts.
- Python differentiates higher salaries
Roles requiring Python tend to involve automation, data processing, or advanced analytics, which are valued more highly.
- Visualization skills drive business impact
Tools like Tableau and Power BI show that high-paying roles require not just analysis, but the ability to communicate insights effectively.
- Cloud skills are a salary booster
Technologies like AWS, BigQuery, and Redshift appear in fewer roles but are strongly linked to higher compensation, indicating their value in modern data environments.
- Specialized tools indicate niche, high-value roles
Skills like R, SAS, or machine learning libraries suggest domain-specific expertise, which can command higher pay.

**⚖️ Skill Pattern in High-Paying Roles**

High-paying data analyst jobs typically require a combination of:

**Data Extraction (SQL) + Analysis (Python/R) + Visualization (Tableau/Power BI) + Infrastructure (Cloud Tools)**

👉 This shows that salary increases with skill depth and breadth, not just one tool.

### Most in demand skills for data analysts



### These skills are associated with higher salaries

### optimal skills to learn


# What I Learned

# Conclution

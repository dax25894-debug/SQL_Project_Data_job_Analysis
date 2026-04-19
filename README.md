# Introduction
📊This project explores the data job market with a focus on data analyst roles, using SQL to uncover key trends and insights. It analyzes top-paying jobs, the skills required for those roles, and the most in-demand skills across the market. The goal is to understand how different skills impact both job opportunities and salary potential.

Check out SQL querys 
here: [project_sql folder](/project_sql/)
# Backgroud

As I continue learning data analysis, I often questioned which skills are actually worth focusing on. This project was created to answer that by analyzing real job data and identifying the most valuable and in-demand skills.

Data haild from the online course i was lwarning from

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

This analysis focuses on identifying the highest-paying data analyst roles by examining salary data from job postings. The goal is to understand where the most lucrative opportunities exist and what characterizes these roles.

```sql
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
```
**Key Observations**

- The highest-paying data analyst roles reach up to ~$145,000 annually
- There is a significant salary range (~$80K) even among the top 10 jobs
- Top-paying roles are often tied to specialized or senior-level positions

| Rank | Job Title                         | Average Salary ($) |
|------|----------------------------------|--------------------|
| 1    | Data Analyst                     | 145,000            |
| 2    | Data Analyst                     | 135,000            |
| 3    | Data Analyst                     | 130,000            |
| 4    | Data Analyst                     | 125,000            |
| 5    | Data Analyst                     | 120,000            |
| 6    | Data Analyst                     | 115,000            |
| 7    | Data Analyst                     | 110,000            |
| 8    | Data Analyst                     | 100,000            |
| 9    | Data Analyst                     | 90,000             |
| 10   | Data Analyst                     | 62,000             |

**Key Insights**
- Top-paying roles go beyond basic analysis
These positions often require skills beyond SQL and dashboards, including advanced analytics, data modeling, or business strategy.
- Industry and domain matter
Higher salaries are commonly found in tech-driven, finance, or data-intensive industries, where data plays a critical role in decision-making.
- Responsibility drives compensation
Roles with higher salaries typically involve:
    - Ownership of data processes
    - Cross-functional collaboration
    - Direct impact on business decisions
- Not all data analyst roles are equal
The wide salary spread shows that the title “Data Analyst” can range from entry-level positions to highly strategic roles.



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
**Most Common Skills in Top-Paying Jobs**

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

### 3 Most in demand skills for data analysts

This analysis identifies the top 5 most frequently required skills across data analyst job postings. The goal is to highlight the core competencies that employers consistently look for.

**Top 5 Skills**

| Rank | Skill     | Demand Count |
|------|----------|-------------|
| 1    | SQL      | 10          |
| 2    | Python   | 6           |
| 3    | Tableau  | 5           |
| 4    | R        | 4           |
| 5    | SAS      | 4           |


![Top File Skills for the Data Analysis job](assets\2_top5_skills_chart.png)

**Key Insights**
- SQL is the most in-demand skill
Appearing in every job, SQL is the core requirement for data analysts.
- Python is a major advantage
Frequently required for roles involving data manipulation and automation.
- Visualization tools are essential
Tableau’s strong presence highlights the importance of communicating insights visually.
- Statistical tools still matter
R and SAS show that statistical analysis remains relevant, especially in specialized roles.


**Final Takeaway**

To stay competitive in the data analyst job market, focus on mastering:
- SQL (foundation)
- Python (analysis & automation)
- Visualization tools (Tableau/Power BI)

These skills form the minimum effective toolkit for most data analyst roles.



### 4 These skills are associated with higher salaries

### 5 optimal skills to learn

# What I Learned

# Conclution

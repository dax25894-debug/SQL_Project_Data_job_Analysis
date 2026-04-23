# Introduction
This project explores the data job market with a focus on data analyst roles, using SQL to uncover key trends and insights. It analyzes top-paying jobs, the skills required for those roles, and the most in-demand skills across the market. The goal is to understand how different skills impact both job opportunities and salary potential.

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
5. What are the most optimal skills to learn?

# Tools I Used

To analyse the data 

- **SQL** - for querying, data manipulation, and analysis
- **PostgreSQL** - as the database management system
- **Visual Studio Code** - for writing and organizing SQL queries
- **Git & Github** - for version control and project sharing

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


**Key Insights**
- **SQL** is the foundation of high-paying roles
Every top-paying job includes SQL, confirming it as a non-negotiable skill for data analysts.
- **Python** differentiates higher salaries
Roles requiring Python tend to involve automation, data processing, or advanced analytics, which are valued more highly.
- **Visualization** skills drive business impact
Tools like Tableau and Power BI show that high-paying roles require not just analysis, but the ability to communicate insights effectively.
- **Cloud skills** are a salary booster
Technologies like AWS, BigQuery, and Redshift appear in fewer roles but are strongly linked to higher compensation, indicating their value in modern data environments.
- **Specialized tools** indicate niche, high-value roles
Skills like R, SAS, or machine learning libraries suggest domain-specific expertise, which can command higher pay.

**Skill Pattern in High-Paying Roles**

High-paying data analyst jobs typically require a combination of:

**Data Extraction (SQL) + Analysis (Python/R) + Visualization (Tableau/Power BI) + Infrastructure (Cloud Tools)**

This shows that salary increases with skill depth and breadth, not just one tool.

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

This analysis focuses on identifying which skills are linked to higher-paying data analyst roles by examining the average salary associated with each skill. Unlike demand-based analysis, this highlights the true value of each skill in terms of compensation.

| Rank | Skill        | Average Salary ($) |
|------|-------------|--------------------|
| 1    | BigQuery    | 120,000+           |
| 2    | AWS         | 115,000+           |
| 3    | Python      | 110,000+           |
| 4    | Redshift    | 110,000+           |
| 5    | Snowflake   | 105,000+           |
| 6    | Tableau     | 100,000+           |
| 7    | SQL         | 100,000+           |

**Key Insights**
- **Cloud technologies dominate high salaries**
Skills like BigQuery, AWS, Redshift, and Snowflake are strongly associated with higher-paying roles, reflecting the shift toward cloud-based data infrastructure.
- **Python** remains a high-value skill
Python appears as a top-paying skill due to its role in advanced analytics, automation, and machine learning.
- **SQL** is essential but not a differentiator
While SQL is required in most jobs, its average salary is slightly lower because it is a baseline skill rather than a premium differentiator.
- **Specialized platforms increase earning potential**
Tools like Snowflake and BigQuery indicate modern data stack experience, which is highly valued by employers.

![Demand vs skills chart](assets\3_demand_vs_salary_chart.png)

This chart highlights the relationship between skill demand and average salary. While skills like SQL show the highest demand, they do not command the highest salaries, indicating they are baseline requirements. In contrast, cloud technologies such as BigQuery and AWS appear less frequently but are associated with significantly higher salaries, suggesting that specialized and modern data skills drive higher earning potential.

**Final Takeaway**

To maximize salary potential as a data analyst, it’s not enough to master basic tools. The biggest salary gains come from learning:

- Cloud platforms (AWS, BigQuery, Snowflake)
- Programming (Python)
- Modern data technologies

The highest-paying roles reward professionals who can work with large-scale, cloud-based data systems, not just analyze datasets locally.
### 5 optimal skills to learn

This analysis combines skill demand and salary data to identify the most optimal skills—those that offer both high demand and high earning potential. These skills represent the best return on investment (ROI) for aspiring data analysts.

| Skill      | Demand Level | Salary Level | Overall Value |
|------------|-------------|--------------|---------------|
| SQL        | High        | Medium       | ⭐⭐⭐⭐⭐        |
| Python     | High        | High         | ⭐⭐⭐⭐⭐        |
| Tableau    | Medium      | Medium       | ⭐⭐⭐⭐         |
| AWS        | Low         | High         | ⭐⭐⭐⭐         |
| BigQuery   | Low         | High         | ⭐⭐⭐⭐         |

**Key Insights**

- **Python** is the most balanced skill
 It offers both high demand and high salary, making it the most valuable skill to learn.
- **SQL** is essential but not premium
SQL has the highest demand but slightly lower salary impact, meaning it is a required foundation rather than a differentiator.
- **Cloud skills** offer high reward with lower competition
Tools like AWS and BigQuery appear less frequently but are linked to higher salaries, making them excellent for specialization.
- **Visualization** tools provide steady value
Tableau offers moderate demand and salary, making it a reliable supporting skill.

<img src="assets\4 _optimal_skills.png" width="700">

**Final Takeaway**

The best strategy is not to focus on a single skill, but to build a layered skill set:

- Start with SQL (must-have)
- Add Python (high impact)
- Expand into cloud technologies (high salary potential)

The optimal path is a balance between accessibility (demand) and profitability (salary).

# What I Learned

Through this project, I gained both technical and analytical insights into the data job market and the skills required to succeed as a data analyst.

- **SQL is the foundation of data analysis**
Almost every analysis and insight in this project relied on SQL, reinforcing its importance as a core skill.
- **Not all in-demand skills are high-paying**
Skills like SQL and Tableau are highly demanded but do not always lead to the highest salaries, highlighting the difference between demand and value.
- **Specialized skills drive higher salaries**
Cloud technologies and advanced tools (e.g., AWS, BigQuery) are less common but offer higher earning potential.
- **Combining skills is more powerful than mastering one**
The most valuable roles require a mix of **data querying, programming, and visualization skills.**
- **Data can guide career decisions**
This project showed how real-world data can be used to make smarter, evidence-based career choices instead of relying on assumptions.

**Personal Growth**

- Improved my ability to write complex SQL queries
- Learned how to analyze and interpret real-world datasets
- Developed skills in presenting insights clearly for others (GitHub storytelling)
# Conclution

This project provides a comprehensive, data-driven view of the data analyst job market, highlighting the relationship between skills, demand, and salary. By analyzing job postings, it becomes clear that while foundational skills like SQL are essential for entering the field, higher salaries are driven by specialized and advanced skills, particularly in programming and cloud technologies.

The analysis also shows that the most successful data analysts are not defined by a single skill, but by a well-rounded toolkit that combines data extraction, analysis, and visualization. Additionally, the gap between high-demand and high-paying skills emphasizes the importance of strategic learning rather than simply following trends.

Overall, this project demonstrates how data can be used to make informed career decisions. By focusing on skills that balance demand and salary, aspiring data analysts can build a more efficient and rewardi**ng path into the field.

**Final Thought**

The key to success in data analytics is not just learning tools, but understanding which skills create the most value in the market.

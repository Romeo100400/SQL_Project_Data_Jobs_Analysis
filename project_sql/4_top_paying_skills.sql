/*
Answer: What are the top skills based on salary in the UK?
 - Look at the average salary associated with each skill for Data Analyst positions
-- Focuses on REMOTE Data Analyst roles with specified salaries in the United Kingdom
 - Why? It reveals how different skills impact salary levels for Data Analysts and
        helps identify the most financially rewarding skills to acquire or improve
*/

SELECT
    skills,
    ROUND(AVG(salary_year_avg),0) AS avg_salary
FROM job_postings_fact
INNER JOIN skills_job_dim 
    ON job_postings_fact.job_id = skills_job_dim.job_id
INNER JOIN skills_dim 
    ON skills_job_dim.skill_id = skills_dim.skill_id
WHERE
    job_title_short = 'Data Analyst'
    AND salary_year_avg IS NOT NULL
    AND job_country = 'United Kingdom'   -- UK focus
    AND job_work_from_home = True
GROUP BY
    skills
ORDER BY
    avg_salary DESC
LIMIT 25;

/*
Here's a breakdown of the results for top paying skills:

- High Demand for Big Data & ML Skills: Tools such as PySpark, Jupyter, Pandas.
- Software Development & Deployment Proficiency: Skills like GitLab, Bitbucket, Jenkins.
- Cloud & Data Infrastructure Expertise: Proficiency with Elasticsearch, Databricks, GCP.
*/

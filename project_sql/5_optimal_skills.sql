/*
Answer: What are the most optimal skills to learn (aka skills that are both in high demand and high-paying)?
 - Identify skills in high demand and associated with high average salaries for Data Analyst roles
 - Concentrates on remote positions with specified salaries in the UK & US
 - Why? Targets skills that offer job security (high demand) and financial benefits (high salaries),
        offering strategic insights for career development in data analysis
*/

SELECT
    skills_dim.skill_id,
    skills_dim.skills,
    COUNT(DISTINCT skills_job_dim.job_id) AS demand_count,
    ROUND(AVG(job_postings_fact.salary_year_avg), 0) AS avg_salary
FROM job_postings_fact
INNER JOIN skills_job_dim ON job_postings_fact.job_id = skills_job_dim.job_id
INNER JOIN skills_dim ON skills_job_dim.skill_id = skills_dim.skill_id
WHERE
    job_title_short = 'Data Analyst'
    AND salary_year_avg IS NOT NULL
    AND job_work_from_home = TRUE
    AND job_country IN ('United Kingdom', 'United States')
GROUP BY
    skills_dim.skill_id,
    skills_dim.skills
HAVING
    COUNT(DISTINCT skills_job_dim.job_id) >= 5
ORDER BY
    avg_salary DESC,
    demand_count DESC
LIMIT 25;

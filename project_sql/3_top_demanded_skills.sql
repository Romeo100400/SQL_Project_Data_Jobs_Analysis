/*
-- Question: What are the most in-demand skills for REMOTE data analysts in the UK & US?
 - Join job postings to inner join table similar to query 2
 - Identify the top 5 in-demand skills for a data analyst.
-- Focus on job postings in the United Kingdom & United States.
 - Why? Retrieves the top 5 skills with the highest demand in these regions,
        providing insights into valuable skills for job seekers.

*/

SELECT
    skills,
    COUNT(DISTINCT skills_job_dim.job_id) AS demand_count     -- count how many times each skill appears
FROM job_postings_fact
INNER JOIN skills_job_dim 
    ON job_postings_fact.job_id = skills_job_dim.job_id
INNER JOIN skills_dim 
    ON skills_job_dim.skill_id = skills_dim.skill_id
WHERE
    job_title_short = 'Data Analyst'                                  -- only data analyst roles
    AND job_country IN ('United Kingdom', 'United States')            --UK & US focus
    AND job_work_from_home = TRUE                                     -- Only remote jobs
GROUP BY
    skills
ORDER BY
    demand_count DESC
LIMIT 5;

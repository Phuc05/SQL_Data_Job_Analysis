-- SUBQUERIES
SELECT
    skills_dim.skills AS skills_name,
    top_skills.job_posting_count
FROM
    (SELECT
         skills_job_dim.skill_id AS skill_id,
         COUNT(*) AS job_posting_count
     FROM skills_job_dim
     GROUP BY
         skill_id
     ORDER BY
         job_posting_count DESC
     LIMIT 5) AS top_skills
LEFT JOIN skills_dim
    ON top_skills.skill_id = skills_dim.skill_id;

-- question 2
SELECT
    company_dim.name as name,
    CASE
        WHEN jpf.job_count > 50 THEN 'Large'
        WHEN jpf.job_count >= 10 THEN 'Medium'
        ELSE 'Small'
    END AS company_size,
    jpf.job_count AS job_count
FROM company_dim
LEFT JOIN (SELECT job_postings_fact.company_id AS company_id,
                  COUNT(*)                     AS job_count
           FROM job_postings_fact
           GROUP BY job_postings_fact.company_id) AS jpf
ON company_dim.company_id = jpf.company_id;

-- CTEs


SELECT *
FROM job_postings_fact;

SELECT *
FROM company_dim;

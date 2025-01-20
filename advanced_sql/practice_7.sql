SELECT
    skills_dim.skill_id AS skill_id,
    skills_dim.skills AS skills_name,
    job_count.job_count_per_skills
FROM skills_dim
LEFT JOIN (
    SELECT
        skills_job_dim.skill_id AS skill_id,
        COUNT(*) AS job_count_per_skills
    FROM skills_job_dim
    WHERE
        skills_job_dim.job_id IN
        (SELECT
             job_postings_fact.job_id
         FROM job_postings_fact
         WHERE job_postings_fact.job_location = 'Anywhere')
    GROUP BY
        skills_job_dim.skill_id
) as job_count
ON skills_dim.skill_id = job_count.skill_id
ORDER BY
    job_count_per_skills DESC
LIMIT 5;

SELECT *
FROM job_postings_fact;
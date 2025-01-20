SELECT
    january_jobs.job_title,
    skills_dim.skills as skill_id,
    skills_dim.type as type,
    january_jobs.salary_year_avg
FROM
    (
        SELECT
            january_jobs.job_title,
            skills_job_dim.skill_id,
            january_jobs.salary_year_avg
        FROM
            january_jobs
        LEFT JOIN skills_job_dim
        ON  january_jobs.job_id = skills_job_dim.job_id
        WHERE
            january_jobs.salary_year_avg >= 70000
        ) as january_jobs
LEFT JOIN skills_dim
ON january_jobs.skill_id = skills_dim.skill_id

UNION ALL
SELECT
    february_jobs.job_title,
    skills_dim.skills as skill_id,
    skills_dim.type as type,
    february_jobs.salary_year_avg
FROM
    (
        SELECT
            february_jobs.job_title,
            skills_job_dim.skill_id,
            february_jobs.salary_year_avg
        FROM
            february_jobs
        LEFT JOIN skills_job_dim
        ON  february_jobs.job_id = skills_job_dim.job_id
        WHERE
            february_jobs.salary_year_avg >= 70000
        ) as february_jobs
LEFT JOIN skills_dim
ON february_jobs.skill_id = skills_dim.skill_id;
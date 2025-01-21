/*
 Question:  What skills are required for the top-paying data analyst jobs?
 - Use the top 10 highest-paying Data Analyst jobs from first query
 - Add the specific skills required for these roles
 - Why? It provides a detailed look at which high-paying jobs demand certain skill,
    helping job seekers understand which skills to develop that align with top salaries
 */
SELECT
    top_paying_data_analyst_role.job_id,
    top_paying_data_analyst_role.job_title,
    top_paying_data_analyst_role.job_location,
    skills.skills,
    skills.skill_id
-- this is the query from last practice
FROM (
     SELECT
         job_id,
         job_title,
         job_location,
         job_schedule_type,
         salary_year_avg,
         job_posted_date,
         company_dim.name
     FROM
         job_postings_fact
     LEFT JOIN company_dim
     ON
         job_postings_fact.company_id = company_dim.company_id
     WHERE
         job_title_short = 'Data Analyst'
        AND
         job_location = 'Anywhere'
        AND
         salary_year_avg IS NOT NULL
     ORDER BY
         salary_year_avg DESC
     LIMIT 10
     ) AS top_paying_data_analyst_role
-- use inner join because we don't care much about jobs which don't require any skills
INNER JOIN (SELECT job_id,
                  skills_job_dim.skill_id,
                  skills_dim.skills
           FROM skills_job_dim
                    LEFT JOIN
                skills_dim
                ON skills_job_dim.skill_id = skills_dim.skill_id
           WHERE
               skills_dim.skills IS NOT NULL
           ) AS skills
ON top_paying_data_analyst_role.job_id = skills.job_id;

-- Analyze results
SELECT *
FROM skills_job_dim
WHERE
    job_id = '552322';

-- Another way:
/*
 Use CTEs:
 WITH top_paying_data_analyst_role AS
    (SELECT ...)
 SELECT *
 FROM top_paying_data_analyst_role.*,
 INNER JOIN skills_job_dims ON ...
 INNER JOIN skills_dim ON ...
 */
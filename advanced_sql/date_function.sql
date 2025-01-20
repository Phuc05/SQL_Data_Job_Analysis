-- question 1
SELECT
    sub_jpf.job_schedule_type as job_type,
    AVG(sub_jpf.salary_hour_avg) as hourly_avg,
    AVG(sub_jpf.salary_year_avg) as yearly_avg,
    MIN(sub_jpf.job_posted_date) as first_posted_date
FROM (SELECT * FROM job_postings_fact as jpf
    WHERE jpf.job_posted_date::DATE >= '2023-06-01') AS sub_jpf
GROUP BY sub_jpf.job_schedule_type
LIMIT 10;

-- question 2
SELECT
    EXTRACT(MONTH FROM jpf.job_posted_date AT TIME ZONE 'UTC' AT TIME ZONE 'EST') AS month,
    COUNT(jpf.job_id) AS job_count
FROM job_postings_fact AS jpf
WHERE
    jpf.job_posted_date >= '2023-01-01'
    AND jpf.job_posted_date <= '2023-12-31'
GROUP BY month;

-- question 3
SELECT company_dim.name AS company_name,
        jpf.company_id as company_id,
        EXTRACT(QUARTER from jpf.job_posted_date) as quarter
FROM company_dim
LEFT JOIN job_postings_fact as jpf
ON company_dim.company_id = jpf.company_id
WHERE
    jpf.job_health_insurance = True
    AND EXTRACT(YEAR from jpf.job_posted_date) = 2023;
SELECT *
FROM job_postings_fact
WHERE job_postings_fact.job_schedule_type = 'Contractor and Internship'
AND job_postings_fact.salary_year_avg IS NOT NULL
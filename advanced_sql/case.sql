SELECT
    jpf.job_title_short,
    CASE
        WHEN AVG(jpf.salary_year_avg) >= 100000 THEN 'HIGH'
        WHEN AVG(jpf.salary_year_avg) >= 90000 THEN 'STANDARD'
        ELSE 'LOW'
    END AS category_salary
FROM job_postings_fact as jpf
GROUP BY
    jpf.job_title_short;

SELECT *
FROM job_postings_fact
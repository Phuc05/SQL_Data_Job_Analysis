CREATE TABLE january_jobs AS
    SELECT *
    FROM job_postings_fact AS jpf
    WHERE
        EXTRACT(MONTH FROM jpf.job_posted_date) = 1;

CREATE TABLE february_jobs AS
    SELECT *
    FROM job_postings_fact AS jpf
    WHERE
        EXTRACT(MONTH FROM jpf.job_posted_date) = 2;

CREATE TABLE march_jobs AS
    SELECT *
    FROM job_postings_fact AS jpf
    WHERE
        EXTRACT(MONTH FROM jpf.job_posted_date) = 3;
    -- GROUP BY
    -- HAVING
    -- ORDER
    -- LIMIT 10;

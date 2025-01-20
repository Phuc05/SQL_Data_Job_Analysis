CREATE TABLE job_applied(
    job_id INT,
    application_date DATE,
    custom_resume BOOLEAN,
    resume_file_name VARCHAR(255),
    cover_letter_sent BOOLEAN,
    cover_letter_file_name VARCHAR(255),
    status VARCHAR(50)
);

INSERT INTO job_applied(job_id, application_date, custom_resume, resume_file_name, cover_letter_sent, cover_letter_file_name, status)
VALUES
    (1,
     '2024-12-31',
     TRUE,
     'KHOAI.PDF',
     TRUE,
     'COVER_LETTER.PDF',
     'INTERVIEW ROUND 1');

ALTER TABLE job_applied
ADD COLUMN contact VARCHAR(255);

UPDATE job_applied
SET contact = 'Phuc'
WHERE job_id = 1;

ALTER TABLE job_applied
RENAME COLUMN contact TO contact_name;

ALTER TABLE job_applied
ALTER COLUMN contact_name TYPE TEXT;

ALTER TABLE job_applied
DROP COLUMN contact;

DROP TABLE job_applied;

SELECT *
FROM job_applied
-- Using  Oracle Database 19c on https://livesql.oracle.com/

--Query to find all those employees that have reported all possible symptoms
SELECT e.EMPLOYEE_ID, e.NAME
FROM EMPLOYEE e
WHERE NOT EXISTS (
    SELECT s.SYMPTOM_ID
    FROM (SELECT DISTINCT SYMPTOM_ID FROM SYMPTOM) s
    LEFT JOIN SYMPTOM s2 ON s.SYMPTOM_ID = s2.SYMPTOM_ID AND s2.EMPLOYEE_ID = e.EMPLOYEE_ID
    WHERE s2.SYMPTOM_ID IS NULL
);

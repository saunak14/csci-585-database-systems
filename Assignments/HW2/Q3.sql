-- Using  Oracle Database 19c on https://livesql.oracle.com/

SELECT FLOOR_NO, COUNT(*) AS SICK_EMPLOYEES_COUNT FROM EMPLOYEE
WHERE EMPLOYEE_ID IN (
    SELECT EMPLOYEE_ID FROM TEST
    WHERE TEST_RESULT = 'positive'
    UNION
    SELECT EMPLOYEE_ID FROM HEALTH_STATUS
    WHERE STATUS = 'sick')
GROUP BY FLOOR_NO
FETCH FIRST 1 ROWS ONLY;

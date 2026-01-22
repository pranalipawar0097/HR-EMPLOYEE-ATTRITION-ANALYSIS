IBM HR Analytics Employee Attrition

CREATE DATABASE PROJECT_1;

USE PROJECT_1;

# What is the overall attrition rate?
# Which department has the highest attrition?
# Does monthly income affect attrition?
# Is overtime linked to higher attrition?
# Which job roles have highest attrition?
# Does experience (YearsAtCompany) matter?
# Does job satisfaction affect attrition?

CREATE TABLE employees (
    Age INT,
    Attrition VARCHAR(5),
    Department VARCHAR(50),
    JobRole VARCHAR(50),
    MonthlyIncome INT,
    JobSatisfaction INT,
    YearsAtCompany INT,
    OverTime VARCHAR(5),
    WorkLifeBalance INT,
    PerformanceRating INT
);

SELECT COUNT(*) FROM employees;

describe employees; 

drop table employees;

RENAME TABLE `wa_fn-usec_-hr-employee-attrition` TO employees;

SELECT COUNT(*) FROM employees;

describe employees;

SELECT DISTINCT Attrition FROM employees;

SELECT Attrition, COUNT(*) 
FROM employees
GROUP BY Attrition;

SELECT 
    ROUND(
        SUM(CASE WHEN Attrition = 'Yes' THEN 1 ELSE 0 END) * 100.0 / COUNT(*), 
        2
    ) AS attrition_rate_percent
FROM employees;

SELECT 
    Department,
    COUNT(*) AS total_employees,
    SUM(CASE WHEN Attrition = 'Yes' THEN 1 ELSE 0 END) AS attrition_count,
    ROUND(
        SUM(CASE WHEN Attrition = 'Yes' THEN 1 ELSE 0 END) * 100.0 / COUNT(*),
        2
    ) AS attrition_rate
FROM employees
GROUP BY Department
ORDER BY attrition_rate DESC;

SELECT 
    Attrition,
    ROUND(AVG(MonthlyIncome), 2) AS avg_monthly_income
FROM employees
GROUP BY Attrition;

SELECT 
    OverTime,
    COUNT(*) AS total_employees,
    SUM(CASE WHEN Attrition = 'Yes' THEN 1 ELSE 0 END) AS attrition_count,
    ROUND(
        SUM(CASE WHEN Attrition = 'Yes' THEN 1 ELSE 0 END) * 100.0 / COUNT(*),
        2
    ) AS attrition_rate
FROM employees
GROUP BY OverTime;

SELECT 
    JobRole,
    COUNT(*) AS total_employees,
    SUM(CASE WHEN Attrition = 'Yes' THEN 1 ELSE 0 END) AS attrition_count,
    ROUND(
        SUM(CASE WHEN Attrition = 'Yes' THEN 1 ELSE 0 END) * 100.0 / COUNT(*),
        2
    ) AS attrition_rate
FROM employees
GROUP BY JobRole
ORDER BY attrition_rate DESC;

SELECT 
    Attrition,
    ROUND(AVG(YearsAtCompany), 2) AS avg_years_at_company
FROM employees
GROUP BY Attrition;

SELECT 
    JobSatisfaction,
    COUNT(*) AS total_employees,
    SUM(CASE WHEN Attrition = 'Yes' THEN 1 ELSE 0 END) AS attrition_count,
    ROUND(
        SUM(CASE WHEN Attrition = 'Yes' THEN 1 ELSE 0 END) * 100.0 / COUNT(*),
        2
    ) AS attrition_rate
FROM employees
GROUP BY JobSatisfaction
ORDER BY JobSatisfaction;









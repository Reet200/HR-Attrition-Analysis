CREATE DATABASE Hr_Attrition;
USE Hr_Attrition;

select * from Hr_data;
SELECT Count(*) from Hr_Data;
SELECT 
    Attrition,
    COUNT(*) as total,
    ROUND(COUNT(*) * 100.0 / (SELECT COUNT(*) FROM hr_data), 2) as percentage
FROM hr_data
GROUP BY Attrition;

SELECT 
    Department,
    COUNT(*) as total_employees,
    SUM(CASE WHEN Attrition = 'Yes' THEN 1 ELSE 0 END) as attrition_count,
    ROUND(SUM(CASE WHEN Attrition = 'Yes' THEN 1 ELSE 0 END) * 100.0 / COUNT(*), 2) as attrition_rate
FROM hr_data
GROUP BY Department
ORDER BY attrition_rate DESC;

SELECT 
    JobRole,
    ROUND(AVG(MonthlyIncome), 2) as avg_salary,
    COUNT(*) as total_employees
FROM hr_data
GROUP BY JobRole
ORDER BY avg_salary DESC;

SELECT 
    JobRole,
    COUNT(*) as total,
    SUM(CASE WHEN Attrition = 'Yes' THEN 1 ELSE 0 END) as attrition_count,
    ROUND(SUM(CASE WHEN Attrition = 'Yes' THEN 1 ELSE 0 END) * 100.0 / COUNT(*), 2) as attrition_rate
FROM hr_data
GROUP BY JobRole
ORDER BY attrition_rate DESC;	
SELECT 
    BusinessTravel,
    COUNT(*) as total,
    SUM(CASE WHEN Attrition = 'Yes' THEN 1 ELSE 0 END) as attrition_count,
    ROUND(SUM(CASE WHEN Attrition = 'Yes' THEN 1 ELSE 0 END) * 100.0 / COUNT(*), 2) as attrition_rate
FROM hr_data
GROUP BY BusinessTravel
ORDER BY attrition_rate DESC;

SELECT 
    CASE 
        WHEN 'Age' < 25 THEN 'Under 25'
        WHEN 'Age' BETWEEN 25 AND 34 THEN '25-34'
        WHEN 'Age' BETWEEN 35 AND 44 THEN '35-44'
        WHEN 'Age' BETWEEN 45 AND 54 THEN '45-54'
        ELSE '55+'
    END as age_group,
    COUNT(*) as total,
    SUM(CASE WHEN Attrition = 'Yes' THEN 1 ELSE 0 END) as attrition_count,
    ROUND(SUM(CASE WHEN Attrition = 'Yes' THEN 1 ELSE 0 END) * 100.0 / COUNT(*), 2) as attrition_rate
FROM hr_data
GROUP BY age_group
ORDER BY attrition_rate DESC;

SELECT 
    JobSatisfaction,
    CASE JobSatisfaction 
        WHEN 1 THEN 'Low'
        WHEN 2 THEN 'Medium'
        WHEN 3 THEN 'High'
        WHEN 4 THEN 'Very High'
    END as satisfaction_level,
    COUNT(*) as total,
    SUM(CASE WHEN Attrition = 'Yes' THEN 1 ELSE 0 END) as attrition_count,
    ROUND(SUM(CASE WHEN Attrition = 'Yes' THEN 1 ELSE 0 END) * 100.0 / COUNT(*), 2) as attrition_rate
FROM hr_data
GROUP BY JobSatisfaction
ORDER BY attrition_rate DESC;

SELECT 
    OverTime,
    COUNT(*) as total,
    SUM(CASE WHEN Attrition = 'Yes' THEN 1 ELSE 0 END) as attrition_count,
    ROUND(SUM(CASE WHEN Attrition = 'Yes' THEN 1 ELSE 0 END) * 100.0 / COUNT(*), 2) as attrition_rate
FROM hr_data
GROUP BY OverTime
ORDER BY attrition_rate DESC;

SELECT 
    Attrition,
    ROUND(AVG(YearsAtCompany), 1) as avg_years,
    ROUND(AVG(MonthlyIncome), 0) as avg_salary,
    ROUND(AVG(Age), 1) as avg_age
FROM hr_data
GROUP BY Attrition;

SELECT 
    Department,
    JobRole,
    OverTime,
    BusinessTravel,
    ROUND(AVG(MonthlyIncome), 0) as avg_salary,
    COUNT(*) as total,
    SUM(CASE WHEN Attrition = 'Yes' THEN 1 ELSE 0 END) as attrition_count,
    ROUND(SUM(CASE WHEN Attrition = 'Yes' THEN 1 ELSE 0 END) * 100.0 / COUNT(*), 2) as attrition_rate
FROM hr_data
GROUP BY Department, JobRole, OverTime, BusinessTravel
HAVING COUNT(*) > 5
ORDER BY attrition_rate DESC
LIMIT 10;
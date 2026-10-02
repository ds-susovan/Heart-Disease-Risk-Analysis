select * from scott_schema.heart_disease;
-- Total Patients,Average age & average Cholesterol
select count(*) as Total_Patients,
round(avg(Age),1) as Avg_Age,
round(Avg(Chol),1) as Avg_Chol,
round(avg(trestbps),1) as avg_restingbp
From scott_schema.heart_disease;

-- Gender wise Patient Breakdown & Average Health Metrics
select trim(Sex) as Sex,count(*) as Patient_Count,
round(Avg(Chol),1) as Avg_Chol,
round(Avg(trestbps),1) as Avg_BP,
round(Avg(thalach),1) as Avg_Max_Heart_Rate
From scott_schema.heart_disease
group by trim(Sex);

-- Age Group Distribution & Risk Analysis
SELECT 
    CASE 
        WHEN Age < 40 THEN 'Under 40'
        WHEN Age BETWEEN 40 AND 55 THEN '40-55 (Middle Age)'
        WHEN Age BETWEEN 56 AND 70 THEN '56-70 (Senior)'
        ELSE 'Above 70'
    END AS Age_Group,
    COUNT(*) AS Patient_Count,
    ROUND(AVG(Chol), 1) AS Avg_Cholesterol,
    ROUND(AVG(trestbps), 1) AS Avg_BP
FROM scott_schema.heart_disease
GROUP BY 
    CASE 
        WHEN Age < 40 THEN 'Under 40'
        WHEN Age BETWEEN 40 AND 55 THEN '40-55 (Middle Age)'
        WHEN Age BETWEEN 56 AND 70 THEN '56-70 (Senior)'
        ELSE 'Above 70'
    END
ORDER BY Avg_Cholesterol DESC;

-- Chest Pain Type (cp) vs High Risk Factors
SELECT 
    cp,
    COUNT(*) AS Total_Patients,
    ROUND(AVG(thalach), 1) AS Avg_Max_Heart_Rate,
    ROUND(AVG(Chol), 1) AS Avg_Cholesterol
FROM scott_schema.heart_disease
GROUP BY cp
ORDER BY Total_Patients DESC;

-- Exercise Induced Angina (exang) & High Blood Sugar (fbs) Impact
SELECT 
    trim(Sex),
    exang,
    COUNT(*) AS Patient_Count,
    SUM(CASE WHEN fbs = 1 THEN 1 ELSE 0 END) AS High_Blood_Sugar_Count
FROM scott_schema.heart_disease
GROUP BY trim(Sex), exang;


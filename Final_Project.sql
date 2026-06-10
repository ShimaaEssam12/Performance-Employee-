-- CREATING AND UPLOADED TABLE

CREATE DATABASE IF NOT EXISTS final_project
CHARACTER SET utf8mb4
COLLATE utf8mb4_unicode_ci;
/* Created database and used code OPT_LOCAL_INFILE=1 while creating the database 
and used CHARACTER SET utf8mb4 & COLLATE utf8mb4_unicode_ci incase used any language except english*/


USE final_project;
/* Upload table final_project_sql and changed fiel type of number_of_virtual_meetings 
to TEXT as while using as numer removed blank rows */


-- Rename the table to employees_data and row employee_id

ALTER TABLE final_project_sql RENAME TO employees_data;

ALTER TABLE employees_data RENAME COLUMN ï»¿Employee_ID TO Employee_ID;


-- CHECKING

SELECT COUNT(*) AS total_rows FROM employees_data;  
-- found 5000 rows

SELECT COUNT(*) AS total_columns
FROM information_schema.columns 
WHERE table_schema = DATABASE() AND table_name = 'employees_data';  
-- found 31 columns

SELECT COUNT(*) AS null_employee_rows 
FROM employees_data 
WHERE Employee_ID IS NULL;   
-- found 0 blank rows in employee_id

SELECT Employee_ID, COUNT(*) AS duplicate_count
FROM employees_data
GROUP BY Employee_ID
HAVING COUNT(*) > 1;
-- found 0 duplicated in employee_id


-- Calculate the number of missing (NULL) values ​and spaces ' '

SELECT 
    SUM(CASE WHEN Age IS NULL OR TRIM(Age)=' ' THEN 1  ELSE 0  END) AS missing_Age,
	SUM(CASE WHEN Gender IS NULL OR TRIM(Gender)=' ' THEN 1  ELSE 0  END) AS missing_Gender,
	SUM(CASE WHEN Job_Role IS NULL OR TRIM(Job_Role)=' ' THEN 1  ELSE 0  END) AS missing_Job_Role,
	SUM(CASE WHEN Industry IS NULL OR TRIM(Industry)=' ' THEN 1  ELSE 0  END) AS missing_Industry,
	SUM(CASE WHEN Years_of_Experience IS NULL OR TRIM(Years_of_Experience)=' ' THEN 1  ELSE 0  END) AS missing_Years_of_Experience,
	SUM(CASE WHEN Work_Location IS NULL OR TRIM(Work_Location)=' ' THEN 1  ELSE 0  END) AS missing_Work_Location,
	SUM(CASE WHEN Hours_Worked_Per_Week IS NULL OR TRIM(Hours_Worked_Per_Week)=' ' THEN 1  ELSE 0  END) AS missing_Hours_Worked_Per_Week,
	SUM(CASE WHEN Number_of_Virtual_Meetings IS NULL OR TRIM(Number_of_Virtual_Meetings)=' ' THEN 1  ELSE 0  END) AS missing_Number_of_Virtual_Meetings,
	SUM(CASE WHEN Work_Life_Balance_Rating IS NULL OR TRIM(Work_Life_Balance_Rating)=' ' THEN 1  ELSE 0  END) AS missing_Work_Life_Balance_Rating,
	SUM(CASE WHEN Stress_Level IS NULL OR TRIM(Stress_Level)=' ' THEN 1  ELSE 0  END) AS missing_Stress_Level,
	SUM(CASE WHEN Mental_Health_Condition IS NULL OR TRIM(Mental_Health_Condition)=' ' THEN 1  ELSE 0  END) AS missing_Mental_Health_Condition,
	SUM(CASE WHEN Access_to_Mental_Health_Resources IS NULL OR TRIM(Access_to_Mental_Health_Resources)=' ' THEN 1  ELSE 0  END) AS missing_Access_to_Mental_Health_Resources,
	SUM(CASE WHEN Productivity_Change IS NULL OR TRIM(Productivity_Change)=' ' THEN 1  ELSE 0  END) AS missing_Productivity_Change,
	SUM(CASE WHEN Social_Isolation_Rating IS NULL OR TRIM(Social_Isolation_Rating)=' ' THEN 1  ELSE 0  END) AS missing_Social_Isolation_Rating,
	SUM(CASE WHEN Satisfaction_with_Remote_Work IS NULL OR TRIM(Satisfaction_with_Remote_Work)=' ' THEN 1  ELSE 0  END) AS missing_Satisfaction_with_Remote_Work,
	SUM(CASE WHEN Company_Support_for_Remote_Work IS NULL OR TRIM(Company_Support_for_Remote_Work)=' ' THEN 1  ELSE 0  END) AS missing_Company_Support_for_Remote_Work,
	SUM(CASE WHEN Physical_Activity IS NULL OR TRIM(Physical_Activity)=' ' THEN 1  ELSE 0  END) AS missing_Physical_Activity,
	SUM(CASE WHEN Sleep_Quality IS NULL OR TRIM(Sleep_Quality)=' ' THEN 1  ELSE 0  END) AS missing_Sleep_Quality,
	SUM(CASE WHEN Region IS NULL OR TRIM(Region)=' ' THEN 1  ELSE 0  END) AS missing_Region,
	SUM(CASE WHEN Avg_Device_Watts IS NULL OR TRIM(Avg_Device_Watts)=' ' THEN 1  ELSE 0  END) AS missing_Avg_Device_Watts,
	SUM(CASE WHEN Hours_Per_Day IS NULL OR TRIM(Hours_Per_Day)=' ' THEN 1  ELSE 0  END) AS missing_Hours_Per_Day,
	SUM(CASE WHEN Daily_kWh IS NULL OR TRIM(Daily_kWh)=' ' THEN 1  ELSE 0  END) AS missing_Daily_kWh,
	SUM(CASE WHEN Monthly_kWh IS NULL OR TRIM(Monthly_kWh)=' ' THEN 1  ELSE 0  END) AS missing_Monthly_kWh,
	SUM(CASE WHEN Electricity_Consumption_kWh IS NULL OR TRIM(Electricity_Consumption_kWh)=' ' THEN 1  ELSE 0  END) AS missing_Electricity_Consumption_kWh,
	SUM(CASE WHEN Electricity_Cost_EGP IS NULL OR TRIM(Electricity_Cost_EGP)=' ' THEN 1  ELSE 0  END) AS missing_Electricity_Cost_EGP,
    SUM(CASE WHEN Food_Cost IS NULL OR TRIM(Food_Cost)=' ' THEN 1  ELSE 0  END) AS missing_Food_Cost,
	SUM(CASE WHEN Transport_Cost IS NULL OR TRIM(Transport_Cost)=' ' THEN 1  ELSE 0  END) AS missing_Transport_Cost,
	SUM(CASE WHEN Performance IS NULL OR TRIM(Performance)=' ' THEN 1  ELSE 0  END) AS missing_Performance,                                                                                                                                                                                                                                
   	SUM(CASE WHEN Country IS NULL OR TRIM(Country)=' ' THEN 1  ELSE 0  END) AS missing_Country,
	SUM(CASE WHEN Season IS NULL OR TRIM(Season)=' ' THEN 1  ELSE 0  END) AS missing_Season
FROM employees_data;
  /* found missing 327 in missing_Number_of_Virtual_Meetings  
                   1196 in missing_Mental_Health_Condition
                   1629 in missing_Physical_Activity */
    
    
-- Ensure consistency of text and values ​​within all text columns to avoid spelling mistakes

SELECT DISTINCT Gender FROM employees_data;     -- Only 4 / There are no spelling mistakes. (Non-binary/Female/Male/Prefer not to say)

SELECT DISTINCT Job_Role FROM employees_data;    -- Only 7 / There are no spelling mistakes.  (HR/Data Scientist/Software Engineer/Sales/Marketing/Designer/Project Manager)

SELECT DISTINCT Industry FROM employees_data;    -- Only 7 / There are no spelling mistakes.  (Healthcare/IT/Education/Finance/Consulting/Manufacturing/Retail)

SELECT DISTINCT Work_Location FROM employees_data;    -- Only 3 / There are no spelling mistakes.  (Hybrid/Remote/Onsite)

SELECT DISTINCT Stress_Level FROM employees_data;     -- Only 3 / There are no spelling mistakes.('Medium'/'High'/'Low')

SELECT DISTINCT Mental_Health_Condition FROM employees_data;  -- Only 3 and 1 missing / There are no spelling mistakes.(Depression/Anxiety/Burnout)

SELECT DISTINCT Access_to_Mental_Health_Resources FROM employees_data;   -- Only 2 / There are no spelling mistakes.(Yes/No)

SELECT DISTINCT Productivity_Change FROM employees_data;   -- Only 3 / There are no spelling mistakes.(Decrease/Increase/No Change)

SELECT DISTINCT Satisfaction_with_Remote_Work FROM employees_data;   -- Only 3 / There are no spelling mistakes.(Unsatisfied/Satisfied/Neutral)

SELECT DISTINCT Physical_Activity FROM employees_data;   -- Only 2 and 1 missing / There are no spelling mistakes. (Weekly/Daily)

SELECT DISTINCT Sleep_Quality FROM employees_data;   -- Only 3 / There are no spelling mistakes. (Good/Poor/Average)

SELECT DISTINCT Region FROM employees_data;   -- Only 6 / There are no spelling mistakes. (Europe/Asia/North America/South America/Oceania/Africa)

SELECT DISTINCT Country FROM employees_data;   -- Only 6 / There are no spelling mistakes. (USA/UK/Japan/Egypt/Brazil/Australia)

SELECT DISTINCT Season FROM employees_data;   -- Only 2 / There are no spelling mistakes.  (Winter/Summer)


-- CLEANING

SET SQL_SAFE_UPDATES = 0;


UPDATE employees_data
SET Mental_Health_Condition = 'No Condition'
WHERE Mental_Health_Condition IS NULL
OR TRIM(Mental_Health_Condition) = ' ';
-- changed all missing and empty spaces to No Condition// 1196

UPDATE employees_data
SET Number_of_Virtual_Meetings = 0
WHERE Number_of_Virtual_Meetings IS NULL
OR TRIM(Number_of_Virtual_Meetings) = ' ';
-- changed all missing and empty spaces to 0// 327

ALTER TABLE employees_data 
MODIFY COLUMN Number_of_Virtual_Meetings INT;
-- now can changed field_type of Number_of_Virtual_Meetings as filled the missing data

UPDATE employees_data
SET Physical_Activity = 'Unknown'
WHERE Physical_Activity IS NULL
OR TRIM(Physical_Activity) = ' ';
-- changed all missing and empty spaces to Unknown// 1629


-- TO makesure that there's no empty CLEAN TEXT FIELDS (TRIM + STANDARD CASE)

UPDATE employees_data
SET 
      Gender = NULLIF(TRIM(Gender), ''),
      Job_Role = NULLIF(TRIM(Job_Role), ''),
      Industry = NULLIF(TRIM(Industry), ''),
      Work_Location = NULLIF(TRIM(Work_Location), ''),
      Stress_Level = NULLIF(TRIM(Stress_Level), ''),
      Mental_Health_Condition = NULLIF(TRIM(Mental_Health_Condition), ''),
      Access_to_Mental_Health_Resources = NULLIF(TRIM(Access_to_Mental_Health_Resources), ''),
      Productivity_Change = NULLIF(TRIM(Productivity_Change), ''),
      Satisfaction_with_Remote_Work = NULLIF(TRIM(Satisfaction_with_Remote_Work), ''),
      Physical_Activity = NULLIF(TRIM(Physical_Activity), ''),
      Sleep_Quality = NULLIF(TRIM(Sleep_Quality), ''),
      Region = NULLIF(TRIM(Region), ''),
      Country = NULLIF(TRIM(Country), ''),
      Season = NULLIF(TRIM(Season), '');
-- 0 CHANGED
   
   
-- ADD new column to sum costs

ALTER TABLE employees_data
ADD COLUMN Total_Cost VARCHAR(50) NOT NULL;

UPDATE employees_data
SET Total_Cost = CAST(ROUND(Electricity_Cost_EGP + Food_Cost + Transport_Cost, 2) AS CHAR(50));
      
      SELECT * FROM employees_data;
      
/*==============================================================================================
CREATE NEW TABLE CLEANED TO USE THE DATA I NEED
==============================================================================================*/

-- Cleaned Table
CREATE TABLE Employees_cleaned AS
SELECT 
Employee_ID, Gender, Job_Role, Industry, Work_Location, Mental_Health_Condition, 
Electricity_Consumption_kWh, Performance, Country, Season, Total_Cost
FROM employees_data;

 SELECT * FROM Employees_cleaned;


/*==============================================================================================
CREATE NEW TABLES TO RELATIONSHIPS
==============================================================================================*/


-- Fact TABLE Fact_Employees
CREATE TABLE Fact_Employees (
    Employee_ID VARCHAR(50) PRIMARY KEY,
    Gender VARCHAR(50),
    Electricity_Consumption_kWh DECIMAL(10,2),
    Performance DECIMAL(5,2),
    Season VARCHAR(50),
    Total_Cost DECIMAL(10,2)
);


-- DIMENSION TABLE Job_Role
CREATE TABLE Dim_Job_Role (
    Job_Role_ID INT AUTO_INCREMENT PRIMARY KEY,
    Employee_ID VARCHAR(50),
    Job_Role_Name VARCHAR(100) NOT NULL,
    CONSTRAINT FK_Job_Role_Fact FOREIGN KEY (Employee_ID) REFERENCES Fact_Employees(Employee_ID)
);
  
  
-- DIMENSION TABLE Industry
CREATE TABLE Dim_Industry (
    Industry_ID INT AUTO_INCREMENT PRIMARY KEY,
    Employee_ID VARCHAR(50),
    Industry VARCHAR(100) NOT NULL,
    CONSTRAINT FK_Industry_Fact FOREIGN KEY (Employee_ID) REFERENCES Fact_Employees(Employee_ID)
);


-- DIMENSION TABLE Work_Location
CREATE TABLE Dim_Work_Location (
    Work_Location_ID INT AUTO_INCREMENT PRIMARY KEY,
    Employee_ID VARCHAR(50),
    Location_Name VARCHAR(50) NOT NULL,
    CONSTRAINT FK_Work_Location_Fact FOREIGN KEY (Employee_ID) REFERENCES Fact_Employees(Employee_ID)
);


-- DIMENSION TABLE Country
CREATE TABLE Dim_Country (
    Country_ID INT AUTO_INCREMENT PRIMARY KEY,
    Employee_ID VARCHAR(50),
    Country_Name VARCHAR(100) NOT NULL,
    CONSTRAINT FK_Country_Fact FOREIGN KEY (Employee_ID) REFERENCES Fact_Employees(Employee_ID)
);


-- DIMENSION TABLE Mental_Health
CREATE TABLE Dim_Mental_Health (
    Mental_Health_ID INT AUTO_INCREMENT PRIMARY KEY,
    Employee_ID VARCHAR(50),
    Mental_Health_Name VARCHAR(100) NOT NULL,
    CONSTRAINT FK_Mental_Health_Fact FOREIGN KEY (Employee_ID) REFERENCES Fact_Employees(Employee_ID)
);


/*==============================================================================================
INSERTS
==============================================================================================*/

-- insert fact_employees
INSERT INTO Fact_Employees (Employee_ID, Gender, Electricity_Consumption_kWh, Performance, Season, Total_Cost)
SELECT Employee_ID, Gender, Electricity_Consumption_kWh, Performance, Season, Total_Cost
FROM employees_cleaned;


-- insert Dim_Job_Role
INSERT INTO Dim_Job_Role (Employee_ID, Job_Role_Name)
SELECT Employee_ID, Job_Role FROM employees_cleaned;


-- insert Dim_Industry
INSERT INTO Dim_Industry (Employee_ID, Industry)
SELECT Employee_ID, Industry FROM employees_cleaned;


-- insert Dim_Work_Location
INSERT INTO Dim_Work_Location (Employee_ID, Location_Name)
SELECT Employee_ID, Work_Location FROM employees_cleaned;


-- insert Dim_Mental_Health
INSERT INTO Dim_Mental_Health (Employee_ID, Mental_Health_Name)
SELECT Employee_ID, Mental_Health_Condition FROM employees_cleaned;


-- insert Dim_Country
INSERT INTO Dim_Country (Employee_ID, Country_Name)
SELECT Employee_ID, Country FROM employees_cleaned;


-- checks that the total fact rows is 5000
SELECT COUNT(*) AS total_fact_rows FROM Fact_Employees;

                                               Employee analysis report

You are assigned as a data analyst intern by the ‘X’ e-commerce company in order to give your solutions to the problems described below. 
When trying to solve the issues, read the problem statement and think carefully about what is being asked. Now, time to start! 
  
All problems in this task refer to the ‘Employees’ and ‘jobs’ . Please familiarize yourself with the tables and column names in order
to write accurate queries and get the appropriate answers 

1.Before the manager enters pay changes for employees, he/she needs to print the Employee Salary Analysis report to review employees'
 salary histories and proposed salary changes. Supervisors can use this report to verify that the proposed salary changes are correct
 before updating employee records with those changes

There should be the records of employees with minimum salary and maximum salary in the report.

```sql
CREATE TABLE employees1 (
    employee_id INT,
    first_name VARCHAR(50),
    last_name VARCHAR(50),
    email VARCHAR(50),
    phone_number VARCHAR(50),
    hire_date DATE,
    job_id INT,
    salary INT,
    manager_id INT,
    department_id INT
);

CREATE TABLE jobs2 (
    job_id INT,
    job_title VARCHAR(50),
    min_salary INT,
    max_salary INT
);

SELECT
    e.employee_id,
    e.first_name,
    e.last_name,
    MIN(e.salary) AS Min_Salary,
    MAX(e.salary) AS Max_Salary
FROM
    public.employees1 AS e
GROUP BY
    e.employee_id,
    e.first_name,
    e.last_name;

```

| employee_id | first_name | last_name | min_salary | max_salary |
|-------------|------------|-----------|------------|------------|
| 116         | Shelli     | Baida     | 2900       | 2900       |
| 115         | Alexander  | Khoo      | 3100       | 3100       |
| 109         | Daniel     | Faviet    | 9000       | 9000       |
| 202         | Pat        | Fay       | 6000       | 6000       |
| 178         | Kimberely  | Grant     | 7000       | 7000       |
| 104         | Bruce      | Ernst     | 6000       | 6000       |
| 118         | Guy        | Himuro    | 2600       | 2600       |
| 204         | Hermann    | Baer      | 10000      | 10000      |
| 179         | Charles    | Johnson   | 6200       | 6200       |
| 121         | Adam       | Fripp     | 8200       | 8200       |
| 110         | John       | Chen      | 8200       | 8200       |
| 117         | Sigal      | Tobias    | 2800       | 2800       |
| 146         | Karen      | Partners  | 13500      | 13500      |
| 123         | Shanta     | Vollman   | 6500       | 6500       |
| 200         | Jennifer   | Whalen    | 4400       | 4400       |
| 176         | Jonathon   | Taylor    | 8600       | 8600       |
| 206         | William    | Gietz     | 8300       | 8300       |
| 119         | Karen      | Colmenares| 2500       | 2500       |
| 205         | Shelley    | Higgins   | 12000      | 12000      |
| 193         | Britney    | Everett   | 3900       | 3900       |
| 201         | Michael    | Hartstein | 13000      | 13000      |
| 145         | John       | Russell   | 14000      | 14000      |
| 112         | Jose Manuel| Urman     | 7800       | 7800       |
| 177         | Jack       | Livingston| 8400       | 8400       |
| 122         | Payam      | Kaufling  | 7900       | 7900       |
| 108         | Nancy      | Greenberg | 12000      | 12000      |
| 113         | Luis       | Popp      | 6900       | 6900       |
| 126         | Irene      | Mikkilineni| 2700      | 2700       |
| 114         | Den        | Raphaely  | 11000      | 11000      |
| 111         | Ismael     | Sciarra   | 7700       | 7700       |
| 103         | Alexander  | Hunold    | 9000       | 9000       |
| 106         | Valli      | Pataballa | 4800       | 4800       |
| 107         | Diana      | Lorentz   | 4200       | 4200       |
| 100         | Steven     | King      | 24000      | 24000      |
| 105         | David      | Austin    | 4800       | 4800       |
| 203         | Susan      | Mavris    | 6500       | 6500       |
| 192         | Sarah      | Bell      | 4000       | 4000       |
| 120         | Matthew    | Weiss     | 8000       | 8000       |
| 101         | Neena      | Kochhar   | 17000      | 17000      |
| 102         | Lex        | De Haan   | 17000      | 17000      |


The greatest max salary and smallest min salary in accordance with various job titles should be included in the report.

```sql
SELECT
    j.job_title,
    MIN(j.min_salary) AS Smallest_Min_Salary,
    MAX(j.max_salary) AS Greatest_Max_Salary
FROM
    public.jobs2 AS j
GROUP BY
    j.job_title;

```

| job_title                        | smallest_min_salary | greatest_max_salary |
|----------------------------------|---------------------|---------------------|
| Human Resources Representative  | 4000                | 9000                |
| Marketing Representative        | 4000                | 9000                |
| Marketing Manager               | 9000                | 15000               |
| Shipping Clerk                  | 2500                | 5500                |
| Accounting Manager              | 8200                | 16000               |
| Stock Manager                   | 5500                | 8500                |
| President                       | 20000               | 40000               |
| Administration Assistant        | 3000                | 6000                |
| Programmer                      | 4000                | 10000               |
| Public Accountant               | 4200                | 9000                |
| Stock Clerk                     | 2000                | 5000                |
| Purchasing Manager              | 8000                | 15000               |
| Sales Manager                   | 10000               | 20000               |
| Sales Representative            | 6000                | 12000               |
| Accountant                      | 4200                | 9000                |
| Finance Manager                 | 8200                | 16000               |
| Administration Vice President   | 15000               | 30000               |
| Public Relations Representative | 4500                | 10500               |
| Purchasing Clerk                | 2500                | 5500                |


The average salary per job position should be placed in the salary report.

```sql
SELECT
    j.job_title,
    AVG(e.salary) AS Average_Salary
FROM
    public.employees1 AS e
JOIN
    public.jobs2 AS j
ON
    e.job_id = j.job_id
GROUP BY
    j.job_title;
```

| job_title                        | average_salary |
|----------------------------------|----------------|
| Human Resources Representative  | 6500           |
| Marketing Representative        | 6000           |
| Marketing Manager               | 13000          |
| Shipping Clerk                  | 3950           |
| Accounting Manager              | 12000          |
| Stock Manager                   | 7650           |
| President                       | 24000          |
| Administration Assistant        | 4400           |
| Programmer                      | 5760           |
| Public Accountant               | 8300           |
| Stock Clerk                     | 2700           |
| Purchasing Manager              | 11000          |
| Sales Manager                   | 13750          |
| Sales Representative            | 7550           |
| Accountant                      | 7920           |
| Finance Manager                 | 12000          |
| Administration Vice President   | 17000          |
| Public Relations Representative | 10000          |
| Purchasing Clerk                | 2780           |

An employee years of service award program not only motivates employees to remain loyal to their company, but also reflects positively on the company for 
retaining them. An employee might receive his or her first service award after 25 years—sometimes even 20 years.
```sql
SELECT * FROM public.employees1;
-- Add a new column named Years_of_Service to the employees1 table
ALTER TABLE public.employees1
ADD COLUMN Years_of_Service INT;

-- Update the Years_of_Service column with the calculated years of service
UPDATE public.employees1
SET Years_of_Service = EXTRACT('YEAR' FROM CURRENT_DATE) - EXTRACT('YEAR' FROM hire_date);

-- Retrieve the first name, last name, and years of service for employees with 20 or more years of service
SELECT first_name, last_name, Years_of_Service
FROM public.employees1
WHERE Years_of_Service >= 20;
```
| first_name   | last_name   | years_of_service |
|--------------|-------------|------------------|
| Steven       | King        | 37               |
| Neena        | Kochhar     | 35               |
| Lex          | De Haan     | 31               |
| Alexander    | Hunold      | 34               |
| Bruce        | Ernst       | 33               |
| David        | Austin      | 27               |
| Valli        | Pataballa   | 26               |
| Diana        | Lorentz     | 25               |
| Nancy        | Greenberg   | 30               |
| Daniel       | Faviet      | 30               |
| John         | Chen        | 27               |
| Ismael       | Sciarra     | 27               |
| Jose Manuel  | Urman       | 26               |
| Luis         | Popp        | 25               |
| Den          | Raphaely    | 30               |
| Alexander    | Khoo        | 29               |
| Shelli       | Baida       | 27               |
| Sigal        | Tobias      | 27               |
| Guy          | Himuro      | 26               |
| Karen        | Colmenares  | 25               |
| Matthew      | Weiss       | 28               |
| Adam         | Fripp       | 27               |
| Payam        | Kaufling    | 29               |
| Shanta       | Vollman     | 27               |
| Irene        | Mikkilineni | 26               |
| John         | Russell     | 28               |
| Karen        | Partners    | 27               |
| Jonathon     | Taylor      | 26               |
| Jack         | Livingston  | 26               |
| Kimberely    | Grant       | 25               |
| Charles      | Johnson     | 24               |
| Sarah        | Bell        | 28               |
| Britney      | Everett     | 27               |
| Jennifer     | Whalen      | 37               |
| Michael      | Hartstein   | 28               |
| Pat          | Fay         | 27               |
| Susan        | Mavris      | 30               |
| Hermann      | Baer        | 30               |
| Shelley      | Higgins     | 30               |
| William      | Gietz       | 30               |

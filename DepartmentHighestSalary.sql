#Solution 1
SELECT t2.Department, e.name AS Employee, e.salary AS Salary
FROM Employee e
JOIN (SELECT departmentId AS depId, d.name AS Department, MAX(salary) AS maxSal
    FROM Employee e
    JOIN(SELECT id, name
         FROM Department) AS d
    ON e.departmentId = d.id
    GROUP BY departmentId) AS t2
ON e.departmentId = t2.depId
WHERE e.salary = t2.maxSal;

#Solution 2
SELECT Department.name AS Department, Employee.name AS Employee, Employee.salary AS Salary
FROM Employee
JOIN Department
ON Employee.departmentId = Department.id
WHERE (departmentId, salary) IN (
    SELECT departmentId, MAX(salary) AS maxSal
    FROM Employee e
    GROUP BY departmentId);

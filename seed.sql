USE employee_managerDB;

INSERT INTO department(name)
VALUES ("Sales"),("IT"),("Finance"),("Legal"),("Communication");

SELECT * FROM department;

INSERT INTO role(title,salary,department_id)
VALUES 
("Sales Coordinator",40000.00,1),
("Sales Lead",65000.00,1),
("Sales Manager",80000.00,1),
("Helpdesk Agent",40000.00,2),
("Senior Engineer",85000.00,2),
("Lead Engineer",110000.00,2),
("Accounts Coordinator",55000.00,3),
("Accounts Manager",80000.00,3),
("Associate Counsel",80000.00,4),
("Lead Counsel",180000.00,4),
("Human Resource Specialist",50000.00,5),
("Media Planner",90000.00,5);

SELECT * FROM role;

SELECT 
	department.id,
	department.name,
    role.id ,
    role.title,
    role.salary
FROM department 
	INNER JOIN role on role.department_id = department.id
ORDER BY department.id, role.salary ASC;

INSERT INTO employee(first_name, last_name,role_id)
VALUES
("John","Wick",1),
("Charlie","Kelly",2),
("Homer","Simpson",3),
("Dwight","Schrute",4),
("Sandy","Cheeks",4),
("Nikola","Tesla",5),
("Anne","Hathaway",6),
("Hard","Blastcheese",7),
("Tex","Avery",8),
("JoAnn","Fabric",8),
("Holly", "Golightly",9);

SELECT * FROM employee;

UPDATE employee SET manager_id = 2 WHERE id = 1;
UPDATE employee SET manager_id = 3 WHERE id = 2;
UPDATE employee SET manager_id = 7 WHERE id = 4;
UPDATE employee SET manager_id = 7 WHERE id = 5;
UPDATE employee SET manager_id = 7 WHERE id = 6;
UPDATE employee SET manager_id = 11 WHERE id = 8;
UPDATE employee SET manager_id = 11 WHERE id = 9;
UPDATE employee SET manager_id = 11 WHERE id = 10;

SELECT * FROM employee;

SELECT
	employee.first_name,
    employee.last_name,
    department.name,
    role.title    
FROM employee 
	INNER JOIN role on role.id = employee.role_id
    INNER JOIN department on department.id = role.department_id
ORDER BY employee.id;

USE employee_managerDB;

SELECT DISTINCT 
E1.id,
concat(E1.first_name, ' ', E1.last_name) AS Employee,
R1.title AS Job_Title,
D1.name AS Department,
R1.salary,
concat(M1.first_name, ' ', M1.last_name) AS Manager_Name 
FROM employee E1 
JOIN role R1 ON R1.id = E1.role_id 
JOIN department D1 ON R1.department_id = D1.id 
LEFT JOIN employee M1 ON E1.manager_id = M1.id
JOIN employee E2 ON R1.id = E2.role_id ORDER BY id
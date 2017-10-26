USE TableRealtionDemo

--DROP TABLE EmployeesProjects

--DROP TABLE Projects

--DROP TABLE Employees

CREATE TABLE Employees (
Id INT PRIMARY KEY IDENTITY,
Name VARCHAR(50) NOT NULL
)

CREATE TABLE Projects (
Id INT PRIMARY KEY IDENTITY,
Name VARCHAR(50) NOT NULL
)

CREATE TABLE EmployeesProjects(
EmployeeId INT,
ProjectId INT,

CONSTRAINT PK_EmployeesProjects
PRIMARY KEY (EmployeeId, ProjectId),

CONSTRAINT FK_EmployeesProjects_Employees
FOREIGN KEY (EmployeeId)
REFERENCES Employees(Id) ON DELETE CASCADE,

CONSTRAINT FK_EmployeesProjects_Projects
FOREIGN KEY (ProjectId)
REFERENCES Projects(Id)
)

--SELECT * FROM INFORMATION_SCHEMA.TABLES 

INSERT INTO Employees(Name) VALUES
('Bay Ivan'),
('Gosho Nashlyokavica'),
('Ivan Ivanov')

INSERT INTO Projects (Name) VALUES
('MySQL Project'),
('Super Java Project'),
('Microsoft Hell')

INSERT INTO EmployeesProjects (EmployeeId, ProjectId) VALUES
(1, 2),
(1, 1),
(3, 3),
(2, 1)

SELECT * FROM EmployeesProjects

DELETE FROM Employees
WHERE Id = 1



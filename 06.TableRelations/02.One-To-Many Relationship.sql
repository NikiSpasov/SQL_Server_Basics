CREATE TABLE Models(
ModelID INT PRIMARY KEY IDENTITY(101, 1),
Name VARCHAR(50) NOT NULL,
ManufacturerID INT NOT NULL
)

CREATE TABLE Manufacturers (
ManufacturerID INT PRIMARY KEY IDENTITY,
Name VARCHAR(50) NOT NULL,
EstablishedOn DATE
)

INSERT INTO Models(Name, ManufacturerID)
VALUES
('X1', 1),
('i6', 1),
('Model S', 2),
('Model X', 2),
('Model 3', 2),
('Nova', 3)

INSERT INTO Manufacturers(Name, EstablishedOn)
VALUES
('BMW', '07/03/1916'),
('Tesla', '01/01/2003'),
('Lada', '01/05/1966')

ALTER TABLE Models
ADD 
CONSTRAINT FK_Models_Manufacturers
FOREIGN KEY (ManufacturerID)
REFERENCES Manufacturers(ManufacturerID)
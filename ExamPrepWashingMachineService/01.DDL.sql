CREATE TABLE Clients(
ClientId INT IDENTITY NOT NULL,
FirstName VARCHAR(50) NOT NULL,
LastName VARCHAR(50) NOT NULL,
Phone CHAR(12) NOT NULL,
CONSTRAINT PK_ClientId
PRIMARY KEY (ClientId)
)

CREATE TABLE Mechanics(
MechanicId INT IDENTITY NOT NULL,
FirstName VARCHAR(50) NOT NULL,
LastName VARCHAR(50) NOT NULL,
Address VARCHAR(50) NOT NULL,
CONSTRAINT PK_MechanicId
PRIMARY KEY (MechanicId)
)

CREATE TABLE Models(
ModelId INT IDENTITY,
Name VARCHAR(50) UNIQUE,

CONSTRAINT PK_ModelId
PRIMARY KEY(ModelId)
)

CREATE TABLE Jobs(
JobId INT IDENTITY NOT NULL,
ModelId INT NOT NULL,
Status VARCHAR(11) 
CHECK 
(Status = 'In Progress' 
OR Status = 'Finished' 
OR STATUS = 'Pending') NOT NULL DEFAULT 'Pending',
ClientId INT NOT NULL,
MechanicId INT,
IssueDate DATE NOT NULL,
FinishDate DATE

CONSTRAINT PK_JobId
PRIMARY KEY (JobId),

CONSTRAINT FK_Jobs_Models
FOREIGN KEY (ModelId)
REFERENCES Models(ModelId),

CONSTRAINT FK_Jobs_Clients
FOREIGN KEY (ClientId)
REFERENCES Clients(ClientId),

CONSTRAINT FK_Jobs_Mechanics
FOREIGN KEY (MechanicId)
REFERENCES Mechanics(MechanicId)
)

CREATE TABLE Orders(
OrderId INT IDENTITY NOT NULL,
JobId INT NOT NULL,
IssueDate DATE,
Delivered BIT DEFAULT 0, --check!

CONSTRAINT PK_OrderId
PRIMARY KEY (OrderId),

CONSTRAINT FK_Orders_Jobs
FOREIGN KEY (JobId)
REFERENCES Jobs(JobId)
)

CREATE TABLE Vendors (
VendorId INT IDENTITY,
Name VARCHAR (50) UNIQUE NOT NULL,

CONSTRAINT PK_VendorId
PRIMARY KEY (VendorId)
)

CREATE TABLE Parts(
PartId INT IDENTITY NOT NULL,
SerialNumber VARCHAR(50) UNIQUE,
Description VARCHAR (255),
Price MONEY 
CHECK (Price <= 9999.99 AND Price > 0),
VendorId INT NOT NULL,
StockQty INT NOT NULL DEFAULT 0 
CHECK (StockQty >= 0)

CONSTRAINT FK_Parts_Vendors
FOREIGN KEY (VendorId)
REFERENCES Vendors(VendorId)

CONSTRAINT PK_PartId
PRIMARY KEY (PartId),
)

CREATE TABLE OrderParts(
OrderId INT,
PartId INT,
Quantity INT DEFAULT 1,
CHECK (Quantity > 0), 

CONSTRAINT PK_OrderParts 
PRIMARY KEY (OrderId, PartId),

CONSTRAINT FK_OrderParts_Orders
FOREIGN KEY (OrderId)
REFERENCES Orders(OrderId),

CONSTRAINT FK_OrderParts_Parts
FOREIGN KEY (PartId)
REFERENCES Parts(PartId)
)

CREATE TABLE PartsNeeded 
(
JobId INT,
PartId	INT,
Quantity INT DEFAULT 1
CHECK (Quantity > 0),

CONSTRAINT PK_JobId_PartId 
PRIMARY KEY	(JobId, PartId),

CONSTRAINT FK_PartsNeeded_Jobs
FOREIGN KEY (JobId)
REFERENCES Jobs(JobId),

CONSTRAINT FK_PartsNeeded_Parts
FOREIGN KEY (PartId)
REFERENCES Parts(PartId)
)

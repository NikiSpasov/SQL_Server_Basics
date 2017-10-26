/****** Script for SelectTopNRows command from SSMS  ******/
SELECT TOP (1000) [Id]
      ,[Description]
      ,[Rate]
      ,[ProductId]
      ,[CustomerId]
  FROM [Bakery].[dbo].[Feedbacks]

  GO

  SELECT ProductId, COUNT(CustomerId) AS [cnt]
    FROM Feedbacks
   GROUP BY ProductId
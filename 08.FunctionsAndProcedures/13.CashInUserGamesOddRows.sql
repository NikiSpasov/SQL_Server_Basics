USE Diablo
GO


CREATE FUNCTION ufn_CashInUsersGames (@gameName nvarchar(50))
RETURNS table
AS
RETURN (

  WITH CTE_CashInRows (Cash, RowNumber) AS (
    SELECT ug.Cash, ROW_NUMBER() OVER (ORDER BY ug.Cash DESC)
    FROM UsersGames AS ug
    JOIN Games AS g ON ug.GameId = g.Id
    WHERE g.Name = @gameName
  )
  SELECT SUM(Cash) AS SumCash
  FROM CTE_CashInRows
  WHERE RowNumber % 2 = 1 -- odd row numbers only
)
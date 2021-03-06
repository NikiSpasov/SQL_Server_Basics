SELECT ISNULL(SUM (p.Price * op.Quantity), 0) AS [Parts total] 
  FROM Parts as p
       JOIN OrderParts as op ON op.PartId = p.PartId
	   JOIN Orders as o ON o.OrderId = op.OrderId
WHERE  DATEDIFF(WEEK, o.IssueDate, '04/24/2017') <= 3 

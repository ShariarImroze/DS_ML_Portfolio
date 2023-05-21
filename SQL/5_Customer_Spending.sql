SELECT cus.customer_name, ROUND(SUM(inv.total_price), 6)
FROM customer cus
INNER JOIN invoice inv ON cus.id=inv.customer_id
GROUP BY cus.customer_name
HAVING SUM(inv.total_price)<0.25*(SELECT AVG(total_price) FROM invoice)
ORDER BY ROUND(SUM(inv.total_price), 6) DESC
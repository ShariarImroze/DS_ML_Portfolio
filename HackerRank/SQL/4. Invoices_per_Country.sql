SELECT co.country_name, count(*), avg(i.total_price)
FROM country co, city ci, customer cu, invoice i
WHERE co.id = ci.country_id and ci.id = cu.city_id and cu.id =i.customer_id
GROUP BY co.country_name
HAVING avg(i.total_price) > (SELECT avg(total_price) FROM invoice);
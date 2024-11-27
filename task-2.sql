SELECT 
    f.title AS film_title, 
    f.length AS film_duration, 
    c.name AS category_name
FROM 
    film AS f
JOIN 
    film_category AS fc ON f.film_id = fc.film_id
JOIN 
    category AS c ON fc.category_id = c.category_id;
SELECT 
    f.title AS film_title, 
    r.rental_date
FROM 
    rental AS r
JOIN 
    inventory AS i ON r.inventory_id = i.inventory_id
JOIN 
    film AS f ON i.film_id = f.film_id
WHERE 
    r.customer_id = 1;
SELECT 
    f.title AS film_title, 
    COUNT(r.rental_id) AS rental_count
FROM 
    rental AS r
JOIN 
    inventory AS i ON r.inventory_id = i.inventory_id
JOIN 
    film AS f ON i.film_id = f.film_id
GROUP BY 
    f.title
ORDER BY 
    rental_count DESC
LIMIT 5;
INSERT INTO customer (first_name, last_name, address_id, store_id, active, create_date)
VALUES ('Alice', 'Cooper', 1, 1, 1, NOW());
UPDATE customer
SET address_id = (
    SELECT address_id 
    FROM address 
    WHERE address = '456 Elm St'
)
WHERE first_name = 'Alice' AND last_name = 'Cooper';
DELETE FROM customer
WHERE first_name = 'Alice' AND last_name = 'Cooper';

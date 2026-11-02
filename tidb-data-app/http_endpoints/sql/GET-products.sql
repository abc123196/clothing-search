/* Getting Started:
Enter "USE {database};" before entering your SQL statements.
Declare a parameter like "Where id = ${arg}".
*/
SELECT "Hello World";
SELECT c.product_id, c.product_name, ca.category_name, b.brand_name, b.country,
       c.color, c.size, c.price, c.stock_qty, c.listed_date, c.image_url, i.match_level
FROM clothing_store.clothing c
JOIN clothing_store.categories ca ON ca.category_id = c.category_id
JOIN clothing_store.brands b ON b.brand_id = c.brand_id
LEFT JOIN clothing_store.product_images i ON i.product_id = c.product_id AND i.image_type = 'main'
ORDER BY c.product_id;
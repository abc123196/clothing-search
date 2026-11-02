USE clothing_store;
SELECT COUNT(*) AS 商品數, SUM(image_url IS NOT NULL) AS 有圖片 FROM clothing;
SELECT ca.category_name, COUNT(*) AS 款數, SUM(i.match_level='exact') AS exact, SUM(i.match_level='close') AS close_, SUM(i.match_level='sample') AS sample_
FROM clothing c JOIN categories ca USING(category_id) JOIN product_images i ON i.product_id=c.product_id GROUP BY ca.category_name;
SELECT image_url, COUNT(*) FROM clothing GROUP BY image_url HAVING COUNT(*)>1;

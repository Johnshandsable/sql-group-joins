## Tasks
1. Get all customers and their addresses.
SELECT *
FROM "customers" 
JOIN "addresses" ON "customers".id = "addresses".customer_id; 

2. Get all orders and their line items (orders, quantity and product).
--SELECT "quantity", "description",  
--FROM "customers" 
--JOIN "addresses" ON "customers".id = "addresses".customer_id 
--JOIN "orders" ON "addresses".customer_id = "orders".address_id 
--JOIN "line_items" ON "orders".address_id = "line_items".order_id
--JOIN "products" ON "line_items".product_id = "products".id;

SELECT *
FROM "orders"  
JOIN "line_items" ON "orders".address_id = "line_items".order_id
JOIN "products" ON "line_items".product_id = "products".id;

3. Which warehouses have cheetos?
SELECT "warehouse" 
FROM "products"
JOIN "warehouse_product" ON "products".id = "warehouse_product".product_id
JOIN "warehouse" ON "warehouse".id = "warehouse_product".warehouse_id 
WHERE "products".description = 'cheetos';

4. Which warehouses have diet pepsi?
SELECT "warehouse" 
FROM "products"
JOIN "warehouse_product" ON "products".id = "warehouse_product".product_id
JOIN "warehouse" ON "warehouse".id = "warehouse_product".warehouse_id 
WHERE "products".description = 'diet pepsi';

5. Get the number of orders for each customer. NOTE: It is OK if those without orders are not included in results.

6. How many customers do we have?
SELECT COUNT(id) 
FROM "customers";

7. How many products do we carry?
SELECT COUNT(id) 
FROM "products";

8. What is the total available on-hand quantity of diet pepsi? -- Across all warehouses?
SELECT SUM("on_hand")
FROM "orders" 
JOIN "line_items" ON "orders".id = "line_items".order_id
JOIN "products" ON "line_items".product_id = "products".id
JOIN "warehouse_product" ON "products".id = "warehouse_product".product_id 
WHERE "description" = 'diet pepsi';

## Stretch
9. How much was the total cost for each order?
10. How much has each customer spent in total?
11. How much has each customer spent in total? Customers who have spent $0 should still show up in the table. It should say 0, not NULL (research coalesce).
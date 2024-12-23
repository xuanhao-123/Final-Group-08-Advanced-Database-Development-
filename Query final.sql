1. Write a query to a customer who can update or remove products from their shopping cart.
Update Quantity:
    UPDATE Cart_Item
    SET quantity = 20
    WHERE cart_id = 10 AND product_id = 10;  
Remove Item:
    DELETE FROM Cart  
    WHERE cart_id = 5 AND user_id = 13; 
2. Write a query to create detailed invoices for each order.
    SELECT o.order_id, u.user_name, p.product_name, oi.quantity, p.unit_price, (oi.quantity * p.unit_price) AS total_price, o.order_date  
    FROM `Order` o  
    JOIN Order_Item oi ON o.order_id = oi.order_id  
    JOIN Product p ON oi.product_id = p.product_id  
    JOIN User u ON o.user_id = u.user_id  
    ORDER BY o.order_id;  
3. Write a query so that Customers can view order history.
    SELECT order_id, order_date, total_amount, order_status
    FROM `order`
    WHERE user_id = 11 
    ORDER BY order_date DESC;
4. Query average rating and number of reviews of category_id = 1.
    SELECT product_id, product_name, average_rating, total_reviews
    FROM  product
    WHERE
    category_id = 1
5. Write a query so that Customers can see their search history.
    SELECT query, filters, created_at  
    FROM Search_log  
    WHERE user_id = 29  
    ORDER BY created_at DESC;
6. Write queries so that Customers can view notifications about orders, promotions, or system updates.
    SELECT notification_id, message, type, is_read, created_at  
    FROM Notification  
    WHERE user_id = 26  
    ORDER BY created_at DESC;
7. Write queries so that Customers can track order updates like shipping or delivery.
    SELECT  o.order_id,  o.order_status,  s.shipping_method,  s.shipping_cost
    FROM 
        `Order` o
    JOIN 
        Shipping s ON o.order_id = s.order_id
    WHERE 
        o.user_id = 11
    ORDER BY 
        o.order_date DESC;
8. Write a query so that customers can view feedback.
    SELECT feedback_id, rating, comment, created_at  
    FROM Feedback  
    WHERE user_id = 20  
    ORDER BY created_at DESC;
9. Write a query to List Products by Rating and Price
    SELECT 
        p.product_name, 
        p.unit_price, 
        p.average_rating
    FROM product p
    GROUP BY p.product_id, p.product_name, p.unit_price
    ORDER BY average_rating DESC, p.unit_price ASC;

10. Write a query to Filter Transactions by Date Range
    SELECT * 
    FROM transaction
    WHERE transaction_date BETWEEN '2024-11-01' AND '2024-11-30'
    ORDER BY transaction_date DESC;
11. Write a query to Top 5 Highest Revenue Products
    SELECT 
        p.product_name AS product_name, 
        SUM(oi.quantity * oi.price) AS total_revenue
    FROM order_item oi
    JOIN product p ON oi.product_id = p.product_id
    GROUP BY p.product_id, p.product_name
    ORDER BY total_revenue DESC
    LIMIT 5;
12. Write a query to Latest Customer Support Tickets
    SELECT * 
    FROM support_ticket
    WHERE status = 'Resolved'
    ORDER BY created_at DESC
    LIMIT 10;
13. Write a query to Find Orders with High-Value Transactions
    SELECT * 
    FROM `order`
    WHERE total_amount > 100
    ORDER BY total_amount DESC;
14. Write a query to Filter Products by Availability and Price Range
    SELECT * 
    FROM product
    WHERE stock > 0 AND unit_price BETWEEN 20 AND 100
    ORDER BY unit_price ASC;
15. Write a query to Search Products with Specific Keywords in Name or Description:
    SELECT * 
    FROM product
    WHERE product_name LIKE '%Smartphone X%' OR description LIKE '%Latest smartphone with 6GB RAM and 128GB storage%'
    ORDER BY average_rating DESC;
16. Write a query to Revenue Per Category
        SELECT 
        c.category_name AS category_name, 
        SUM(oi.price * oi.quantity) AS total_revenue
    FROM product p
    JOIN category c ON p.category_id = c.category_id
    JOIN order_item oi ON p.product_id = oi.product_id
    GROUP BY c.category_name
    ORDER BY total_revenue DESC;
17. Write a query to Customers with the Most Purchases
    SELECT 
        u.user_id AS user_id, 
        u.user_name AS user_name, 
        COUNT(o.order_id) AS total_orders
    FROM user u
    JOIN `order` o ON u.user_id = o.user_id
    GROUP BY u.user_id, u.user_name
    ORDER BY total_orders DESC
    LIMIT 5;
18. Write a query to list Top Customers by Spending.
    SELECT 
        u.user_id AS user_id, 
        u.user_name AS user_name, 
        SUM(o.total_amount) AS total_spent
    FROM user u
    JOIN `order` o ON u.user_id = o.user_id
    GROUP BY u.user_id, u.user_name
    ORDER BY total_spent DESC
    LIMIT 10;
19. Write a query to find products below the Minimum Stock level.
    SELECT * 
    FROM product
    WHERE stock < 40
    ORDER BY stock ASC;
20. Write a query to fetch orders with "Pending" or "Processing" status.
    SELECT * 
    FROM `order`
    WHERE order_status IN ('Pending')
    ORDER BY order_date ASC;

#Food Delivery Analytics
#Customer Analysis

#1.How many customers are registered?
select Count(*) from customers_data;

#2.How many customers are there in each city?
select city_,count(name_) as customer_count from customers_data
group by city_;

#3.Which customer placed the highest number of orders?
select name_,count(order_id) from customers_data c
left join orders_data o
on c.customer_id=o.customer_id
group by name_
order by count(order_id) desc;

#4.Which customer spent the most money?
select name_,round(sum(order_value)) as total_spent from customers_data c
left join orders_data o
on c.customer_id=o.customer_id
group by name_
order by total_spent desc 
limit 1;

#5.What is the average amount spent per customer?
select name_,avg(order_value) from customers_data c
left join orders_data o
on c.customer_id=o.customer_id
group by name_;

#6.Which customers have never placed an order?
SELECT c.customer_id,c.name_,o.order_id FROM customers_data c
LEFT JOIN orders_data o
ON c.customer_id = o.customer_id
WHERE o.order_id IS NULL;

#7.Which customers placed more than 20 orders?
SELECT c.customer_id,c.name_,count(o.order_id) FROM customers_data c
LEFT JOIN orders_data o
ON c.customer_id = o.customer_id
group by c.customer_id,c.name_
having count(o.order_id)>20;

#8.Find the top 10 loyal customers.
SELECT c.customer_id,c.name_,
count(o.order_id) as total_orders,
round(sum(order_value),2) as total_spent FROM customers_data c
LEFT JOIN orders_data o
ON c.customer_id = o.customer_id
group by c.customer_id,c.name_
having count(o.order_id)>=10
order by total_spent desc
limit 10;

#9.Which city has the highest number of active customers?
SELECT c.city_,COUNT(DISTINCT c.customer_id) AS active_customers
FROM customers_data c
left JOIN orders_data o
ON c.customer_id = o.customer_id
GROUP BY c.city_
ORDER BY active_customers DESC;

#10.Which customers have not ordered in the last 30 days?
SELECT c.customer_id, c.name_,max(date(o.order_time)), curdate() AS last_order_date
FROM customers_data c
left JOIN orders_data o
ON c.customer_id = o.customer_id
GROUP BY c.customer_id, c.name_
HAVING MAX(o.order_time) < CURDATE() - INTERVAL 30 DAY;

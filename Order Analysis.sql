#Order Analysis

# 21. How many orders were placed in total?
select count(*) as total_order from orders_data;

# 22. How many orders were completed, cancelled?
select status,count(*) from orders_data
group by status;

# 23. What is the total revenue generated?
select sum(order_value) from orders_data;

# 24. What is the average order value?
select avg(order_value) from orders_data;

# 25. What is the highest-value order?
select max(order_value) from orders_data;

# 26. What is the lowest-value order?
select min(order_value) from orders_data;

# 27. Find daily order counts.
select date(order_time),count(order_id) from orders_data
group by date(order_time);

# 28. Find monthly revenue trends.
select date(order_time),round(sum(order_value),2) from orders_data
group by date(order_time);

# 29. Which day had the highest number of orders?
select dayname(order_time),count(order_id) from orders_data
group by dayname(order_time)
order by count(order_id) desc;

# 30. Which month generated the highest revenue?
select monthname(order_time),round(sum(order_value),2) from orders_data
group by monthname(order_time)
order by round(sum(order_value),2) desc;

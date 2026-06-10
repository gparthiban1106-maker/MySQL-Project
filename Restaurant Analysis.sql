#Restaurant Analysis

# 11. How many restaurants are registered?
select count(*) as total_restaurants from rest_data;

# 12. Which restaurant has the highest rating?
select rest_name,rating from rest_data
order by rating desc
limit 10;

# 13. Which restaurant received the most orders?
select rest_name,count(order_id) as total_order from rest_data r
left join orders_data o
on r.restaurant_id=o.restaurant_id
group by rest_name
order by total_order desc
limit 10;

# 14. Which restaurant generated the highest revenue?
select rest_name,round(sum(order_value),2) as total_order from rest_data r
left join orders_data o
on r.restaurant_id=o.restaurant_id
group by rest_name;

# 15. What is the average order value for each restaurant?
select rest_name,round(avg(order_value),2) from rest_data r
left join orders_data o
on r.restaurant_id=o.restaurant_id
group by rest_name ;

# 16. Find the top 5 restaurants by revenue.
select rest_name,round(sum(order_value),2) as total_order from rest_data r
left join orders_data o
on r.restaurant_id=o.restaurant_id
group by rest_name
order by total_order desc
limit 5;

# 17. Which restaurants have ratings above 4.5?
select * from rest_data
where rating>4.5;

# 18. Which city has the most restaurants?
select city,count(rest_name) from rest_data
group by city;
# 19. Which restaurants have never received an order?
select r.restaurant_id,order_id from rest_data r
left join orders_data o
on r.restaurant_id=o.restaurant_id
where order_id is null;

# 20. Rank restaurants based on revenue.
select r.restaurant_id,rest_name,round(sum(order_value),2),
rank() over(order by sum(order_value) desc) as revenue from rest_data r
left join orders_data o
on r.restaurant_id=o.restaurant_id
group by restaurant_id,rest_name;
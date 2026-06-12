#Delivery Analysis

# 31. What is the average delivery duration?
select avg(delivery_duration) from deliveries_data;

# 32. Which delivery partner completed the most deliveries?
select p.partner_id,name_,count(order_id) from deliveries_data d
left join partners_data p
on d.partner_id=p.partner_id
group by p.partner_id,p.name_
order by count(order_id) desc
limit 5;

# 33. Which delivery partner has the fastest average delivery time?
select p.partner_id,name_,avg(delivery_duration) from deliveries_data d
left join partners_data p
on d.partner_id=p.partner_id
group by p.partner_id,p.name_
order by avg(delivery_duration)  asc
limit 5;

# 34. Which delivery partner has the slowest average delivery time?
select p.partner_id,name_,avg(delivery_duration) from deliveries_data d
left join partners_data p
on d.partner_id=p.partner_id
group by p.partner_id,p.name_
order by avg(delivery_duration)  desc
limit 5;

# 35. How many deliveries were late?
select count(delivery_status) from deliveries_data
where delivery_status="late";
# 36. What percentage of deliveries were late?
select 
round(COUNT(CASE WHEN delivery_status = 'Late' THEN 1 END) * 100.0/ COUNT(*),2) as percentage_of_deliveries 
from deliveries_data;

# 37. Which city has the fastest deliveries?
SELECT c.city_,ROUND(AVG(d.delivery_duration), 2) AS avg_delivery_time FROM customers_data c
JOIN orders_data o
ON c.customer_id = o.customer_id
JOIN deliveries_data d
ON o.order_id = d.order_id
GROUP BY c.city_
ORDER BY avg_delivery_time ASC
LIMIT 1;

# 38. Which orders took more than 60 minutes to deliver?
select * from deliveries_data
where delivery_duration>60;

# 39. Find the top 10 delivery partners based on completed deliveries.
select p.partner_id,p.name_,count(*) as total_order from deliveries_data d
left join partners_data p
on d.partner_id=p.partner_id
group by p.partner_id,p.name_
order by count(*) desc
limit 10;



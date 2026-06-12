# 51. Rank customers by total spending using Window Functions.
SELECT c.customer_id,c.name_,ROUND(SUM(o.order_value), 2) AS total_spent,
DENSE_RANK() OVER (ORDER BY SUM(o.order_value) DESC) AS customer_rank
FROM customers_data c
JOIN orders_data o
ON c.customer_id = o.customer_id
GROUP BY c.customer_id, c.name_;

# 52. Find the top 3 restaurants in each city.
WITH restaurant_revenue AS (
    SELECT r.city,r.restaurant_id,r.rest_name,round(SUM(o.order_value),2) AS revenue FROM rest_data r
    left JOIN orders_data o
	ON r.restaurant_id = o.restaurant_id
    group by r.city,r.restaurant_id,r.rest_name
    )

SELECT * FROM (SELECT city, restaurant_id,rest_name,revenue,
 DENSE_RANK() OVER (
	PARTITION BY city
		ORDER BY revenue DESC) AS city_rank
FROM restaurant_revenue
) ranked
WHERE city_rank <= 3;

# 53. Calculate cumulative monthly revenue.
# 54. Find month-over-month revenue growth.
# 55. Find repeat customers using CTEs.
# 56. Find customers who ordered on consecutive days.
# 57. Find the revenue contribution percentage of each restaurant.
# 58. Identify the busiest hour of the day.
# 59. Find delivery partners whose performance is above average.
# 60. Create a customer segmentation report (High, Medium, Low spenders).
WITH restaurant_revenue AS (     SELECT r.city_,r.restaurant_id,r.rest_name,SUM(o.order_value) AS revenue FROM restaurants_data r     JOIN orders_data o  ON r.restaurant_id = o.restaurant_id     GROUP BY r.city, r.restaurant_id, r.rest_name )   # 53. Calculate cumulative monthly revenue. # 54. Find month-over-month revenue growth. # 55. Find repeat customers using CTEs. # 56. Find customers who ordered on consecutive days. # 57. Find the revenue contribution percentage of each restaurant. # 58. Identify the busiest hour of the day. # 59. Find delivery partners whose performance is above average. # 60. Create a customer segmentation report (High, Medium, Low spenders).

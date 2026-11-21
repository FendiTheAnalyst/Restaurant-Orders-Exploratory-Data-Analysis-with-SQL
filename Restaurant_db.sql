use resturant;

-- How many total orders were placed? --
select count(distinct order_id) as total_orders
from order_items
;
## Answer: 5,000 orders were placed ##

-- Which cities have the most customers? --
select city, count(customer_id) as customer_total
from customers_medium
group by city
order by customer_total desc
;
## Answer: Bristol has the most customers, Leeds comes second while Liverpool comes third ##

-- Which cuisine types are most common? --
select cuisine, count(restaurant_id) as most_common
from restaurants
group by cuisine
order by most_common desc
;
## Answer: Thai is the most common cuisine type, Indian comes next ##

-- What are the top restaurants by rating? --
select restaurant_id, rating
from restaurants
order by rating desc
limit 3
;
## Answer: R115, R020, R030 are the top restaurants by rating ##

-- What is the average delivery time? --
select round(avg(timestampdiff(minute, order_time, delivery_time)), 2) as avg_delivery_time
from orders_medium
;
## Answer: The average delivery time is 54.62 ##

-- Which restaurants generate the most revenue? --
select restaurants.restaurant_id,
round(sum(quantity * order_items.price), 0) as revenue
from order_items
join menu_items
	on order_items.item_id = menu_items.item_id
join restaurants
	on menu_items.restaurant_id = restaurants.restaurant_id
group by restaurants.restaurant_id
order by revenue desc
limit 5
;
## Answer: R046 generates the most revenue, having 14,458 in total revenue ##

-- What are the most ordered menu items? --
select item_id,
sum(quantity) as total_order
from order_items
group by item_id
order by total_order desc
limit 5;
## Answer The most ordered menu items is M0245 with 102nunits,followed by M0200 (100), M0108 (98), M0059 (94) and M0155 (93) ##

-- Which cities generate the highest revenue? --
select city,
round(sum(quantity * price), 0) as revenue
from order_items
join orders_medium
	on order_items.order_id = orders_medium.order_id
join restaurants
	on orders_medium.restaurant_id = restaurants.restaurant_id
group by city
order by revenue desc
;
## Answer: Leeds and Liverpool are the cities wih the highest revenue ##

-- What is the average order value per restaurant? --
with order_value as (
select orders_medium.restaurant_id, order_items.order_id,
sum(quantity * price) as order_total
from order_items
join orders_medium
	on order_items.order_id = orders_medium.order_id
join restaurants
	on orders_medium.restaurant_id = restaurants.restaurant_id
group by orders_medium.restaurant_id, order_items.order_id
)
select restaurant_id,
round(avg(order_total), 2) as avg_order_total
from order_value
group by restaurant_id
;

-- Which customers order most frequently? --
select customer_id, count(order_id) as order_frequency
from orders_medium
group by customer_id
order by order_frequency desc 
limit 3
;
## Answer: C1065, C0860, C0801 ordered most frequently ##

-- Which cuisine type generates the most revenue? --
select cuisine,
round(sum(quantity * price), 0) as revenue
from order_items
join orders_medium
	on order_items.order_id = orders_medium.order_id
join restaurants
	on orders_medium.restaurant_id = restaurants.restaurant_id
group by cuisine
order by revenue desc
;
## Answer: Thai generates the most revenue, having 127,429 in total revenue ##

-- Which restaurant receives the most orders? --
select restaurants.restaurant_id,
count(order_id) as order_amount
from restaurants
join orders_medium
	on restaurants.restaurant_id = orders_medium.restaurant_id
group by restaurant_id
order by order_amount desc
limit 5
;
## Answer: R021 received the most orders ##

-- What is the average spending per customer? --
with customer_cte as (
select customer_id,
sum(quantity * price) as spending
from order_items
join orders_medium
	on order_items.order_id = orders_medium.order_id
group by customer_id
)
select
round(avg(spending), 2) as avg_spending
from customer_cte
;
##  Answer: 386.03 is the average spending per customer ##
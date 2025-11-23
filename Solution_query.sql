-- 1. Retrieve the total number of orders placed.
select count(order_id) as order_id
from orders ;

-- 2. Calculate the total revenue generated from pizza sales.
select round(sum(od.quantity * p.price)) as Reveue
from order_details od
join pizzas p
on od.pizza_id = p.pizza_id;

-- 3. Identify the highest-priced pizza.
select p.price, pt.name
from pizzas p 
join pizza_types pt
on p.pizza_type_id = pt.pizza_type_id
order by price desc
limit 1;

-- 4. Identify the most common pizza size ordered.
select p.size, count(od.order_details_id) as total_order 
from order_details od
join pizzas p
on od.pizza_id = p.pizza_id
group by p.size
order by total_order desc 
limit 1;

-- 5. List the top 5 most ordered pizza types along with their quantities.
select pt.name, sum(od.quantity) as total 
from pizza_types pt
join pizzas p 
on pt.pizza_type_id = p.pizza_type_id
join order_details od
on od.pizza_id = p.pizza_id
group by pt.name
order by total desc
limit 5;

-- 6. Join the necessary tables to find the total quantity of each pizza category ordered.
select sum(od.quantity) as quantity, pt.category 
from pizza_types pt
join pizzas p
on pt.pizza_type_id = p.pizza_type_id
join order_details od
on od.pizza_id = p.pizza_id
group by category;

-- 7. Determine the distribution of orders by hour of the day.
select hour(order_time) as hours, count(order_id) as total_orders
from orders
group by hours;

-- 8. Join relevant tables to find the category-wise distribution of pizzas.
select pt.category, count(p.pizza_id) as total
from pizza_types pt 
join pizzas p 
on pt.pizza_type_id = p.pizza_type_id
group by category;
-- or -->
select category, count(name) from pizza_types
group by category;

-- 9. Group the orders by date and calculate the average number of pizzas ordered per day.


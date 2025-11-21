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


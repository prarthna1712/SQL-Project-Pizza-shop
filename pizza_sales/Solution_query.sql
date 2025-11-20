use pizzavizza;
-- 1. Retrieve the total number of orders placed.
select count(order_id) as order_id
from orders ;

-- 2. Calculate the total revenue generated from pizza sales.
select sum(od.quantity * p.price) as Reveue
from order_details od
join pizzas p
on od.pizza_id = p.pizza_id;

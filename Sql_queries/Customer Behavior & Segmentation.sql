#  Customer Behavior & Segmentation

-- Percentage Of Revenue Is from VIP Customers:

SELECT 
  c.vip_customer_flag,
  COUNT(DISTINCT s.customer_id) AS customer_count,
  ROUND(SUM(s.total_amount), 2) AS revenue
FROM `intro-to-bq-465716.wisdom_pets.sales` s
JOIN `intro-to-bq-465716.wisdom_pets.customers` c 
  ON s.customer_id = c.customer_id
GROUP BY c.vip_customer_flag;

----------------------------------------------------

--the average order value (AOV) for each customer type: 

SELECT 
  c.vip_customer_flag AS customer_type,
  ROUND(SUM(s.total_amount) / COUNT(DISTINCT s.transaction_id), 2) AS avg_order_value
FROM `intro-to-bq-465716.wisdom_pets.sales` s
JOIN `intro-to-bq-465716.wisdom_pets.customers` c 
  ON s.customer_id = c.customer_id
GROUP BY customer_type;

----------------------------------------------------

-- Most Profitable Region

SELECT 
  c.postal_address,
  ROUND(SUM(s.total_amount), 2) AS total_sales
FROM `intro-to-bq-465716.wisdom_pets.sales` s
JOIN `intro-to-bq-465716.wisdom_pets.customers` c 
  ON s.customer_id = c.customer_id
GROUP BY c.postal_address
ORDER BY total_sales DESC;

----------------------------------------------------

-- Repeat Purchase Behavior OF Customer:

SELECT 
  customer_id,
  COUNT(DISTINCT transaction_id) AS total_orders,
  MIN(transaction_date) AS first_purchase,
  MAX(transaction_date) AS last_purchase,
  DATE_DIFF(MAX(transaction_date), MIN(transaction_date), DAY) AS customer_lifetime_days
FROM `intro-to-bq-465716.wisdom_pets.sales`
WHERE customer_id IS NOT NULL
GROUP BY customer_id
ORDER BY total_orders DESC;






















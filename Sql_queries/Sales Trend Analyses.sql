# Sales Trend Analyses

-- Monthly Revenue Trend Over The Past Year:

SELECT 
  FORMAT_DATE('%Y-%m', transaction_date) AS month,
  ROUND(SUM(total_amount),0) AS total_revenue
FROM `wisdom_pets.sales`
GROUP BY month
ORDER BY month;

------------------------------------------------------

-- Peak Sales By Day:

SELECT
  FORMAT_DATE('%A', transaction_date) AS day_name,
  COUNT(transaction_id) AS transaction_count,
  ROUND(SUM(total_amount),0) AS revenue
FROM `wisdom_pets.sales`
GROUP BY day_name
ORDER BY revenue DESC;

------------------------------------------------------

-- Most profitable Region:

SELECT 
  c.postal_address,
  ROUND(SUM(s.total_amount),0) AS total_sales
FROM `wisdom_pets.sales` s
JOIN `wisdom_pets.customers` c ON s.customer_id = c.customer_id
GROUP BY c.postal_address
ORDER BY total_sales DESC;

------------------------------------------------------

-- Transaction Per Month:

SELECT 
  FORMAT_DATE('%Y-%m', transaction_date) AS month,
  COUNT(DISTINCT transaction_id) AS total_transactions
FROM `wisdom_pets.sales`
GROUP BY month
ORDER BY month;

------------------------------------------------------











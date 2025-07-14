-- ✅ Monthly revenue trend over the past year
-- Useful for identifying seasonal patterns and high-performing months
SELECT 
  FORMAT_DATE('%Y-%m', transaction_date) AS month,
  ROUND(SUM(total_amount), 0) AS total_revenue
FROM `wisdom_pets.sales`
GROUP BY month
ORDER BY month;

-- ------------------------------------------------------

-- ✅ Identify peak sales days of the week
-- Reveals which weekdays generate the highest revenue
SELECT
  FORMAT_DATE('%A', transaction_date) AS day_name,
  COUNT(transaction_id) AS transaction_count,
  ROUND(SUM(total_amount), 0) AS revenue
FROM `wisdom_pets.sales`
GROUP BY day_name
ORDER BY revenue DESC;

-- ------------------------------------------------------

-- ✅ Most profitable customer regions (by postal address)
-- Helps optimize marketing and logistics for top-performing regions
SELECT 
  c.postal_address,
  ROUND(SUM(s.total_amount), 0) AS total_sales
FROM `wisdom_pets.sales` s
JOIN `wisdom_pets.customers` c 
  ON s.customer_id = c.customer_id
GROUP BY c.postal_address
ORDER BY total_sales DESC;

-- ------------------------------------------------------

-- ✅ Monthly transaction count
-- Measures engagement volume and demand over time
SELECT 
  FORMAT_DATE('%Y-%m', transaction_date) AS month,
  COUNT(DISTINCT transaction_id) AS total_transactions
FROM `wisdom_pets.sales`
GROUP BY month
ORDER BY month;

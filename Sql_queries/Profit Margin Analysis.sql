-- ✅ Identify products with high discounts but low sales
-- Useful for spotting inefficient discounting strategies
SELECT 
  p.product_name,
  p.wholesale_discount_percentage,
  ROUND(SUM(s.total_amount), 0) AS total_sales
FROM `intro-to-bq-465716.wisdom_pets.sales` s
LEFT JOIN `intro-to-bq-465716.wisdom_pets.products` p 
  ON s.product_id = p.product_id
GROUP BY p.product_name, p.wholesale_discount_percentage
HAVING p.wholesale_discount_percentage > 20
ORDER BY total_sales ASC;

-- ---------------------------------------------------------

-- ✅ Estimate gross margin and profit per product
-- Key for analyzing product-level profitability and unit margins
SELECT 
  p.product_name,
  ROUND(p.retail_price, 2) AS retail_price,
  ROUND(p.wholesale_discount_percentage, 2) AS wholesale_discount_percentage,
  ROUND(p.retail_price * (1 - p.wholesale_discount_percentage / 100.0), 2) AS cost_price,
  ROUND(p.retail_price - (p.retail_price * (1 - p.wholesale_discount_percentage / 100.0)), 2) AS profit_per_unit,
  SUM(s.quantity) AS total_units_sold,
  ROUND(SUM(s.total_amount), 2) AS total_sales,
  ROUND(SUM(s.quantity) * (p.retail_price - (p.retail_price * (1 - p.wholesale_discount_percentage / 100.0))), 2) AS total_profit
FROM `intro-to-bq-465716.wisdom_pets.sales` s
JOIN `intro-to-bq-465716.wisdom_pets.products` p 
  ON s.product_id = p.product_id
GROUP BY p.product_name, p.retail_price, p.wholesale_discount_percentage
ORDER BY total_profit DESC;

-- ---------------------------------------------------------------

-- ✅ Find high-selling products that generate the lowest profits
-- Helps identify misleading revenue contributors
WITH profitability AS (
  SELECT 
    p.product_name,
    SUM(s.quantity) AS qty,
    ROUND(SUM(s.total_amount), 2) AS revenue,
    ROUND(SUM(s.quantity) * (p.retail_price - (p.retail_price * (1 - p.wholesale_discount_percentage / 100.0))), 2) AS total_profit
  FROM `intro-to-bq-465716.wisdom_pets.sales` s
  JOIN `intro-to-bq-465716.wisdom_pets.products` p 
    ON s.product_id = p.product_id
  GROUP BY p.product_name, p.retail_price, p.wholesale_discount_percentage
)

SELECT *
FROM profitability
ORDER BY total_profit ASC
LIMIT 5;

-- ----------------------------------------------------------------

-- ✅ Evaluate performance by discount range (low, medium, high)
-- Helps refine discount strategy to maximize revenue and profit
SELECT 
  CASE 
    WHEN p.wholesale_discount_percentage <= 10 THEN 'Low Discount'
    WHEN p.wholesale_discount_percentage <= 25 THEN 'Medium Discount'
    ELSE 'High Discount'
  END AS discount_range,
  ROUND(SUM(s.total_amount), 2) AS revenue,
  SUM(s.quantity) AS total_units_sold,
  COUNT(DISTINCT s.product_id) AS product_count
FROM `intro-to-bq-465716.wisdom_pets.sales` s
JOIN `intro-to-bq-465716.wisdom_pets.products` p 
  ON s.product_id = p.product_id
GROUP BY discount_range
ORDER BY revenue DESC;

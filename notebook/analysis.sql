-- Users by gender
SELECT gender, COUNT(*) AS total_users
FROM technical.users_data
GROUP BY gender;

-- Monthly transactions 
SELECT 
  DATE_FORMAT(t.date, '%Y-%m') AS month,
  COUNT(*) AS total_transactions,
  SUM(t.amount) AS total_value
FROM technical.transactions_data t
GROUP BY month
ORDER BY month;

-- Hourly transactions
SELECT 
  HOUR(t.date) AS hour_of_day,
  COUNT(*) AS total_transactions
FROM technical.transactions_data t
GROUP BY hour_of_day
ORDER BY hour_of_day;

-- Top 5 user by transaction value
SELECT 
  u.id AS user_id,
  u.current_age,
  SUM(t.amount) AS total_spent
FROM technical.transactions_data t
JOIN technical.users_data u 
  ON t.client_id = u.id
GROUP BY u.id, u.current_age
ORDER BY total_spent DESC
LIMIT 5;

-- Transaction each age group
SELECT 
  CASE 
    WHEN u.current_age BETWEEN 18 AND 25 THEN '18-25'
    WHEN u.current_age BETWEEN 26 AND 35 THEN '26-35'
    WHEN u.current_age BETWEEN 36 AND 50 THEN '36-50'
    ELSE '50+'
  END AS age_group,
  COUNT(DISTINCT u.id) AS total_users,
  AVG(u.yearly_income) AS avg_income,
  AVG(u.num_credit_cards) AS avg_cards
FROM technical.users_data u
GROUP BY age_group
ORDER BY age_group;

-- Credit Score
SELECT
  CASE
    WHEN credit_score < 580 THEN 'Poor'
    WHEN credit_score BETWEEN 580 AND 669 THEN 'Fair'
    WHEN credit_score BETWEEN 670 AND 739 THEN 'Good'
    WHEN credit_score BETWEEN 740 AND 799 THEN 'Very Good'
    ELSE 'Excellent'
  END AS credit_category,
  COUNT(*) AS user_count
FROM technical.users_data
GROUP BY credit_category
ORDER BY user_count DESC;

-- USE CHIP TRANSACTION
SELECT 
  use_chip,
  COUNT(id) AS transaction_total
FROM technical.transactions_data
GROUP BY use_chip;

-- TRANSACTION BY CITY
SELECT 
  merchant_city,
  COUNT(id) AS transaction_total
FROM technical.transactions_data
WHERE merchant_city != 'ONLINE'
GROUP BY merchant_city
ORDER BY transaction_total DESC;

-- User Status
SELECT 
  customer_status,
  COUNT(*) AS total_customers
FROM (
  SELECT 
    client_id,
    CASE 
      WHEN DATEDIFF('2010-10-23', MAX(date)) > 90  
        THEN "Potential Churn"
      ELSE "Active"
    END AS customer_status
  FROM technical.transactions_data
  GROUP BY client_id
) AS t
GROUP BY customer_status;

-- Suspicious Transaction Check
SELECT 
  client_id,
  DATE(date) AS transaction_date,
  COUNT(DISTINCT merchant_city) AS distinct_cities
FROM technical.transactions_data
WHERE merchant_city != 'ONLINE'
GROUP BY client_id, transaction_date
HAVING COUNT(DISTINCT merchant_city) > 1
ORDER BY transaction_date DESC;

-- Transaction per card brand
SELECT 
  c.card_brand,
  COUNT(t.id) AS total_transactions,
  SUM(t.amount) AS total_value
FROM technical.transactions_data t
JOIN technical.cards_data c
  ON t.card_id = c.id
GROUP BY c.card_brand
ORDER BY total_value DESC;

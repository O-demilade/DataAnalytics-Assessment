-- Cowrywise Data Analyst Assessment Question 3
USE adashi_staging;

SELECT
	customer_id,
    name,
    tenure_months,
    total_transactions,
    ROUND(( total_transactions / tenure_months) * 12 * avg_profit_per_trans, 2) 'estimated_CLV'
FROM(
	SELECT
		U.id 'customer_id',
		CONCAT(U.first_name, " ", Upper(U.last_name)) 'name',
		timestampdiff(month, min(S.created_on), curdate()) 'tenure_months',
		COUNT(S.confirmed_amount) 'total_transactions',
        ROUND(AVG((S.confirmed_amount/100)*(0.1/100)), 2) 'avg_profit_per_trans'
	FROM adashi_staging.savings_savingsaccount S
	LEFT JOIN adashi_staging.users_customuser U ON S.owner_id = U.id
	GROUP BY U.id
) AS base_summary
ORDER BY estimated_CLV DESC
;
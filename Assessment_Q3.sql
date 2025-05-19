-- Cowrywise Data Analyst Assessment Question 3
USE adashi_staging;

SELECT
	P.id 'plan_id',
    P.owner_id 'owner_id',
    CASE
		WHEN P.is_regular_savings = 1 THEN 'Savings'
        WHEN P.is_a_fund = 1 THEN 'Investment'
        ELSE 'Error: Check your logic'
	END 'type',
    date(max(S.transaction_date)) 'last_transaction_date',
    datediff(curdate(), max(S.transaction_date)) 'inactivity_days'
FROM adashi_staging.savings_savingsaccount S
LEFT JOIN adashi_staging.plans_plan P ON S.plan_id = P.id
WHERE (P.is_regular_savings = 1 OR P.is_a_fund = 1)
GROUP BY P.id, P.owner_id, P.plan_type_id
HAVING datediff(curdate(), max(S.transaction_date)) > 365
ORDER BY datediff(curdate(), max(S.transaction_date)) DESC;

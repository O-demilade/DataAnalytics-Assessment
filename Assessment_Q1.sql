-- Cowrywise Data Analyst Assessment Question 1
USE adashi_staging;

SELECT 	U.id 'owner_id', 
		CONCAT(U.first_name, " ", Upper(U.last_name)) 'name',
        COUNT(CASE WHEN P.is_regular_savings = 1 THEN 'Savings' ELSE NULL END) 'savings_count',
        COUNT(CASE WHEN P.is_a_fund = 1 THEN 'Investment' ELSE NULL END) 'investment_count', 
		ROUND(SUM(S.confirmed_amount)/100.0, 2) 'total_deposits' -- converted to naira/kobo and rounded to 2 decimal places
FROM adashi_staging.plans_plan P
RIGHT JOIN adashi_staging.savings_savingsaccount S ON P.id = S.plan_id -- add the plan information to every saving entry
LEFT JOIN adashi_staging.users_customuser U ON P.owner_id = U.id -- add the user's biographical data to the combined table in the previous step
GROUP BY U.id
HAVING savings_count > 0 AND investment_count > 0 -- ensure that only customers with 'cross-selling opportunity' are returned
ORDER BY total_deposits DESC
LIMIT 10000;

-- Cowrywise Data Analyst Assessment Question 2
USE adashi_staging;

SELECT 
	CASE 
		WHEN avg_trans_month >= 10 THEN 'High Frequency'
        WHEN avg_trans_month >= 3 THEN 'Medium Frequency'
        WHEN avg_trans_month < 3 THEN 'Low Frequency'
        ELSE 'There is a logical error'
	END 'frequency_category',
    count(avg_trans_month) 'customer_count',
	avg_trans_month 'avg_transactions_per_month'
FROM(
	SELECT -- this is the base table summarizing the average transactions per month for each customer
		U.id 'user',
        max(S.transaction_date) 'l_trans', -- this is the customer's most recent transaction date
        min(S.transaction_date) 'f_trans', -- this is the customer's first ever transaction date
        CASE -- this is the number of months the customer has been transacting, if new customer in their first month, then "1" is assigned
			WHEN timestampdiff(month,min(S.transaction_date),max(S.transaction_date)) = 0 THEN 1
            ELSE timestampdiff(month,min(S.transaction_date),max(S.transaction_date))
		END 'mnth_trans',
        count(S.transaction_date) 'tot_trans', -- this is the total of the customers transactions
		round( -- dividing the customer's total number of transactions by the number of months they have been transacting
			(count(S.transaction_date)/ 
            (CASE 
				WHEN timestampdiff(month,min(S.transaction_date),max(S.transaction_date)) = 0 THEN 1
				ELSE timestampdiff(month,min(S.transaction_date),max(S.transaction_date))
			END)), 1
		) 'avg_trans_month'
	FROM adashi_staging.savings_savingsaccount S
	LEFT JOIN adashi_staging.users_customuser U ON S.owner_id = U.id
	GROUP BY S.owner_id
) AS base_summary
GROUP BY avg_trans_month
ORDER BY avg_trans_month DESC;


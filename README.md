# DataAnalytics-Assessment
My solutions to Cowrywise Data Analyst role SQL assessment

# Pre-Question Explanations
## Question 1:
Step 1: I determined what DB table the different column headers resides in
 - owner_id = users_customuser (id)
 - name = users_customuser (first_name, last_name)
 - savings_count = plans_plan (is_regular_savings)
 - investment_count = plans_plan (is_a_fund)
 - total_deposits = savings_savingsaccount (confirmed_amount)

Step 2: I determined the columns on which joining would occur
 - plans_plan (id) <> savings_savingsaccount  (plan_id)
 - plans_plan (owner_id)<> users_customuser (id)

Step 3: I determined the type of join most suitable
 - I am using right outter joing on the savings table to ensure all deposit are captured and each linked with its appropriate plan detail
 - I left joined the elaborate table with the users table to linking each entry with its corresponding user/owner

Step 4: Comfirmed my summarization function
 - ensured that i could summarize the total deposits on the elaborate table by the first name (it is easier to notice anomaly on this column than on the user_id column

Step 5: Selected the other columns required for the eventual table

Step 6: added the conditional count statements to ensure the resultant table meets the required condition

Step 7: I finetuned the query to align with the expected output. 

## Question 2
Step 1: I determined what DB table the different column headers resides in
 - frequency_category = savings_savingsaccount (transaction_date, id)
 - customer_count = users_customuser (id)
 - avg_transactions_per_month = savings_savingsaccount (transaction_date, id)

Step 2: Clarify the logic
 - to achieve the task I need to\
	[1] determine all transactions linked to each of the individual customers\
	[2] determine all individual customers' monthly averages (total transations/number of months transacting)\
	[3] categorize the averages into high, medium and low and count the entries in each category

Step 3: I determined the columns on which joining would occur
 - savings_savingsaccount (owner_id) <> users_customuser (id)

Step 4: I determined the type of join most suitable
 - I left joined the users_customuser table onto the savings_savingsaccount table

Step 5: Comfirmed my summarization function
 - i ensured i could summarize the elaborate table to get the averages by customer id as all further summary is based off of this

Step 6: I implemented my summarization logic

Step 7: I finetuned the query to align with the expected output

## Question 3
Step 1: I determined what DB table the different column headers resides in
 - plan_id = plans_plan (id)
 - owner_id = plans_plan (owner_id)
 - type = plans_plan (is_regular_savings, is_a_fund)
 - last_transaction_date = savings_savingsaccount (transaction_date)
 - inactivity_days = savings_savingsaccount (transaction_date)

Step 2: I determined the columns on which joining would occur
 - plans_plan (id) <> savings_savingsaccount  (plan_id)

Step 3: I determined the type of join most suitable
 - I am using left join on the savings table to ensure all deposit are captured and each linked with its appropriate plan detail

Step 4: Selected all the columns required for the eventual table

Step 5: Incorporated date columns manipulations

Step 6: added the conditional account type statements to ensure the resultant table meets the required condition

Step 7: I finetuned the query to align with the expected output. 

## Question 4
Step 1: I determined what DB table the different column headers resides in
 - customer_id = users_customuser (id)
 - name = users_customuser (f_name, l_name)
 - tenure_month = savings_savingsaccount (created_on)
 - total_transaction = savings_savingsaccount (confirmed amount)

Step 2: Clarify the logic
 - to achieve the task I need to\
	[1] determine all transactions linked to each of the individual customers\
	[2] determine the first transaction date for all individual customers (the least of all creation dates)\
	[3] summarize each individual customers savings transactions (total entries, sum of all amounts, averages)\
	[4] apply the assumptions and calculate the average profit per transaction for individual customers\
	[5] apply the Formula given to calculate the estimated CLV for each individual customer from the initial summary table

Step 3: I determined the columns on which joining would occur
 - savings_savingsaccount (owner_id) <> users_customuser (id)

Step 4: I determined the type of join most suitable
 - I left joined the users_customuser table onto the savings_savingsaccount table

Step 5: Comfirmed my summarization function
 - i ensured i could summarize the elaborate table to get the averages by customer id as all further summary is based off of this

Step 6: I implemented my summarization logic

Step 7: I finetuned the query to align with the expected output

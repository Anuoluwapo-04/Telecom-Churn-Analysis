-- this is to get the total number of male and female and the percentage distribtion
select
Gender,
count(gender) as totalcount,
count(gender) * 100.0/
(select count( *)
from Customer_Data) as percentage
from Churn.dbo.Customer_Data
group by Gender

-- this is to get the total number of each contract and the percentage distribtion
select
Contract,
count(contract) as totalcount,
count(contract) * 100.0/ 
(select count(*) from Customer_Data) as percentage
from Customer_Data
group by contract

-- to get the total number of customers based on 'churned','stayed' and'joined' 
--from the Customer_status column
-- and the revenue made from each customer_status and the renue percentage
select 
Customer_Status,
count(customer_status) as totalcount,
sum(Total_Revenue) as TotalRevenue,
sum(Total_revenue)/(select sum(Total_revenue) from Customer_Data) * 100.0 as revenuepercentage
from Customer_Data
group by Customer_Status

--- to get state that has the highest number of contribution 
select 
State,
count(state) as totalcount,
count(state) *100.0/(select count(*) state from Customer_Data) as percentage
from Customer_Data
group by State
order by percentage desc

---how many items do we have in a particular column
select count (distinct internet_type)
from Customer_Data

select distinct internet_type
from Customer_Data

---find null values in each column and remove null as per colum values.
select
sum(case when customer_id is null then 1 else 0 end) as customer_id_null_count,
sum(case when Gender is null then 1 else 0 end) as gender_id_null_count,
sum(case when Age is null then 1 else 0 end) as Age_id_null_count,
sum(case when Married is null then 1 else 0 end) as married_id_null_count,
sum(case when State is null then 1 else 0 end) as state_id_null_count,
sum(case when Number_of_Referrals is null then 1 else 0 end) as number_of_referrals_null_count,
sum(case when Tenure_in_Months is null then 1 else 0 end) as Tenure_in_months_null_count,
sum(case when Value_Deal is null then 1 else 0 end) as value_deal_null_count,
sum(case when Phone_Service is null then 1 else 0 end) as phone_service_null_count,
sum(case when Multiple_Lines is null then 1 else 0 end) as multiple_lines_null_count,
sum(case when Internet_Service is null then 1 else 0 end) as internet_service_null_count,
sum(case when Internet_Type is null then 1 else 0 end) as internet_type_null_count,
sum(case when Online_Security is null then 1 else 0 end) as online_security_null_count,
sum(case when Online_Backup is null then 1 else 0 end) as online_backup_null_count,
sum(case when Device_Protection_Plan is null then 1 else 0 end) as device_protection_plan_null_count,
sum(case when Premium_Support is null then 1 else 0 end) as Premium_Support_null_count,
sum(case when Streaming_TV is null then 1 else 0 end) as streaming_TV_null_count,
sum(case when Streaming_Movies is null then 1 else 0 end) as streaming_movies_null_count,
sum(case when streaming_music is null then 1 else 0 end) as streaming_music_null_count,
sum(case when Unlimited_Data is null then 1 else 0 end) as unlimited_data_null_count,
sum(case when Contract is null then 1 else 0 end) as contract_null_count,
sum(case when Paperless_Billing is null then 1 else 0 end) as Paperless_billing_null_count,
sum(case when Payment_Method is null then 1 else 0 end) as Payment_method_null_count,
sum(case when Monthly_Charge is null then 1 else 0 end) as monthly_charge_null_count,
sum(case when Total_Charges is null then 1 else 0 end) as Total_charges_null_count,
sum(case when Total_Refunds is null then 1 else 0 end) as Total_refunds_null_count,
sum(case when Total_Extra_Data_Charges is null then 1 else 0 end) as Total_Extra_Data_Charges_null_count,
sum(case when Total_Long_Distance_Charges is null then 1 else 0 end) as Total_Long_Distance_Charges_null_count,
sum(case when Total_Revenue is null then 1 else 0 end) as Total_revenue_null_count,
sum(case when Customer_Status is null then 1 else 0 end) as customer_status_null_count,
sum(case when Churn_Category is null then 1 else 0 end) as churn_category_null_count,
sum(case when Churn_Reason is null then 1 else 0 end) as churn_reason_null_count
from Customer_Data

-- To create another table named 'Churn_Data' and replacing the null values
SELECT Customer_ID,
      [Gender],
      [Age],
      [Married],
      [State],
      [Number_of_Referrals],
      [Tenure_in_Months],
      isnull([Value_Deal],'None') as Value_Deal,
      [Phone_Service],
      isnull([Multiple_Lines],'No') as Multiple_Lines,
      [Internet_Service],
      isnull([Internet_Type],'None') as Internet_Type,
      isnull([Online_Security],'No') as Online_Security,
      isnull([Online_Backup],'No') as Online_Backup,
      isnull([Device_Protection_Plan],'No') as Device_Protection_Plan,
      isnull([Premium_Support],'No') as premium_support,
      isnull([Streaming_TV],'No') as streaming_TV,
      isnull([Streaming_Movies],'No') as streaming_movies,
      isnull([Streaming_Music],'No') as streaming_music,
      isnull([Unlimited_Data],'No') as Unlimited_data,
      [Contract],
      [Paperless_Billing],
      [Payment_Method],
      [Monthly_Charge],
      [Total_Charges],
      [Total_Refunds],
      [Total_Extra_Data_Charges],
      [Total_Long_Distance_Charges],
      [Total_Revenue],
      [Customer_Status],
      isnull([Churn_Category],'Others') as Churn_Category,
      isnull([Churn_Reason],'Others') as Churn_Reason

	into churn.dbo.churn_Data
  FROM [Churn].[dbo].[Customer_Data]

  --- Create a view for churned customers and stayed customers
  create view vw_churnData
 as 
 select *
 from churn_Data
 where Customer_Status in ('Churned','Stayed')

 -- Create a view for joined customers
 
 create view vw_JoinedData
  as 
 select *
 from churn_data
 where Customer_Status = 'Joined'

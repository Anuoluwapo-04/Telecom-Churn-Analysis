# Customer Churn Analysis
![image](https://github.com/user-attachments/assets/ddd11f90-b2a2-47de-a1b0-507ba0dd2550)

### Project Overview.

This data analysis project aims to uncover insights into customer churn rates at a telecom company. By examining different aspects of customer data, I aim to identify trends, provide data-driven recommendations, and gain a deeper understanding of the factors contributing to customer churn.

### Table of Content
- [Project goal](#project-goal)
- [Data Source](#data-source)
- [Tools](#tools)
- [ETL Process on SQL Server](#etl-process-on-sql-server)
- [Data Visualization](#data-visualization)
- [Results](#results)
- [Recommendations](#recommendations)

### Project Goal.
Develop a complete ETL process in a database and a Power BI dashboard to leverage customer data and achieve the following goals.
1. Analyze customer data at the below levels- Gender, age group, payment and account info, services and so on.
2. Metrics required - Total Customers, Total churn, Churn rate, New joiners.
 
### Data Source.

Customer Data: The primary dataset used for this analysis is the "Customer_Data.csv" file, with 6,418 rows and 32 columns of customers details.

### Tools
- SQL Server - Data Cleaning and analysis
- Power BI - Creating reports

### ETL Process on SQL Server
ETL Frame work

The frame work uses the below components:
1. SQL Server Database - this is where I created my database to  host the entire data- tables.
```sql
CREATE DATABASE Churn
```
2. Loaded the data from the source file (CSV file) to SQL SERVER- I used the inbuilt import wizard to transform and load the data and created a table (i.e Customer_Data).

Some of the T-SQL written to derived results include
```sql
---find the number of null values in each column
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

```

After finding the null values and replacing them, A new table(Churn_Data) was created which was then loaded into Power BI for reporting.
Other columns were derived using the Power Query Editor to ease the analysis.

### Data Visualization
Here are some of the DAX formulas used to calculate the KPIs:
- Total Customers = COUNT(Churn_Data[Customer_ID])
- New Joiners = CALCULATE([Total Customers],Churn_Data[Customer_Status]="joined")
- Total Churn = CALCULATE([Total Customers],Churn_Data[Customer_Status] ="churned")
- Churn Rate = DIVIDE([Total Churn],[Total Customers])

![image](https://github.com/user-attachments/assets/7dafe1da-de77-4062-9850-1495b520f737)

### Results
The analysis results were summarized as follows:
- High Churn Rate: 27% of customers were leaving.
- Demographics: Females and customers aged 36-50 were churning more.
- Internet Type: Fiber Optic users had the highest churn.
- Contract Type: Month-to-month contracts saw the most churn.
- Payment Method: Mailed check users were leaving at higher rates.
- Competition: This was the leading cause of churn, with 761 customers lost.

### Recommendations
- Focus on High-Risk Groups: Retain older customers, females, and Fiber Optic users.
- Revise Contract Strategies: Incentivize shifts from month-to-month to longer contracts.
- Enhance Payment Methods: Promote more convenient options to reduce churn from mailed checks.
- Bundle Services: Encourage adoption of additional services.
- Address Competition: Adjust pricing and enhance offerings to stay competitive.
- Improve Onboarding: Engage new and long-term customers with tailored programs.














# create databse for market research

CREATE DATABASE market_research;

# join tables ecompctsa(e-com % of total sales) and ecomsa(e-com total sales revenue)
# ecomsa = e-commerce revenue in millions USD
# dates for tables ecompctsa and ecomsa operate in quarters (1,4,7,10) = (1st,2nd,3rd,4th)
# dates for tables imported as text instead of date

# e-com total revenue, to show growth over every quarter since 2010 to current

SELECT DATE, ECOMPCTSA, ECOMSA
FROM market_research.ecompctsa
JOIN market_research.ecomsa
USING (DATE)
WHERE DATE LIKE '%201%' 
OR DATE LIKE '%202%'
ORDER BY ECOMSA, DATE;

# highest e-com % of total retail sales

SELECT DATE, ECOMPCTSA
FROM market_research.ecompctsa
ORDER BY ECOMPCTSA DESC;

# e-com revenue ascending order since 2020 to show revenue growth despite the drop in % of total retail sales

SELECT DATE, ECOMPCTSA, (ECOMSA * 1000000) AS revenue
FROM market_research.ecompctsa
JOIN market_research.ecomsa
USING (DATE)
HAVING DATE LIKE '%202%'
ORDER BY revenue ASC;

# how much revenue was generated in the year 2023

SELECT SUM(ECOMSA * 1000000) AS revenue
FROM market_research.ecomsa
WHERE DATE LIKE '%2023';

# how much revenue has been generated so far in the year 2024

SELECT SUM(ECOMSA * 1000000) AS revenue
FROM market_research.ecomsa
WHERE DATE LIKE '%2024';

# electronic sales data market research
# update customer gender column

UPDATE market_research.electronics_sales_data
SET CustomerGender = 'Male'
WHERE CustomerGender = 0;

UPDATE market_research.electronics_sales_data
SET CustomerGender = 'Female'
WHERE CustomerGender = 1;

# purchase frequency = average number of purchases per year
# find avg product price, avg purchase freq and avg satisfaction score for millennials (ages 43-28)
SELECT * FROM market_research.electronics_sales_data;
SELECT AVG(PurchaseFrequency), AVG(CustomerAge), AVG(CustomerSatisfaction), AVG(ProductPrice)
FROM market_research.electronics_sales_data
WHERE CustomerAge BETWEEN 28 AND 43;

# find avg product price, avg purchase freq and avg satisfaction score for gen-z (ages 18-27)

SELECT AVG(PurchaseFrequency), AVG(CustomerAge), AVG(CustomerSatisfaction), AVG(ProductPrice)
FROM market_research.electronics_sales_data
WHERE CustomerAge BETWEEN 12 AND 27;

# find avg product price, avg purchase freq and avg satisfaction score for gen-x (ages 44-59)

SELECT AVG(PurchaseFrequency), AVG(CustomerAge), AVG(CustomerSatisfaction), AVG(ProductPrice)
FROM market_research.electronics_sales_data
WHERE CustomerAge BETWEEN 44 AND 59;

# find avg product price, avg purchase freq and avg satisfaction score for baby boomers (ages 60-78)

SELECT AVG(PurchaseFrequency), AVG(CustomerAge), AVG(CustomerSatisfaction), AVG(ProductPrice)
FROM market_research.electronics_sales_data
WHERE CustomerAge BETWEEN 60 AND 78;

# find avg age for customers with satisfaction score of 4 or higher

SELECT AVG(CustomerAge), CustomerSatisfaction
FROM market_research.electronics_sales_data
WHERE CustomerSatisfaction >= 4
GROUP BY CustomerSatisfaction;

# find avg age for customers who spent more than $1000

SELECT AVG(CustomerAge)
FROM market_research.electronics_sales_data
WHERE ProductPrice >= 1000;

# find avg prodcut price for customers 30 and under

SELECT AVG(ProductPrice)
FROM market_research.electronics_sales_data
WHERE CustomerAge <=30;

# find most popular product brand

SELECT ProductBrand, COUNT(ProductBrand) AS popular
FROM market_research.electronics_sales_data
GROUP BY ProductBrand
ORDER BY Popular DESC;

# find the most popular product category

SELECT ProductCategory, COUNT(ProductCategory) AS popular
FROM market_research.electronics_sales_data
GROUP BY ProductCategory
ORDER BY popular DESC;

# most popular categories with customers who purchase at least 10 times a year

SELECT ProductCategory, COUNT(ProductCategory)
FROM market_research.electronics_sales_data
WHERE PurchaseFrequency >=10
GROUP BY ProductCategory
ORDER BY COUNT(ProductCategory) DESC;

# most popular category for customers who rated their products a 4 or higher

SELECT ProductCategory, COUNT(ProductCategory)
FROM market_research.electronics_sales_data
WHERE CustomerSatisfaction >=4
GROUP BY ProductCategory
ORDER BY COUNT(ProductCategory) DESC;

# customer gender split

SELECT CustomerGender, COUNT(CustomerGender)
FROM market_research.electronics_sales_data
GROUP BY CustomerGender;

# find purchase frequency for customers between the 2 sexes

SELECT AVG(PurchaseFrequency), CustomerGender
FROM market_research.electronics_sales_data
GROUP BY CustomerGender;

# amount of customers with purchase freq higher than 10 both sexes

SELECT PurchaseFrequency, COUNT(PurchaseFrequency), CustomerGender
FROM market_research.electronics_sales_data
WHERE PurchaseFrequency >=10
GROUP BY CustomerGender, PurchaseFrequency
ORDER BY PurchaseFrequency, CustomerGender;

# which of the 2 sexes was more likely to have purchase freq higher than 10 

SELECT COUNT(PurchaseFrequency), CustomerGender
FROM market_research.electronics_sales_data
WHERE PurchaseFrequency >=10
GROUP BY CustomerGender;

# find satisfaction score for customers between the 2 sexes

SELECT AVG(CustomerSatisfaction), CustomerGender
FROM market_research.electronics_sales_data
GROUP BY CustomerGender;

# customer satisfaction scores by gender higher than 4

SELECT CustomerGender, CustomerSatisfaction, COUNT(CustomerGender)
FROM market_research.electronics_sales_data
WHERE CustomerSatisfaction >=4
GROUP BY CustomerGender, CustomerSatisfaction
ORDER BY COUNT(CustomerGender) DESC;

# customer satisfaction scores by age counted

SELECT CustomerAge, CustomerSatisfaction, COUNT(CustomerAge)
FROM market_research.electronics_sales_data
WHERE CustomerSatisfaction >=4
GROUP BY CustomerAge, CustomerSatisfaction
ORDER BY COUNT(CustomerAge) DESC;

# what age of customers is more likely to spend more than $2000

SELECT CustomerAge, COUNT(CustomerAge)
FROM market_research.electronics_sales_data
WHERE ProductPrice >=2000
GROUP BY CustomerAge
ORDER BY COUNT(CustomerAge) DESC;

# what age of customers is more likely to spend more than $2000 and purchase more than 10 times a year

SELECT CustomerAge, COUNT(CustomerAge)
FROM market_research.electronics_sales_data
WHERE ProductPrice >=2000
AND PurchaseFrequency >= 10
GROUP BY CustomerAge
ORDER BY COUNT(CustomerAge) DESC;

SELECT AVG(CustomerAge)
FROM market_research.electronics_sales_data
WHERE ProductPrice >=2000
AND PurchaseFrequency >= 10;
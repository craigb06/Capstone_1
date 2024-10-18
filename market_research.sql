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
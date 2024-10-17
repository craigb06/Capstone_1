# create databse for market research

CREATE DATABASE market_research;

# join tables ecompctsa(e-com % of total sales) and ecomsa(e-com total sales revenue)
# ecomsa = e-commerce revenue in millions USD

SELECT DATE, ECOMPCTSA, (ECOMSA * 1000000)
FROM market_research.ecompctsa
JOIN market_research.ecomsa
USING (DATE);
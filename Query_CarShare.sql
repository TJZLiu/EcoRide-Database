# Q1
SELECT CONCAT(c.FIRST_NAME, " ", c.LAST_NAME) AS Customer, r.START_DATE as TRAVEL_DAY, r.PORT_START as PORT_START, r.PORT_END as PORT_END
FROM client c
INNER JOIN  ride r on c.CLIENT_ID= r.CLIENT_ID
WHERE r.START_DATE between "2020-09-01" and "2020-09-30";

# Q2
# The best 3 customers are the onces, who has taken the car for ride most often 
SELECT CONCAT(c.FIRST_NAME, " ", c.LAST_NAME) AS Customer, COUNT(1)
FROM client c
JOIN  ride r on c.CLIENT_ID= r.CLIENT_ID
GROUP BY Customer
ORDER BY COUNT(1) DESC
LIMIT 3;

#Q3
SELECT concat(min(r.START_DATE), ' - ', max(r.END_DATE)) AS PeriodOfSales,
SUM(r.KM * p.COST_PER_KM + p.FIXED_COST) AS TotalSales,
SUM(r.KM * p.COST_PER_KM + p.FIXED_COST)/(TIMESTAMPDIFF(YEAR, min(r.START_DATE), max(r.END_DATE))) AS YearlyAverage,
ROUND(SUM(r.KM * p.COST_PER_KM + p.FIXED_COST)/(TIMESTAMPDIFF(MONTH, min(r.START_DATE), max(r.END_DATE)))) AS MonthlyAverage
FROM ride r
JOIN  client c on r.CLIENT_ID= c.CLIENT_ID
JOIN  pricing p on C.PRICING_ID= p.PRICING_ID;

# Q4 
# Total sales by country
SELECT country.NAME, SUM(r.KM * p.COST_PER_KM + p.FIXED_COST) AS TotalSales_Country
FROM (ride r, client, country, pricing)
JOIN  client c on r.CLIENT_ID= c.CLIENT_ID
JOIN  pricing p on c.PRICING_ID= p.PRICING_ID
JOIN city on r.PORT_START = city.CITY_ID
GROUP BY country.NAME;









    




    



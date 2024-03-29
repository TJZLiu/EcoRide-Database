use car_sharing;

-- # Q1
-- # List of customers and day of their rides between 9th and 11th of July 2021
SELECT CONCAT(c.FIRST_NAME, " ", c.LAST_NAME) AS Customer, r.START_DATE as TRAVEL_DAY, r.PORT_START as PORT_START, r.PORT_END as PORT_END
FROM client c
INNER JOIN  ride r on c.CLIENT_ID= r.CLIENT_ID
WHERE r.START_DATE between "2021-07-09" and "2021-07-11";

-- # Q2
-- # The best 3 customers are the onces, who has taken the car for ride most often 
SELECT CONCAT(c.FIRST_NAME, " ", c.LAST_NAME) AS Customer, COUNT(1) as NUM_RIDES
FROM client c
JOIN  ride r on c.CLIENT_ID= r.CLIENT_ID
GROUP BY c.CLIENT_ID
ORDER BY NUM_RIDES DESC
LIMIT 3;

-- #Q3
-- # The average amount sales for the period between 1st of January 2018 and 23d of December 2021
SELECT concat(min(r.START_DATE), ' - ', max(r.END_DATE)) AS PeriodOfSales,
CONCAT(ROUND(SUM(r.KM * p.COST_PER_KM + p.FIXED_COST + p.COST_PER_MIN * TIMESTAMPDIFF(MINUTE, r.START_DATE, r.END_DATE) )), " ", "€") AS TotalSales,
CONCAT(ROUND(SUM(r.KM * p.COST_PER_KM + p.FIXED_COST + p.COST_PER_MIN * TIMESTAMPDIFF(MINUTE, r.START_DATE, r.END_DATE)) / (TIMESTAMPDIFF(YEAR, min(r.START_DATE), max(r.END_DATE)))), " ", "€") AS YearlyAverage,
CONCAT(ROUND(SUM(r.KM * p.COST_PER_KM + p.FIXED_COST+ p.COST_PER_MIN * TIMESTAMPDIFF(MINUTE, r.START_DATE, r.END_DATE)) / (TIMESTAMPDIFF(MONTH, min(r.START_DATE), max(r.END_DATE)))), " ", "€") AS MonthlyAverage
FROM ride r
JOIN  client c on r.CLIENT_ID = c.CLIENT_ID
JOIN  pricing p on C.PRICING_ID = p.PRICING_ID;

-- # Q4 
-- # The total sales by country
SELECT country.NAME, 
CONCAT(ROUND(SUM(r.KM * p.COST_PER_KM + p.FIXED_COST + p.COST_PER_MIN * TIMESTAMPDIFF(MINUTE, r.START_DATE, r.END_DATE))), " ", "€") AS TotalSales_Country
FROM ride r
JOIN  client c on r.CLIENT_ID = c.CLIENT_ID
JOIN  pricing p on c.PRICING_ID = p.PRICING_ID
JOIN charging_port cp on cp.PORT_ID = r.PORT_START
JOIN charging_station cs on cs.STATION_ID = cp.STATION_ID
JOIN city on city.CITY_ID = cs.CITY_ID
JOIN country on country.COUNTRY_ID = city.COUNTRY_ID
GROUP BY country.NAME;

-- # Q5
-- # List of all cities where the travels were made and ride's ratings
SELECT city.NAME, rt.Rating, rt.Comment
FROM rating rt
JOIN  client c on rt.CLIENT_ID = c.CLIENT_ID
JOIN ride r on r.CLIENT_ID  = c.CLIENT_ID 
JOIN charging_port cp on cp.PORT_ID = r.PORT_START
JOIN charging_station cs on cs.STATION_ID = cp.STATION_ID
JOIN city on city.CITY_ID = cs.CITY_ID
GROUP BY city.NAME;

use car_sharing;

-- # Q1
EXPLAIN
SELECT CONCAT(c.FIRST_NAME, " ", c.LAST_NAME) AS Customer, r.START_DATE as TRAVEL_DAY, r.PORT_START as PORT_START, r.PORT_END as PORT_END
FROM client c
INNER JOIN  ride r on c.CLIENT_ID= r.CLIENT_ID
WHERE r.START_DATE between "2020-09-01" and "2020-09-30";

-- # Fast query execution, the explain command shows that it uses a simple select command, refering tables with aliases r and c. 
-- # Uses primary key, with 5 rows examined, with estimated 100% of rows being  analysed and where clause applied.

-- # Q2
-- # The best 3 customers are the onces, who has taken the car for ride most often 
EXPLAIN 
SELECT CONCAT(c.FIRST_NAME, " ", c.LAST_NAME) AS Customer, COUNT(1) as NUM_RIDES
FROM client c
JOIN  ride r on c.CLIENT_ID= r.CLIENT_ID
GROUP BY c.CLIENT_ID
ORDER BY NUM_RIDES DESC
LIMIT 3;

-- # This query is simple select type, refers to tables with aliases r and c, with 193 rows examined, extra states execution using index, temporary and filesort.
-- # The query runs fast, so no penalty observed. 

-- #Q3
EXPLAIN 
SELECT concat(min(r.START_DATE), ' - ', max(r.END_DATE)) AS PeriodOfSales,
CONCAT(ROUND(SUM(r.KM * p.COST_PER_KM + p.FIXED_COST + p.COST_PER_MIN * TIMESTAMPDIFF(MINUTE, r.START_DATE, r.END_DATE) )), " ", "€") AS TotalSales,
CONCAT(ROUND(SUM(r.KM * p.COST_PER_KM + p.FIXED_COST + p.COST_PER_MIN * TIMESTAMPDIFF(MINUTE, r.START_DATE, r.END_DATE)) / (TIMESTAMPDIFF(YEAR, min(r.START_DATE), max(r.END_DATE)))), " ", "€") AS YearlyAverage,
CONCAT(ROUND(SUM(r.KM * p.COST_PER_KM + p.FIXED_COST+ p.COST_PER_MIN * TIMESTAMPDIFF(MINUTE, r.START_DATE, r.END_DATE)) / (TIMESTAMPDIFF(MONTH, min(r.START_DATE), max(r.END_DATE)))), " ", "€") AS MonthlyAverage
FROM ride r
JOIN  client c on r.CLIENT_ID = c.CLIENT_ID
JOIN  pricing p on C.PRICING_ID = p.PRICING_ID;

-- # Fast execution, again simply select query, refering to three tables with aliases r, c and p, no partitions, 193, 1 and 2 rows executed.
-- # Two cases of type ALL, which means entire table was scanned for query execution.
-- # The last joined table is executed 50%, with extra information using where and using join buffer (hash join), meaning the join function was unable to use the index.

-- # Q4 
-- # Total sales by country
EXPLAIN 
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

-- # Fast execution, the explain command shows that the query joins 7 tables, with two types of joins ALL, which means the query scanned entire table using no indexes.
-- # Averall number of rows executed is 27, extra column states that for 3 tables query used index, for the rest using temporary, where or join buffer.

-- # Q5
-- # List of all cities where the travels were made and ride's ratings
EXPLAIN 
SELECT city.NAME, avg(rt.Rating) AS AVERAGE_RATING
FROM rating rt
JOIN  client c on rt.CLIENT_ID = c.CLIENT_ID
JOIN ride r on r.CLIENT_ID  = c.CLIENT_ID 
JOIN charging_port cp on cp.PORT_ID = r.PORT_START
JOIN charging_station cs on cs.STATION_ID = cp.STATION_ID
JOIN city on city.CITY_ID = cs.CITY_ID
GROUP BY city.NAME;

-- # Fast execution, the query of simple select type, joins 6 tables, executes in total 46 rows, with 100% of rows analysed.
-- # Extra states that most tables were accesed via index, except one, where temporary table was created. 

CREATE VIEW invoice_PO AS
SELECT FIRST_NAME, LAST_NAME,START_DATE, END_DATE, KM, city.NAME, CONCAT(ROUND(r.KM * p.COST_PER_KM + p.FIXED_COST + p.COST_PER_MIN * TIMESTAMPDIFF(MINUTE, r.START_DATE, r.END_DATE)), " ", "€") AS Ride_Cost
FROM ride r
JOIN  client c on r.CLIENT_ID = c.CLIENT_ID
JOIN  pricing p on c.PRICING_ID = p.PRICING_ID
JOIN charging_port cp on cp.PORT_ID = r.PORT_START
JOIN charging_station cs on cs.STATION_ID = cp.STATION_ID
JOIN city on city.CITY_ID = cs.CITY_ID
JOIN country on country.COUNTRY_ID = city.COUNTRY_ID
ORDER BY END_DATE;


SELECT * FROM invoice_po
ORDER BY END_DATE
LIMIT 5,1;

CREATE VIEW invoice_I AS
SELECT END_DATE AS Invoice_date, CONCAT(c.FIRST_NAME, " ", c.LAST_NAME) AS "Invoice to", CONCAT(c.ADDRESS, ", ", c.ZIP_CODE) AS "Invoice address", PHONE_NUMBER, EMAIL
FROM ride r
JOIN  client c on r.CLIENT_ID = c.CLIENT_ID
JOIN  pricing p on c.PRICING_ID = p.PRICING_ID
JOIN charging_port cp on cp.PORT_ID = r.PORT_START
JOIN charging_station cs on cs.STATION_ID = cp.STATION_ID
JOIN city on city.CITY_ID = cs.CITY_ID
JOIN country on country.COUNTRY_ID = city.COUNTRY_ID
ORDER BY END_DATE;

SELECT * FROM invoice_po
ORDER BY END_DATE
LIMIT 5,1;

SELECT * FROM invoice_I
ORDER BY Invoice_date
LIMIT 5,1;
drop trigger invoice_generator;

-- TRIGGER 1
CREATE TRIGGER invoice_generator
AFTER INSERT ON ride
FOR EACH ROW 
INSERT INTO invoice(START_DATE, CAR_ID, CLIENT_ID, PRICING_ID) 
    (SELECT START_DATE, CAR_ID, c.CLIENT_ID, c.PRICING_ID
    FROM ride r
    JOIN client c ON r.CLIENT_ID = c.CLIENT_ID
    WHERE r.START_DATE = new.START_DATE 
    AND r.CAR_ID = new.CAR_ID
    AND r.CLIENT_ID = new.CLIENT_ID)
;

-- drop trigger update_car_km;

-- -- TRIGGER 2
-- CREATE TRIGGER update_car_km
-- AFTER INSERT ON ride 
-- FOR EACH ROW
-- UPDATE car c
-- SET KM = KM + new.KM
-- WHERE new.CAR_ID = c.CAR_ID
-- ;

-- tests for checking functioning of new triggers

select *
from invoice
where car_id = 3
and client_id = 100; -- no records


INSERT INTO `ride`(START_DATE, END_DATE, CAR_ID, CLIENT_ID, KM, PORT_START, PORT_END)
VALUES ("2018-12-12 12:00:00", "2018-12-12 20:00:00", 3, 100, 100, 2, 4);

select *
from invoice
where car_id = 3
and client_id = 100; -- 1 record --> trigger functioning correctly
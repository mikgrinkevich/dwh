--dimension car
INSERT INTO dim_car(sk_car, vin_code, model, issue_year,
					brand, from_date, end_date, is_current)
VALUES 
(1, '4Y1SL65848Z411439', 'Zafira B', '2012', 'Oppel', '2022-06-02', '9999-12-31', 1), 
(2, 'JT4RN01P0N7057480', 'Pickup', '1992', 'Toyota ', '2022-06-02', '9999-12-31', 1),
(3, '3TMMU4FN8CM049190', 'Tacoma', '2012', 'Toyota', '2022-06-02', '9999-12-31', 1);

UPDATE dim_car
SET end_date = '2022-06-02',
    is_current = 0
WHERE vin_code = '4Y1SL65848Z411439'; 

INSERT INTO dim_car(sk_car, vin_code, model, issue_year,
					brand, from_date, end_date, is_current)
VALUES 
(4, '4Y1SL65848Z411439', 'Zafira B', '2012', 'Opel', '2022-06-03', '9999-12-31', 1);

UPDATE dim_car
SET end_date = '2022-06-02',
    is_current = 0
WHERE vin_code = 'JT4RN01P0N7057480'; 

INSERT INTO dim_car(sk_car, vin_code, model, issue_year,
					brand, from_date, end_date, is_current)
VALUES 
(5, 'JT4RN01P0N7057480', 'Legend', '1992', 'Acura', '2022-06-03', '9999-12-31', 1);

INSERT INTO dim_car(sk_car, vin_code, model, issue_year,
					brand, from_date, end_date, is_current)
VALUES 
(6, 'JN1CA31D3YT717809', 'Maxima', '2000', 'Nissan', '2022-06-03', '9999-12-31', 1),
(7, 'WAUHGAFC6DN030356', 'A6', '2013', 'Audi', '2022-06-03', '9999-12-31', 1);

UPDATE dim_car
SET end_date = '2022-06-03',
    is_current = 0
WHERE vin_code = 'JT4RN01P0N7057480';
UPDATE dim_car
SET end_date = '2022-06-03',
    is_current = 0
WHERE vin_code = 'JN1CA31D3YT717809';
UPDATE dim_car
SET end_date = '2022-06-03',
    is_current = 0
WHERE vin_code = 'WAUHGAFC6DN030356';

INSERT INTO dim_car(sk_car, vin_code, model, issue_year,
					brand, from_date, end_date, is_current)
VALUES 
(8, 'JT4RN01P0N7057480', 'Legend', '1995', 'Acura', '2022-06-04', '9999-12-31', 1),
(9, 'JN1CA31D3YT717809', 'Max', '2000', 'Nissan', '2022-06-04', '9999-12-31', 1),
(10, 'WAUHGAFC6DN030356', 'A6', '2014', 'Audi', '2022-06-04', '9999-12-31', 1);

select * from dim_car;  


------------------------------------------------------------------------------------------------------------------------------


--dim_manager
INSERT INTO dim_manager(sk_manager, emp_code, firstname, lastname,
					dept, hire_date, start_date, end_date, is_current)
VALUES 
(1, 'ETML', 'Everett', 'Maxwell', '00001E', '2022-04-01', '2022-06-02', '9999-12-31', 'YES'), 
(2, 'OADZ', 'Ophelia', 'Diaz', '00001E', '2022-06-01', '2022-06-02','9999-12-31', 'YES'),
(3, 'AATL', 'Anika', 'Terrell', '00001E', '2021-09-01', '2022-06-02','9999-12-31', 'YES'),
(4, 'BYRN', 'Barry', 'Richardson', '00002M', '2020-08-01', '2022-06-02','9999-12-31', 'YES');


UPDATE dim_manager
SET end_date = '2022-06-02',
    is_current = 'NO'
WHERE emp_code = 'AATL'; 

UPDATE dim_manager
SET end_date = '2022-06-02',
    is_current = 'NO'
WHERE emp_code = 'OADZ'; 

INSERT INTO dim_manager(sk_manager, emp_code, firstname, lastname,
					dept, hire_date, start_date, end_date, is_current)
VALUES 
(5,'AATL', 'Anika', 'Terrell', '00002M', '2021-09-01', '2022-06-03','9999-12-31', 'YES'),
(6, 'OADZ', 'Ophelia', 'Diaz', '00002M', '2022-06-01', '2022-06-03','9999-12-31', 'YES'),
(7, 'SADL', 'Sabiha', 'Driscoll', '00001A', '2019-04-01', '2022-06-03','9999-12-31', 'YES'),
(8, 'SNJS', 'Salahuddin', 'Jones', '00001A', '2019-04-01', '2022-06-03','9999-12-31', 'YES');

UPDATE dim_manager
SET end_date = '2022-06-03',
    is_current = 'NO'
WHERE emp_code = 'AATL'; 

UPDATE dim_manager
SET end_date = '2022-06-03',
    is_current = 'NO'
WHERE emp_code = 'SNJS'; 

INSERT INTO dim_manager(sk_manager, emp_code, firstname, lastname,
					dept, hire_date, start_date, end_date, is_current)
VALUES 
(9,'AATL', 'Anika', 'Rowley', '00002M', '2021-09-01', '2022-06-04','9999-12-31', 'YES'),
(10, 'SNJS', 'Orlando', 'Jones', '00001A', '2019-04-01', '2022-06-04','9999-12-31', 'YES');

select * from dim_manager;


----------------------------------------------------------------------------------------------------------------------------------
--dim_date


INSERT INTO dim_date(sk_sales_date, date_id, month, day_of_week, quarter, week_of_year, is_hol)
VALUES 
('2022-06-02 09:05:35.542156+07', '20220602-090535.542156', 6, 4, 3, 22, 'FALSE'), 
('2022-06-02 12:45:45.723336+06', '20220602-124545.723336', 6, 4, 3, 22, 'FALSE'),
('2022-06-02 13:12:21.849521+01', '20220602-131221.849521', 6, 4, 3, 22, 'FALSE'),
('2022-06-02 16:14:15.551515+07', '20220602-161415.551515', 6, 4, 3, 22, 'FALSE'),

('2022-06-03 8:45:47.154545+07', '20220603-84547.154545', 6, 5, 3, 22, 'TRUE'), 
('2022-06-03 13:22:45.456154+09', '20220603-132245.456154', 6, 5, 3, 22, 'FALSE'),
('2022-06-03 13:41:53.441515+01', '20220603-134153.441515', 6, 5, 3, 22, 'FALSE'),

('2022-06-04 8:36:25.215451+11', '20220603-83625.215451', 6, 6, 3, 22, 'FALSE'), 
('2022-06-04 12:25:45.486251+01', '20220603-122545.486251', 6, 6, 3, 22, 'FALSE'),
('2022-06-04 17:14:14.121216+02', '20220603-171414.121216', 6, 6, 3, 22, 'FALSE');

SELECT * FROM dim_date;

UPDATE dim_date
SET sk_sales_date = '2022-06-02 13:47:21.849521+01'
WHERE date_id = '20220603-84547.154545'; 

--"sk_sales_date" column cannot get updated, exception raised


------------------------------------------------------------------------------------------------------------------------------------
--dim_client


INSERT INTO dim_client(sk_client, pass_code, firstname, lastname,
					birthday, tel, city, email, start_date, end_date, is_current)
VALUES 
(1,'ESDN', 'Elis', 'Denton', '2000-09-14', 375295184961, 'Gomel', 'mavim23198@dilanfa.com', '2022-06-02','9999-12-31', 'YES'),
(2, 'CELM', 'Claude', 'Lam', '1998-06-23', 37533706579, 'Minsk', 'pupgod01@hotmail.red', '2022-06-02','9999-12-31', 'YES'),
(3, 'NHMN', 'Nevaeh', 'Mckeown','2002-04-18', 375331007295, 'Kiev','bghrealtor@udinnews.com', '2022-06-02','9999-12-31', 'YES'),
(4, 'MERH', 'Madelaine', 'Roach', '1993-04-12', 375441863263, 'Mogilev', 'owais333@dimana.live','2022-06-02','9999-12-31', 'YES');

SELECT * FROM dim_client;

UPDATE dim_client
SET end_date = '2022-06-02',
	is_current = 'NO'
WHERE pass_code = 'CELM'; 
UPDATE dim_client
SET end_date = '2022-06-02',
	is_current = 'NO'
WHERE pass_code = 'NHMN';

INSERT INTO dim_client(sk_client, pass_code, firstname, lastname,
					birthday, tel, city, email, start_date, end_date, is_current)
VALUES 
(5, 'CELM', 'Claude', 'Lam', '1998-06-23', 37533706579, 'Rogachev', 'pupgod01@hotmail.red', '2022-06-03','9999-12-31', 'YES'),
(6, 'NHMN', 'Nevaeh', 'Mckeown','2002-04-18', 375333462180, 'Kiev','bghrealtor@udinnews.com', '2022-06-03','9999-12-31', 'YES');


INSERT INTO dim_client(sk_client, pass_code, firstname, lastname,
					birthday, tel, city, email, start_date, end_date, is_current)
VALUES 
(7,'SEGN', 'Stephanie', 'Glenn', '1994-09-14', 375441163696, 'Mazyr', '973494091@asifboot.com', '2022-06-04','9999-12-31', 'YES'),
(8, 'BYVZ', 'Bayley', 'Valdez', '2000-11-19', 375448248854, 'Minsk', 'jaebabee@filevino.com', '2022-06-04','9999-12-31', 'YES'),
(9, 'SAKA', 'Samantha', 'Kouma','2001-05-18', 375444608904, 'Smolevich','dmitrogykov@jual.me', '2022-06-04','9999-12-31', 'YES'),
(10, 'EETR', 'Eddie', 'Thatcher', '1993-04-23', 375331203462, 'Baranovichi', 'anddrei2008@gmailiz.com','2022-06-04','9999-12-31', 'YES');


------------------------------------------------------------------------------------------------------------------------------------
--dim_show_room


INSERT INTO dim_show_room(sk_show_room, show_room_name, city, street, building, prev_tel, cur_tel, effect_date)
VALUES 
(1, 'GomRoom', 'Gomel', 'Mazurove', '182-a', NULL, 375295184961, '2022-06-02'),
(2, 'MinRoom', 'Minsk', 'Lenina', '23', NULL, 37533706579, '2022-06-02'),
(3, 'KiRoom', 'Kiev', 'Pushkina', '84-2', NULL, 375331007295, '2022-06-02');


SELECT * FROM dim_show_room;

UPDATE dim_show_room
SET prev_tel = 375295184961,
	cur_tel = 375293947321
WHERE show_room_name = 'MinRoom'; 
UPDATE dim_show_room
SET prev_tel = 37533706579,
	cur_tel = 375295006943
WHERE show_room_name = 'KiRoom';

INSERT INTO dim_show_room(sk_show_room, show_room_name, city, street, building, prev_tel, cur_tel, effect_date)
VALUES 
(4, 'GomRoom', 'Mazyr', 'Ptushkina', '54-b', NULL, 375334488724, '2022-06-03'),
(5, 'SmRoom', 'Smolevich', 'Lenina', '89', NULL, 375299824294, '2022-06-03'),
(6, 'BaRoom', 'Baranovichi', 'Ptushkina', '48-1', NULL, 375257322249, '2022-06-03'),
(7, 'MaRoom', 'Mazyr', 'Mazurove', '158', NULL, 375445261405, '2022-06-04'),
(8, 'RuRoom', 'Ruhas', 'Lenina', '12', NULL, 375257481618, '2022-06-04'),
(9, 'MoRoom', 'Mosk', 'Khmelnitskaha', '234', NULL, 375255728640, '2022-06-04'),
(10, 'SlRoom', 'Slavutich', 'Pushkina', '11-a', NULL, 375332880173, '2022-06-04');

UPDATE dim_show_room
SET prev_tel = 375255728640,
	cur_tel = 375292583783
WHERE show_room_name = 'MoRoom'; 
UPDATE dim_show_room
SET prev_tel = 375257322249,
	cur_tel = 375447023492
WHERE show_room_name = 'BaRoom';
UPDATE dim_show_room
SET prev_tel = 375332880173,
	cur_tel = 375295091986
WHERE show_room_name = 'SlRoom'; 


------------------------------------------------------------------------------------------------------------------------------------
--dim_storage


INSERT INTO dim_storage(sk_storage, storage_id, city, street, building, tel, parking_lot_count, area)
VALUES 
(1, 'GomStorage', 'Gomel', 'Mazurove', '182-a', 375295184961, 34, 580),
(2, 'MinStorage', 'Minsk', 'Lenina', '23', 37533706579, 105, 408),
(3, 'KiStorage', 'Kiev', 'Pushkina', '84-2', 375331007295, 58, 700),
(4, 'MazStorage', 'Mazyr', 'Ptushkina', '54-b', 375334488724, 48, 630),
(5, 'SmStorage', 'Smolevich', 'Lenina', '89', 375299824294, 80, 280),
(6, 'BaStorage', 'Baranovichi', 'Ptushkina', '48-1', 375257322249, 70, 800),
(7, 'MaStorage', 'Mazyr', 'Mazurove', '158', 375445261405, 201, 1050),
(8, 'RuStorage', 'Ruhas', 'Lenina', '12', 375257481618, 102, 1100),
(9, 'MoStorage', 'Mosk', 'Khmelnitskaha', '234', 375255728640, 56, 700),
(10, 'SlStorage', 'Slavutich', 'Pushkina', '11-a', 375332880173, 63, 900);

SELECT * FROM dim_storage;

UPDATE dim_storage
SET parking_lot_count = 100
WHERE storage_id = 'SmStorage'; 

UPDATE dim_storage
SET storage_id = 'MStorage'
WHERE storage_id = 'MinStorage'; 

UPDATE dim_storage
SET tel = 375295934872
WHERE storage_id = 'BaRoom';


------------------------------------------------------------------------------------------------------------------------------------
--fact_sales


INSERT INTO fact_sales(sk_car, sk_client, sk_manager, sk_sales_date, sk_show_room, price)
VALUES 
(3, 2, 3, '2022-06-02 12:45:45.723336', 2, 120000),
(4, 5, 1, '2022-06-02 09:05:35.542156', 1, 15400),
(8, 7, 2, '2022-06-03 08:45:47.154545', 7, 89000),
(9, 9, 1, '2022-06-03 13:22:45.456154', 2, 67000),
(10, 3, 5, '2022-06-04 08:36:25.215451', 5, 8500);


------------------------------------------------------------------------------------------------------------------------------------
--fact_storage_snapshot


INSERT INTO fact_storage_snapshot(sk_car, sk_storage, sk_snapshot_date, days_on_storage)
VALUES 
(3, 2, '2022-06-02 12:45:45.723336', 0),
(4, 5, '2022-06-02 09:05:35.542156', 0),
(8, 7, '2022-06-03 08:45:47.154545', 1),
(9, 9, '2022-06-03 13:22:45.456154', 1),
(10, 3, '2022-06-04 08:36:25.215451', 2);


------------------------------------------------------------------------------------------------------------------------------------
--fact_sales_pipeline


INSERT INTO fact_sales_pipeline(sk_car, sk_client, sk_storage, sk_mf_order_date,
							   sk_st_delivery_date, sk_client_order_date, sk_client_delivery_date, mf_price, days_btw_clnt_order_dlvry)
VALUES 
(3, 2, 3, '2022-04-12', '2022-05-24', '2022-05-28', '2022-06-02', 120000, 5),
(4, 5, 1, '2022-05-12', '2022-06-01', '2022-06-01', '2022-06-02', 15400, 1),
(8, 7, 2, '2022-01-01', '2022-03-19', '2022-04-02', '2022-06-03', 89000, 62),
(9, 9, 1, '2022-03-02', '2022-04-13', '2022-04-16', '2022-06-03', 67000, 47),
(10, 3, 5, '2022-02-01', '2022-05-04', '2022-05-20', '2022-06-04', 8500, 15);
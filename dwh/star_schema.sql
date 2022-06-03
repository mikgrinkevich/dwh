CREATE TABLE IF NOT EXISTS dim_car (
  sk_car SERIAL PRIMARY KEY,
  vin_code VARCHAR(17) NOT NULL,
  model TEXT NOT NULL,
  issue_year TEXT NOT NULL,
  brand TEXT NOT NULL, 

  from_date DATE NOT NULL,
  end_date DATE NOT NULL,
  is_current INTEGER NOT NULL
);

CREATE TABLE IF NOT EXISTS dim_manager (
  sk_manager SERIAL PRIMARY KEY,
  emp_code VARCHAR(4) NOT NULL,
  firstname TEXT NOT NULL,
  lastname TEXT NOT NULL,
  dept TEXT NOT NULL,
  hire_date DATE NOT NULL,

  start_date DATE NOT NULL,
  end_date DATE NOT NULL,
  is_current VARCHAR(3) NOT NULL
);

--scd 0
CREATE TABLE IF NOT EXISTS dim_date (
  sk_sales_date TIMESTAMP UNIQUE NOT NULL DEFAULT CURRENT_TIMESTAMP,
  date_id VARCHAR(25) NOT NULL,
  month INTEGER NOT NULL,
  day_of_week INTEGER NOT NULL,
  quarter INTEGER NOT NULL,
  week_of_year INTEGER NOT NULL,
  is_hol BOOLEAN NOT NULL
);

CREATE OR REPLACE FUNCTION check_data_change()
  RETURNS TRIGGER AS
$BODY$
BEGIN
  RAISE EXCEPTION '"sk_sales_date" column cannot get updated';
END;
$BODY$ LANGUAGE PLPGSQL;

CREATE TRIGGER client_update_trigger
BEFORE UPDATE OF "sk_sales_date"
  ON "dim_date"
FOR EACH ROW
WHEN (NEW."sk_sales_date" IS DISTINCT FROM OLD."sk_sales_date")
EXECUTE PROCEDURE check_data_change();

CREATE TABLE IF NOT EXISTS dim_client (
  sk_client SERIAL PRIMARY KEY,
  pass_code VARCHAR(4) NOT NULL,
  firstname TEXT NOT NULL,
  lastname TEXT NOT NULL,
  birthday DATE NOT NULL,
  tel BIGINT NOT NULL,
  city TEXT NOT NULL,
  email TEXT NOT NULL,

  start_date DATE NOT NULL,
  end_date DATE NOT NULL,
  is_current VARCHAR(3) NOT NULL
);

CREATE TABLE IF NOT EXISTS dim_show_room (
  sk_show_room SERIAL PRIMARY KEY,
  show_room_name VARCHAR(10) NOT NULL,
  city TEXT NOT NULL,
  street TEXT NOT NULL,
  building VARCHAR(5) NOT NULL,

  prev_tel BIGINT,
  cur_tel BIGINT NOT NULL,
  effect_date DATE NOT NULL
);

CREATE TABLE IF NOT EXISTS dim_storage (
  sk_storage SERIAL PRIMARY KEY,
  storage_id VARCHAR(10) NOT NULL,
  city TEXT NOT NULL,
  street TEXT NOT NULL,
  building VARCHAR(5) NOT NULL,
  tel BIGINT NOT NULL,
  parking_lot_count INTEGER NOT NULL,
  area INTEGER NOT NULL
);

CREATE TABLE IF NOT EXISTS fact_sales (
  sk_car INTEGER REFERENCES dim_car(sk_car) NOT NULL,
  sk_client INTEGER REFERENCES dim_client(sk_client) NOT NULL,
  sk_manager INTEGER REFERENCES dim_manager(sk_manager) NOT NULL,
  sk_sales_date TIMESTAMP REFERENCES dim_date(sk_sales_date) NOT NULL,
  sk_show_room INTEGER REFERENCES dim_show_room(sk_show_room) NOT NULL,
  price INTEGER NOT NULL
);

CREATE TABLE IF NOT EXISTS fact_storage_snapshot (
  sk_car INTEGER REFERENCES dim_car(sk_car) NOT NULL,
  sk_storage INTEGER REFERENCES dim_storage(sk_storage) NOT NULL,
  sk_snapshot_date TIMESTAMP REFERENCES dim_date(sk_sales_date) NOT NULL,
  days_on_storage INTEGER NOT NULL
);

CREATE TABLE IF NOT EXISTS fact_sales_pipeline (
  sk_car INTEGER REFERENCES dim_car(sk_car) NOT NULL,
  sk_client INTEGER REFERENCES dim_client(sk_client) NOT NULL,
  sk_storage INTEGER REFERENCES dim_storage(sk_storage) NOT NULL,
  sk_mf_order_date DATE NOT NULL,  
  sk_st_delivery_date DATE NOT NULL,   
  sk_client_order_date DATE NOT NULL,  
  sk_client_delivery_date DATE NOT NULL,   
  mf_price INTEGER NOT NULL,
  days_btw_clnt_order_dlvry INTEGER NOT NULL
);

CREATE INDEX bk_employee_code
ON dim_manager(emp_code);

CREATE UNIQUE INDEX bk_timestamp_date
ON dim_date(date_id);

CREATE UNIQUE INDEX composite_car_client
ON fact_sales(sk_car, sk_client);

CREATE INDEX bk_client_code
ON dim_client(pass_code);

CREATE UNIQUE INDEX bk_storage_id
ON dim_storage(storage_id);

CREATE INDEX tel_client
ON dim_client(tel);

CREATE UNIQUE INDEX tel_show_room
ON dim_show_room(cur_tel);

CREATE UNIQUE INDEX tel_storage
ON dim_storage(tel);

CREATE UNIQUE INDEX sk_car
ON fact_storage_snapshot(sk_car);

CREATE UNIQUE INDEX order_ship
ON fact_sales_pipeline(sk_client_order_date, sk_client_delivery_date);
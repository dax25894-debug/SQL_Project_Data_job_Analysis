/*
i am working on the data analysis project name mcd_customer_analysis where i need three csv file which i am gonna interconnect. first file 

task = creating three csv file
first one(order_dim)
colomn name and data type,
    customer_id int,
    order_id int,
    order_date timestanp,
    order_time timestamp,
    store_id int,
    order_type text,
    products_name text,
    category text,
    price int,
    quantity int,
    total_amount int,
    payment_type text,
    employees int,
    shift text,
    prep_time timestamp,
    is_promotion boolean,
    weather text,
    day_of_week text
second one(customer_dim)
colomn name and data type,
    customer_id int,
    customer_age int,
    customer_gender text,
third one(store_dim)
colomn name and data type,
    store_id int,
    store_address text,
    store_location text(example mall,railwaystaion,high way and also you can add more lacation as you like)
    corporation boolean(if store run by corporation or franchiser)

also you can sugest more columns which could make this project more realistic and effective analys.
note- i am gonna interconnect tables at store-dim.store_id = order_dim.store_id = customer_dim.customer_id for the analysis perpus.
also correct the spelings of solomn name if there is speling error.
i want 20,000k orders at least
*/
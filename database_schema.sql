
create table vendors (
    vend_id serial primary key,
    vend_name varchar(50) not null,
    vend_address varchar(100),
    vend_city varchar(50),
    vend_state varchar(10),
    vend_zip varchar(10),
    vend_country varchar(50)
);

create table customers (
    cust_id serial primary key,
    cust_name varchar(50) not null,
    cust_address varchar(100),
    cust_city varchar(50),
    cust_state varchar(10),
    cust_zip varchar(10),
    cust_country varchar(50),
    cust_contact varchar(50),
    cust_email varchar(100)
);

create table products (
    prod_id varchar(10) primary key,
    vend_id int references vendors(vend_id),
    prod_name varchar(100) not null,
    prod_price DECIMAL(10,4),
    prod_desc TEXT
);

create table orders (
    order_num serial primary key,
    order_date date not null,
    cust_id int references customers(cust_id)
);

create table orderitems (
    order_num int references orders(order_num),
    order_item int not null,
    prod_id varchar(10) references products(prod_id),
    quantity int not null,
    item_price DECIMAL(10,4) not null,
    primary key (order_num, order_item)
);

create table productnotes (
    note_id serial primary key,
    prod_id varchar(10) references products(prod_id),
    note_date date not null,
    note_text TEXT
);


insert into vendors (vend_id, vend_name, vend_address, vend_city, vend_state, vend_zip, vend_country) VALUES
(1001, 'Anvils R Us', '123 Main Street', 'Southfield', 'MI', '48075', 'USA'),
(1002, 'LT Supplies', '590 Park Street', 'Anytown', 'OH', '44333', 'USA'),
(1003, 'ACME', '555 High Street', 'Los Angeles', 'CA', '90046', 'USA'),
(1004, 'Furball Inc.', '1000 5th Avenue', 'New York', 'NY', '11111', 'USA'),
(1005, 'Jet Set', '42 Galaxy Road', 'London', null, 'N16 6PS', 'England'),
(1006, 'Jouets Et Ours', '1 Rue Amusement', 'Paris', null, '45678', 'France');

insert into customers (cust_id, cust_name, cust_address, cust_city, cust_state, cust_zip, cust_country, cust_contact, cust_email) VALUES
(10001, 'Coyote Inc.', '200 Maple Lane', 'Detroit', 'MI', '44444', 'USA', 'Y Lee', 'ylee@coyote.com'),
(10002, 'Mouse House', '333 Fromage Lane', 'Columbus', 'OH', '43333', 'USA', 'Jerry Mouse', null),
(10003, 'Wascals', '1 Sunny Place', 'Muncie', 'IN', '42222', 'USA', 'Jim Jones', 'rabbit@wascally.com'),
(10004, 'Yosemite Place', '829 Riverside Drive', 'Phoenix', 'AZ', '88888', 'USA', 'Y Sam', 'sam@yosemite.com'),
(10005, 'E Fudd', '4545 53rd Street', 'Chicago', 'IL', '54545', 'USA', 'E Fudd', null);


insert into products (prod_id, vend_id, prod_name, prod_price, prod_desc) VALUES
('ANV01', 1001, '5 ton anvil', 5.9900, '5 ton anvil, black, complete with handy hook'),
('ANV02', 1001, '1 ton anvil', 9.9900, '1 ton anvil, black, complete with handy hook and carrying case'),
('ANV03', 1001, '2 ton anvil', 14.9900, '2 ton anvil, black, complete with handy hook and carrying case'),
('DTNTR', 1003, 'Detonator', 13.0000, 'Detonator (plunger powered), fuses not included'),
('FB', 1003, 'Bird seed', 10.0000, 'Large bag (suitable for road runners)'),
('FC', 1003, 'Carrots', 2.5000, 'Carrots (rabbit hunting season only)'),
('FUI', 1002, 'Fuses', 3.4200, '1 dozen, extra long'),
('JP1000', 1005, 'JetPack 1000', 35.0000, 'JetPack 1000, intended for single use'),
('JP2000', 1005, 'JetPack 2000', 55.0000, 'JetPack 2000, multi-use'),
('OLI', 1002, 'Oil can', 8.9900, 'Oil can, red'),
('SAFE', 1003, 'Safe', 50.0000, 'Safe with combination lock'),
('SLING', 1003, 'Sling', 4.4900, 'Sling, one size fits all'),
('TNT1', 1003, 'TNT (1 stick)', 2.5000, 'TNT, red, single stick'),
('TNT2', 1003, 'TNT (5 sticks)', 10.0000, 'TNT, red, pack of 10 sticks');

insert into orders (order_num,order_date, cust_id) VALUES
(20005,'2016-01-09', 10001),
(20006,'2016-12-09', 10003),
(20008,'2016-03-10', 10005),
(20009,'2016-08-10', 10001);



insert into orderitems (order_num, order_item, prod_id, quantity, item_price) VALUES
(20005, 1, 'ANV01', 10, 5.9900),
(20005, 2, 'ANV02', 3, 9.9900),
(20005, 3, 'TNT2', 5, 10.0000),
(20005, 4, 'FB', 1, 10.0000),
(20006, 1, 'JP2000', 1, 55.0000),
(20007, 1, 'TNT1', 100, 2.5000),
(20008, 1, 'FC', 50, 2.5000),
(20009, 1, 'FB', 1, 10.0000),
(20009, 2, 'OLI', 1, 8.9900), 
(20009, 3, 'SLING', 1, 4.4900),
(20009, 4, 'ANV03', 1, 14.9900);

insert into productnotes (note_id, prod_id, note_date, note_text) VALUES
(109, 'ANV03', '2016-01-09', 'Item is extremely heavy. Designed for dropping, not recommended for use with slings, ropes, pulleys, or tightropes.'),
(110, 'FC', '2016-01-09', 'Customer complaint: rabbit has been able to detect trap, food apparently less effective now.'),
(111, 'SLING', '2016-02-09', 'Shipped unassembled, requires common tools (including oversized hammer).'),
(112, 'SAFE', '2016-02-09', 'Customer complaint: Circular hole in safe floor can apparently be easily cut with handsaw.'),
(113, 'ANV01', '2016-05-09', 'Customer complaint: Not heavy enough to generate flying stars around head of victim. If being purchased for dropping, recommend ANV02 or ANV03 instead.'),
(114, 'SAFE', '2016-07-09', 'Call from individual trapped in safe plummeting to the ground, suggests an escape hatch be added. Comment forwarded to vendor.');




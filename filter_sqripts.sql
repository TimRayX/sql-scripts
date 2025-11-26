/*
1. Произвести выборку данных из столбцов prod_id, prod_name, prod_price
таблицы products, в случае если prod_price составляет 2.50.
*/

select 
prod_id,
prod_name,
prod_price
from products
where prod_price = 2.5;

/*
2. Произвести выборку данных из столбцов prod_id, prod_name, prod_price
таблицы products, в случае если имя продукта Fuses.
*/

select 
prod_id,
prod_name,
prod_price
from products
where prod_name = 'Fuses';

/*
 3. Предусловие: в таблицу products добавить запись, у которой в столбце с
наименованием продукта содержится значение fuses. Произвести выборку
данных из столбцов prod_id, prod_name, prod_price таблицы products, в
случае если имя продукта fuses. В результат должны попасть записи, у
которых значение столбца содержит fuses, независимо от регистра.*
 */

insert into products (prod_id, vend_id, prod_name, prod_price, prod_desc) 
values ('FUSES2', 1003, 'fuses', 3.50, 'test product');

select 
prod_id,
prod_name,
prod_price
from products
where prod_name ilike 'Fuses';

/*
 * 4. Произвести выборку данных из столбцов prod_id, prod_name, prod_price
таблицы products, в случае если prod_price меньше 10.
 */

select 
prod_id,
prod_name,
prod_price
from products
where prod_price < 10;

/*
 * 5. Произвести выборку данных из столбцов prod_id, prod_name, prod_price
таблицы products, в случае если prod_price меньше или равно 10
 */

select 
prod_id,
prod_name,
prod_price
from products
where prod_price <= 10;

/*
 * 6. Произвести выборку данных из столбцов vend_id, prod_name, prod_price
таблицы products, в случае если эти товары не произведены поставщиком с
идентификатором 1003 (если идентификаторы отличаются от базовых, то
взять из своей таблицы). Решить четырьмя способами.*/

select 
vend_id,
prod_name,
prod_price
from products p 
where vend_id <> 1003;

select 
vend_id,
prod_name,
prod_price
from products p 
where vend_id != 1003;

select 
vend_id,
prod_name,
prod_price
from products p 
where not vend_id = 1003;

select 
vend_id,
prod_name,
prod_price
from products p 
where vend_id not in (1003);


/*
 * 7. Произвести выборку данных из столбцов prod_id, prod_name, prod_price
таблицы products, в случае если цена больше или равна 5 и меньше или
равна 10 (решить разными способами).*/


select 
prod_id,
prod_name,
prod_price
from products
where prod_price >=5 and prod_price <= 10;

select 
prod_id,
prod_name,
prod_price
from products
where prod_price between 5 and 10;

/*
 * 8. Произвести выборку данных из столбцов cust_name, cust_state, cust_email,
cust_zip, cust_city, cust_country, cust_address из таблицы customers.
Информацию об адресе (cust_zip, cust_city, cust_address, cust_country,
cust_state) вывести в отдельном столбце с названием «Полный адрес».
Формат вывода данных столбца должен быть следующим: «Индекс, Страна,
Штат, Город, Адрес». Выборку значений осуществить только для клиентов, у
которых не заполнен e-mail.*/

select
c.cust_name,
c.cust_state,
c.cust_email,
c.cust_zip,
c.cust_city,
c.cust_country,
c.cust_address,
c.cust_zip || ' ' || cust_city|| ' ' || cust_address|| ' ' ||cust_country|| ' ' || cust_state as "Полный адрес"
from customers c
where cust_email is null;

/*
 * 9. Произвести выборку данных из столбцов cust_name, cust_state, cust_email,
cust_zip, cust_city, cust_country, cust_address из таблицы customers.
Информацию об адресе (cust_zip, cust_city, cust_address, cust_country,
cust_state) вывести в отдельном столбце с названием «Полный адрес».
Формат вывода данных столбца должен быть следующим: «Индекс, Страна,
Штат, Город, Адрес». Выборку значений осуществить только для клиентов, у
которых заполнен e-mail.
 */

select
c.cust_name,
c.cust_state,
c.cust_email,
c.cust_zip,
c.cust_city,
c.cust_country,
c.cust_address,
c.cust_zip || ' ' || cust_city|| ' ' || cust_address|| ' ' ||cust_country|| ' ' || cust_state as "Полный адрес"
from customers c
where cust_email is not null;

/*
 * 10.Произвести выборку данных из столбцов prod_id, prod_name, prod_price
таблицы products, в случае если идентификатор поставщика 1003(или свой)
и цена меньше или равна 10
 */

select 
prod_id,
prod_name,
prod_price
from products
where vend_id = 1003 and prod_price <= 10;

/*11.Произвести выборку данных из столбцов prod_id, prod_name, prod_price
таблицы products, в случае если идентификатор поставщика 1002 или 1003
(или свои) (решить разными способами).*/

select 
prod_id,
prod_name,
prod_price
from products
where vend_id = 1002 or vend_id = 1003;

select 
prod_id,
prod_name,
prod_price
from products
where vend_id in ( 1002, 1003);

/*12.Произвести выборку данных из столбцов prod_id, prod_name, prod_price
таблицы products, в случае если идентификатор поставщика 1002 или 1003
(или свои) и цена больше или равна 10. Решить двумя способами.*/

select 
prod_id,
prod_name,
prod_price
from products
where (vend_id = 1002 or vend_id = 1003) and prod_price >= 10;

select 
prod_id,
prod_name,
prod_price
from products
where (vend_id in ( 1002, 1003)) and prod_price >= 10;


/*13.Произвести выборку данных из столбцов vend_id, prod_id, prod_name,
prod_price таблицы products, в случае если идентификатор поставщика 1002
(или свой) или 1004. Отсортировать полученный результат по
наименованию продукта.*/


select 
vend_id,
prod_id,
prod_name,
prod_price
from products
where (vend_id in ( 1002, 1004)) 
order by prod_name;

/*14. Произвести выборку данных из столбцов vend_id, prod_id, prod_name,
prod_price таблицы products, в случае если идентификатор поставщика 1002
или 1005 (или свои), а также длина наименования продукта более 5
символов. Отсортировать полученный результат по наименованию
продукта*/

select 
vend_id,
prod_id,
prod_name,
prod_price
from products
where (vend_id in ( 1002, 1005))  and length(prod_name) > 5
order by prod_name;

/*15.Произвести выборку данных из столбцов prod_id, prod_name, prod_price
таблицы products для всех поставщиков кроме тех, чей идентификатор 1002
или 1003 (или свои), наименование продукта вывести в верхнем регистре.
Отсортировать полученный результат по коду продукта. Решить разными
способами.*/

select 
prod_id,
upper(prod_name),
prod_price
from products
where (vend_id not in ( 1002, 1003))
order by prod_id;

select prod_id,
upper(prod_name),
prod_price 
from products 
where vend_id != 1002 and vend_id != 1003
order by prod_id;

/*16.Найти все товары в таблице products, наименования которых начинаются со
слова “Jet”.*/

select * from products
where prod_name like 'Jet%';

/*17.Найти все товары в таблице products, наименования которых содержат в
себе символы “anvil”.*/

select * from products
where prod_name like '%anvil%';

/*18.Найти все товары в таблице products, наименования которых содержат в
себе 1 символ перед “ ton anvil” и может содержать несколько после.*/

select * from products
where prod_name like '_ ton anvil%';

/*19.Найти все товары в таблице products, наименования которых содержат в
себе несколько символов перед “ ton ” и может содержать несколько после.*/

select * from products
where prod_name like '%ton%';

/*20.Найти все контактные лица из таблицы customers, имена которых
начинаются с букв E или J. Результат отсортировать по контактам по
убыванию.*/

select cust_name 
from customers 
where cust_name like 'E%' or cust_name like 'J%'
order by cust_name desc;

/*21.Найти все контактные лица из таблицы customers, имена которых НЕ
начинаются с букв E или J. Результат отсортировать по контактам по
убыванию (решить разными способами). Информацию об адресе (cust_zip,
cust_city, cust_address, cust_country, cust_state) вывести в отдельном
столбце с названием «Полный адрес». */

select 
    cust_name,
    cust_zip || ', ' || cust_country || ', ' || cust_state || ', ' || cust_city || ', ' || cust_address as "Полный адрес"
from customers 
where cust_name not like 'E%' and cust_name not like 'J%'
order by cust_name desc;

select 
    cust_name,
    cust_zip || ', ' || cust_country || ', ' || cust_state || ', ' || cust_city || ', ' || cust_address as "Полный адрес"
from customers 
where not (cust_name like 'E%' or cust_name like 'J%')
order by cust_name desc;

/*22. Осуществить выборку данных из столбца vend_name таблицы vendors для
поставщика с номером 1 004. Определить позицию символа «Inc». Результат
вывести в столбец «Позиция». Решить двумя способами.*/

select 
    vend_name,
    position('Inc' in vend_name) as "Позиция"
from vendors 
where vend_id = 1004;

select 
    vend_name,
    strpos(vend_name, 'Inc') as "Позиция"
from vendors 
where vend_id = 1004;

/*23.Предусловие: в таблице productnotes в записи note_id = 107 изменить время
на следующее значение «2016-08-23 12:20:56.569». Из таблицы
productnotes отобрать все записи, внесённые в период с 18.08.2016 по
23.08.2016 включительно. Решить разными способами.*/

update productnotes 
set note_date = '2016-08-23 12:20:56.569' 
where note_id = 107;


select * from productnotes 
where note_date between '2016-08-18' and '2016-08-23 23:59:59';


select * from productnotes 
where note_date >= '2016-08-18' and note_date <= '2016-08-23 23:59:59';






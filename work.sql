-- 1. Произвести выборку всех данных из таблицы products.

select * from products p;

-- 2. Произвести выборку данных из столбца prod_name таблицы products.

select prod_name from products p;

-- 3. Произвести выборку данных из столбцов prod_id, prod_name, prod_price
-- таблицы products.

select prod_id, prod_name, prod_price from products;

-- 4. Произвести выборку уникальных данных из столбца vend_id таблицы
-- products.

select distinct vend_id from products p;

-- 5. Произвести выборку первых 5 строк из столбца prod_name таблицы products.

select prod_name from products p limit 5;

-- 6. Произвести выборку первых 5 строк из столбца prod_name таблицы products,
-- начиная с 3 позиции.

select prod_name from products p limit 5 offset 2;

-- 7 Произвести выборку всех строк из столбца prod_name таблицы products,
-- начиная с 5 позиции.

select prod_name from products p offset 4;

-- 8 Произвести выборку данных из столбца prod_name таблицы products и
-- осуществить сортировку по возрастанию

select prod_name from products p order by p.prod_name ASC;

-- 9 Произвести выборку данных из столбцов prod_id, prod_name, prod_price
-- таблицы products и осуществить сортировку по возрастанию по имени и цене.

select prod_id, prod_name, prod_price from products p order by prod_name, prod_price asc;

-- 10 Произвести выборку данных из столбцов prod_id, prod_name, prod_price
-- таблицы products и осуществить сортировку по убыванию по цене.

select prod_id, prod_name, prod_price from products p order by prod_price desc;

-- 11 Произвести выборку данных из столбцов prod_id, prod_name, prod_price
-- таблицы products и осуществить сортировку по убыванию по цене и по
-- возрастанию по имени.

select prod_id, prod_name, prod_price from products order by prod_price desc, prod_name asc;

-- 12. Произвести выборку данных из таблицы vendors, в результате которой
-- информация vend_name(поставщики) и vend_country(страна поставщиков)
-- выводится в одном поле (решить двумя способами).

select vend_name || ' ' || vend_country from vendors v;
select concat(vend_name, ' ', vend_country) from vendors;

/*
 13 Произвести выборку данных из таблицы vendors, в результате которой
информация vend_name(поставщики) и vend_country(страна поставщиков)
выводится в одном поле. Столбцу выборки присвоить имя «Наименование
(место нахождения)» (решить двумя способами).
*/

select 
vend_name || ' ' || vend_country AS "Наименование (место нахождения)" 
from vendors;

select
concat(vend_name, ' ', vend_country) AS "Наименование (место нахождения)" 
from vendors;

-- 14Произвести выборку данных из столбцов prod_id, quantity, item_price таблицы
-- orderitems.

select prod_id, quantity, item_price from orderitems o;

/* 
15 Произвести выборку данных из столбцов prod_id, quantity, item_price таблицы
orderitems, рассчитать итоговую цену, умножив цену за штуку на заказанное
количество каждого товара. Присвоить вычисляемому столбцу имя
«expanded_price».
 */

select
prod_id, quantity, item_price, (quantity * item_price) AS expanded_price 
FROM orderitems;

/*
16 Произвести выборку данных из таблицы vendors, в результате которой
информация vend_name(поставщики) и vend_country(страна поставщиков)
выводится в одном поле. Столбцу выборки присвоить имя «Наименование
(место нахождения)». В отдельном столбце с названием «Кол-во символов»
вывести количество символов в строке в столбце «Наименование (место
нахождения)» (решить тремя способами).
 */
-- способ 1
select vend_name || ' ' || vend_country as "Наименование (место нахождения)",
       length(vend_name || ' ' || vend_country) as "Кол-во символов"
from vendors;

-- Способ 2
select concat(vend_name, ' ', vend_country) AS "Наименование (место нахождения)",
       length(concat(vend_name, ' ', vend_country)) AS "Кол-во символов"
from vendors;

-- Способ 3
select vend_name || ' ' || vend_country AS "Наименование (место нахождения)",
       char_length(vend_name || ' ' || vend_country) as "Кол-во символов"
from vendors;


/*
 17.Произвести выборку данных из таблицы productnotes, в результате которой в
столбце note_text первая буква каждого слова приведена к верхнему
регистру.
 */

select initcap(note_text) from productnotes;

--18.Произвести выборку данных из таблицы products, в результате которой в
-- столбце prod_id все слова приведены к нижнему регистру.


select lower(prod_id) from productnotes p;

/*
 19. Произвести выборку данных из таблицы vendors, в результате которой
информация vend_name(поставщики) и vend_country(страна поставщиков)
выводится в одном поле. Столбцу выборки присвоить имя «Наименование
(место нахождения)». В отдельном столбце с названием «Регистр» вывести
информацию vend_name(поставщики) и vend_country(страна поставщиков) в
одном поле в верхнем регистре. Решить двумя способами.
 */

-- 1 способ
select 
vend_name || ' ' || vend_country as "Наименование (место нахождения)",
upper(vend_name || ' ' || vend_country) as "Регистр"
from vendors;

-- 2 способ
select 
concat( vend_name,' ', vend_country  )as "Наименование (место нахождения)",
upper(concat( vend_name,' ', vend_country)) as "Регистр"
from vendors;

/*
 20.Предусловие: вставить строку в таблицу products, в столбец prod_desc
добавить данные в которых в начале и в конце присутствуют пробелы.
Осуществить выборку данных из столбца prod_desc таблицы products, а также
вывести столбец с названием «Результат», в котором необходимо вывести
данные из столбца prod_desc, убрав пробелы в начале строки. Решить двумя
способами.
 */



insert into products (prod_id, vend_id, prod_name, prod_price, prod_desc) 
values ('TEST01', 1001, 'Test Product', 10.0000, '   товар с пробелами в начале и конце   ');

-- 1 способ
select prod_desc, 
       ltrim(prod_desc) as "Результат" 
from products;

-- 2 способ
select prod_desc, 
       trim(leading from prod_desc) as "Результат" 
from products;

/*
 21.Осуществить выборку данных из столбца prod_desc таблицы products, а также
вывести столбец с названием «Результат», в котором необходимо вывести
данные из столбца prod_desc, убрав пробелы в конце строки. Решить двумя
способами.
 */

select prod_desc, 
       rtrim(prod_desc) as "Результат" 
from products;

select prod_desc, 
       trim(trailing from prod_desc) as "Результат" 
from products;



-- ЧАСТЬ 2


/*
22.Осуществить выборку данных из столбца prod_desc таблицы products, а также
вывести столбец с названием «Результат», в котором необходимо вывести
данные из столбца prod_desc, убрав символ «T» в начале строки. Решить
двумя способами.
 * */

select 
p.prod_desc,
ltrim(p.prod_desc,'T') as "Результат"
from products p;

select 
p.prod_desc,
	trim(leading 'T' from p.prod_desc ) as "Результат"
from products p;


/*
 * 23 Осуществить выборку данных из столбца prod_desc таблицы products, а также
вывести столбец с названием «Результат», в котором необходимо вывести
данные из столбца prod_desc, убрав символы «Jet» в начале строки. Решить
двумя способами.
 */


select 
p.prod_desc,
ltrim(p.prod_desc,'Jet') as "Результат"
from products p;

select 
p.prod_desc,
	trim(leading 'Jet' from p.prod_desc ) as "Результат"
from products p;

/*
 * 24.Осуществить выборку данных из столбца prod_desc таблицы products, а также
вывести столбец с названием «Результат», в котором необходимо вывести
данные из столбца prod_desc, убрав символы «Jet, t, S, .» в начале строки.
Решить двумя способами.
 */

select 
p.prod_desc,
ltrim(p.prod_desc,'Jet, t, S, .') as "Результат"
from products p;

select 
p.prod_desc,
	trim(leading 'Jet, t, S, .' from p.prod_desc ) as "Результат"
from products p;

/*
 * 25.Осуществить выборку данных из столбца prod_desc таблицы products, а также
вывести столбец с названием «Результат», в котором необходимо вывести
данные из столбца prod_desc, убрав символ «e» в конце строки. Решить двумя
способами
 */
select 
p.prod_desc,
rtrim(p.prod_desc,'e') as "Результат"
from products p;

select 
p.prod_desc,
	trim(trailing 'e' from p.prod_desc ) as "Результат"
from products p;


/*\
 * 26.Осуществить выборку данных из столбца prod_desc таблицы products, а также
вывести столбец с названием «Результат», в котором необходимо вывести
данные из столбца prod_desc, убрав символы «ook» в конце строки. Решить
двумя способами.
 */

select 
p.prod_desc,
rtrim(p.prod_desc,'ook') as "Результат"
from products p;

select 
p.prod_desc,
	trim(trailing 'ook' from p.prod_desc ) as "Результат"
from products p;

/*
 * 27.Осуществить выборку данных из столбца prod_desc таблицы products, а также
вывести столбец с названием «Результат», в котором необходимо вывести
данные из столбца prod_desc, убрав символы «e, l, k, g» в конце строки.
Решить двумя способами.
*/

select 
p.prod_desc,
rtrim(p.prod_desc,'e, l, k, g') as "Результат"
from products p;

select 
p.prod_desc,
	trim(trailing 'e, l, k, g' from p.prod_desc ) as "Результат"
from products p;


/*
 * 28.Осуществить выборку данных из таблицы products. Заменить в столбце
prod_desc 6 символов на значение подстроки «YYY», начиная с 4 позиции.
Полученный результат вывести в столбце «Результат».
 */

select
p.prod_desc,
overlay(p.prod_desc placing 'YYY' from 4 for 6) as "Результат"
from products p;

/*
 * 29.Осуществить выборку данных из столбца vend_city таблицы vendors.
Определить позицию первого символа «A». Результат вывести в столбец
«Позиция». Решить двумя способами.
 */

select
v.vend_city,
position('A' in v.vend_city) as "Позиция"
from vendors v;

select
v.vend_city,
strpos(v.vend_city, 'A') as "Позиция"
from vendors v;

/*
 30.Осуществить выборку данных из столбца vend_address таблицы vendors.
Определить позицию символов «Str». Результат вывести в столбец
«Позиция». Осуществить сортировку по возрастанию по столбцу «Позиция».
Решить двумя способами
 */


select
v.vend_address ,
position( 'Str' in v.vend_address ) as "Позиция"
from vendors v order by "Позиция" ASC;

select
v.vend_address ,
strpos(v.vend_address , 'Str') as "Позиция"
from vendors v order by "Позиция" ASC;


/*
 * 31.Из столбца note_text таблицы productnotes извлечь 22 символа начиная с 13
позиции. Результат вывести в столбец «Результат». Решить двумя способами.
 */

select 
substring(pn.note_text from 13 for 22) as "Результат"
from productnotes pn;

select 
substr(pn.note_text, 13, 22) as "Результат"
from productnotes pn;

/*
 32.Из столбца note_text таблицы productnotes извлечь 22 первых символа.
Результат вывести в столбец «Результат».
 */

select 
left(pn.note_text,22) as "Результат"
from productnotes pn;

/*
33.Из столбца note_text таблицы productnotes извлечь -22 первых символа.
Результат вывести в столбец «Результат»
*/

select 
left(pn.note_text,-22) as "Результат"
from productnotes pn;

/*34.Из столбца note_text таблицы productnotes извлечь 14 последних символа.
Результат вывести в столбец «Результат».*/

select 
right(pn.note_text,14) as "Результат"
from productnotes pn;

/*
 * 35.Из столбца note_text таблицы productnotes извлечь -17 последних символа.
Результат вывести в столбец «Результат».
 */

select 
right(pn.note_text,-17) as "Результат"
from productnotes pn;

/*
 * 36.Осуществить выборку данных из поля vend_name таблицы vendors. В
отдельном столбце с названием «Повтор» вывести данные из поля
vend_name в количестве 3 повторов.*/

select 
v.vend_name,
repeat(v.vend_name,3 ) as "Повтор"
from vendors v ;

/*
 * 37.Осуществить выборку данных из поля vend_name таблицы vendors. В
отдельном столбце с названием «Ревёрс» вывести перевёрнутые данные из
поля vend_name.*/

select 
v.vend_name,
reverse(v.vend_name) as "Реверс"
from vendors v ;

/*
 * 38.Осуществить выборку данных из поля cust_email таблицы customers. В
отдельном столбце с названием «Часть 1» вывести символы до символа «@».
В отдельном столбце с названием «Часть 2» вывести символы после символа
«@». */

select 
c.cust_email ,
split_part(c.cust_email,'@',1) as "Часть 1",
split_part(c.cust_email,'@',2) as "Часть 2"
from customers c  ;


/*
 * 39.Осуществить выборку данных из поля cust_name таблицы customers. В
отдельном столбце с названием «Часть 1» вывести символы до пробела. В
отдельном столбце с названием «Часть 2» вывести символы после пробела.
 */


select 
c.cust_name,
split_part(c.cust_name,' ',1) as "Часть 1",
split_part(c.cust_name,' ',2) as "Часть 2"
from customers c  ;

/*
 * 40.Найдите временной интервал между 2022-10-23 и 1812-08-03.
 */

select age(timestamp '2022-10-23', timestamp'1812-08-03');

/*
 * 41.Осуществите выборку данных из поля order_date таблицы orders. Найдите
временной интервал между текущей датой и датой в поле order_date.
Результат выведите в отдельном столбце с названием «Интервал».
 */

select
o.order_date,
age(current_date, o.order_date) as "Интервал"
from orders o;

-- 42.Выведите текущую дату. Выполнить двумя способами.

select now();

select current_date;

-- 43.Выведите текущее время.

select current_time;




--- ЧАСТЬ 3

-- 44.Выведите текущую дату и время.
select current_timestamp;

/*
 * 45.Осуществите выборку данных из поля order_date таблицы orders. Выведите
год из даты, содержащейся в поле order_date. Результат выведите в
отдельном столбце с названием «Год».
 */

select 
o.order_date,
date_part('year', o.order_date) as "Год"
from orders o;

/*
 * 46.Осуществите выборку данных из поля order_date таблицы orders. Выведите
месяц из даты, содержащейся в поле order_date. Результат выведите в
отдельном столбце с названием «Месяц»
 */
select 
o.order_date,
date_part('month', o.order_date) as "Месяц"
from orders o;

/*
 * 47.Осуществите выборку данных из поля order_date таблицы orders. Выведите
день из даты, содержащейся в поле order_date. Результат выведите в
отдельном столбце с названием «День».
 */
select 
o.order_date,
date_part('day', o.order_date) as "День"
from orders o;

-- 48.выведите количество часов из 2020-06-30 02:36:24.
select date_part('hour', timestamp '2020-06-30 02:36:24') as "часы";

-- 49.выведите количество минут из 2020-06-30 02:36:24.
select date_part('minute', timestamp '2020-06-30 02:36:24') as "минуты";

-- 50.выведите количество секунд из 2020-06-30 02:36:24.
select date_part('second', timestamp '2020-06-30 02:36:24') as "секунды";


-- 51.выведите год, месяц, день, количество часов, минут, секунд из 2021-12-31
-- 12:48:17. каждый параметр выводиться в отдельном столбце с
-- соответствующим названием.
select 
    date_part('year', timestamp '2021-12-31 12:48:17') as "год",
    date_part('month', timestamp '2021-12-31 12:48:17') as "месяц",
    date_part('day', timestamp '2021-12-31 12:48:17') as "день",
    date_part('hour', timestamp '2021-12-31 12:48:17') as "часы",
    date_part('minute', timestamp '2021-12-31 12:48:17') as "минуты",
    date_part('second', timestamp '2021-12-31 12:48:17') as "секунды";

/*
 * 
 * 52.Осуществите выборку данных из поля order_date таблицы orders. Выведите
временной интервал от даты, содержащейся в поле order_date, до текущего
времени. Результат выведите в отдельном столбце с названием «Интервал».
Из полученного интервала выведите количество лет. Результат выведите в
отдельный столбец с названием «Года».
 */

select 
o.order_date,
age(current_date,o.order_date) as "Интервал", 
date_part('year', age(current_date,o.order_date)) as "Года"
from orders o;

/*
 * 53.Осуществите выборку данных из поля order_date таблицы orders. Выведите
временной интервал от даты, содержащейся в поле order_date, до текущего
времени. Результат выведите в отдельном столбце с названием «Интервал».
Из полученного интервала выведите количество месяцев. Результат
выведите в отдельный столбец с названием «Месяца».*/

select 
o.order_date,
age(current_date,o.order_date) as "Интервал", 
date_part('month', age(current_date,o.order_date)) as "Месяца"
from orders o;


/*
 * 54.Осуществите выборку данных из поля order_date таблицы orders. Выведите
временной интервал от даты, содержащейся в поле order_date, до текущего
времени. Результат выведите в отдельном столбце с названием «Интервал».
Из полученного интервала выведите количество дней. Результат выведите в
отдельный столбец с названием «Дни».
 */

select 
o.order_date,
age(current_date,o.order_date) as "Интервал", 
date_part('day', age(current_date,o.order_date)) as "Дни"
from orders o;

/*
 * 55.Выведите временной интервал от даты 1856-04-25 09:56:34 до текущего
времени. Результат выведите в отдельном столбце с названием «Интервал».
Из полученного интервала выведите количество часов, количество минут,
количество секунд. Каждый параметр выведите в отдельном столбце с
соответствующим названием.
 */

select 
    age(current_timestamp, timestamp '1856-04-25 09:56:34') as "интервал",
    date_part('hour', age(current_timestamp, timestamp '1856-04-25 09:56:34')) as "часы",
    date_part('minute', age(current_timestamp, timestamp '1856-04-25 09:56:34')) as "минуты",
    date_part('second', age(current_timestamp, timestamp '1856-04-25 09:56:34')) as "секунды";

/*
 * 56.Осуществите выборку данных из поля order_date таблицы orders. Из даты,
содержащейся в поле order_date отсеките все данные до года. Результат
выведите в отдельном столбце с названием «Результат». 
 */

select 
o.order_date,
date_trunc('year', o.order_date) as "Результат"
from orders o;

/*
 * 57.Осуществите выборку данных из поля order_date таблицы orders. Из даты,
содержащейся в поле order_date отсеките все данные до месяца. Результат
выведите в отдельном столбце с названием «Результат».
 */

select 
o.order_date,
date_trunc('month', o.order_date) as "Результат"
from orders o;

/*
 * 58.Осуществите выборку данных из поля order_date таблицы orders. Из даты,
содержащейся в поле order_date отсеките все данные до дня. Результат
выведите в отдельном столбце с названием «Результат».*/

select 
o.order_date,
date_trunc('day', o.order_date) as "Результат"
from orders o;

-- 59.Из даты 2015-05-26 16:36:42.258 отсеките все данные до часов. Результат
-- выведите в отдельном столбце с названием «Результат».

select date_trunc('hour', timestamp '2015-05-26 16:36:42.258') as "результат";


-- 60.из даты 2015-05-26 16:36:42.258 отсеките все данные до минут. результат
-- выведите в отдельном столбце с названием «результат».
select date_trunc('minute', timestamp '2015-05-26 16:36:42.258') as "результат";

-- 61.из даты 2015-05-26 16:36:42.258 отсеките все данные до секунд. результат
-- выведите в отдельном столбце с названием «результат».
select date_trunc('second', timestamp '2015-05-26 16:36:42.258') as "результат";




/*
 * 62.Из таблицы productnotes вывести в столбец «Результат» следующие
параметры: note_id, prod_id, note_date. Между этими параметрами должен
стоять символ «/». Решить двумя способами.
 */

select note_id || '/' || prod_id || '/' || note_date as "результат" 
from productnotes;


select concat(note_id, '/', prod_id, '/', note_date) as "результат" 
from productnotes;

/*
 * 63.Из таблицы orderitems в столбец «Инфо» вывести следующую информацию:
номер заказа, код продукта, количество. Информацию вывести в следующем
формате: «Код заказа: 20005, код продукта: TNT2, количество: 5». В столбец
«Стоимость» вывести данные в целочисленном формате. Решить двумя
способами.
 */
select 
    'код заказа: ' || order_num || ', код продукта: ' || prod_id || ', количество: ' || quantity as "инфо",
    (quantity * item_price)::integer as "стоимость"
from orderitems;


select 
    concat('код заказа: ', order_num, ', код продукта: ', prod_id, ', количество: ', quantity) as "инфо",
    (quantity * item_price)::integer as "стоимость"
from orderitems;

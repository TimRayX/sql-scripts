/*
 * 1. Найти среднюю цену на все товары в таблице Products и округлить
значение до двух символов после запятой.
 */
select
round(avg(prod_price),2)
from products;

/*
2. Найти среднюю цену на все товары, предлагаемыми поставщиком с
идентификатором 1003(или идентификатор из своей таблицы) в таблице
Products. Полученный столбец назвать «Средняя стоимость»*/

select
avg(prod_price) as "Средняя стоимость"
from products
where vend_id =1003;

/*3. Найти общее количество клиентов в таблице customers. Результату
присвоить наименование «Количество клиентов»*/

select 
count(*) as "Количество клиентов"
from customers;

/*4. Найти общее количество клиентов в таблице customers, у которых есть
email. Результату присвоить наименование «Количество клиентов»*/

select 
count(cust_email ) as "Количество клиентов"
from customers
where cust_email is not null;

/*5. Найти наибольшее значение в столбце prod_price. Результату присвоить
наименование «Максимальная цена»*/

select
max(prod_price) as "Максимальная цена"
from products;

/*6. Найти наименьшее значение в столбце prod_price. Результату присвоить
наименование «Минимальная цена»*/

select
min(prod_price) as "Минимальная цена"
from products;

/*7. Найти общее количество заказанных товаров (т.е. сумму значений в столбце
quantity) в таблице orderitems по заказу 20005 (или идентификатор из своей
таблицы). Результату присвоить наименование «Общее количество»*/

select
sum(quantity) as "Общее количество"
from orderitems
where order_num = 20005;


/*8. Найти общую стоимость заказанных товаров в таблице orderitems по заказу
20005 (или идентификатор из своей таблицы). Результату присвоить
наименование «Стоимость»*/

select
sum(quantity * item_price) as "Стоимость"
from orderitems
where order_num = 20005;

/*9. Найти среднюю цену на все товары (учитывать только отличающиеся
цены), предлагаемыми поставщиком с идентификатором 1003(или
идентификатор из своей таблицы) в таблице Products. Полученный столбец
назвать «Средняя стоимость»*/

select
avg(distinct(prod_price)) as "Средняя стоимость"
from products
where vend_id =1003;

/*10.Найти среднюю цену на все товары, наибольшее значение цены,
наименьшее значение цены, количество строк в таблице Products.
Полученный результат назвать соответственно «Средняя стоимость»,
«Максимальная цена», «Минимальная цена», «Общее количество»*/

select
avg(prod_price) as "Средняя стоимость",
max(prod_price) as "Максимальная цена",
min(prod_price) as "Минимальная цена",
count(prod_price) as "Общее количество"
from products;


-- ЧАСТЬ 2

/*11.Осуществить выборку поставщиков и указать количество товаров у каждого
из них из таблицы products. Группировка осуществляется по поставщикам
(vend_id).*/

select
vend_id, 
count(vend_id) AS "Количество товаров"
from products
group by vend_id;

/*12.Осуществить выборку клиентов и указать количество заказов у каждого из
них из таблицы orders, если количество заказов больше или равно 2.
Группировка осуществляется по клиентам (cust_id).*/

select
cust_id, 
count(cust_id) as "Количество заказов"
from orders
group by cust_id
having count(cust_id)>=2;

/*13.Осуществить выборку всех поставщиков и указать количество товаров у
каждого из них из таблицы products, если количество товаров больше 2.
Группировка осуществляется по поставщикам (vend_id).*/

select
vend_id, 
count(vend_id) AS "Количество товаров"
from products
group by vend_id
having count(vend_id)>2;

/*14.Осуществить выборку всех поставщиков и указать количество товаров у
каждого из них из таблицы products, если количество товаров больше или
равно 2 по цене 10 и выше. Группировка осуществляется по поставщикам
(vend_id).*/

select
vend_id, 
count(vend_id) AS "Количество товаров"
from products
where prod_price >=10
group by vend_id
having count(vend_id)>=2;

/*15.Осуществить выборку номера заказа и указать общую стоимость заказов,
если она больше или равна 50, из таблицы orderitems. */

select
order_num,
sum(quantity * item_price) as "Общая стоимость"
from orderitems
group by order_num
having sum(quantity * item_price) >= 50;

/*16.Осуществить выборку номера заказа, указать общую стоимость заказов,
указать общее количество товаров, входящих в заказ из таблицы orderitems. */

select
order_num,
sum(quantity * item_price) as "Общая стоимость",
sum(quantity) as "Общее количиство товаров"
from orderitems
group by order_num;


/*17.Осуществить выборку номера заказа и указать общую стоимость заказов,
если она больше или равна 35, из таблицы orderitems. Итоговой сумме
присвоить наименование ordertotal. Отсортируйте полученный результат по
итоговой сумме.*/

select
order_num,
sum(quantity * item_price) as ordertotal
from orderitems
group by order_num
having sum(quantity * item_price) >= 35
order by ordertotal;

/*18.Осуществить выборку номера заказа, указать минимальную стоимость
товара в заказе из таблицы orderitems. */

select
order_num,
min(item_price) as "Минимальная стоимость"
from orderitems
group by order_num;

/*19.Осуществить выборку номера заказа, указать максимальную стоимость
товара в заказе из таблицы orderitems. */

select
order_num,
max(item_price) as "Максимальная стоимость"
from orderitems
group by order_num;

/*20.Осуществить выборку номера заказа, указать среднюю цену товара в заказе
из таблицы orderitems.*/

select
order_num,
avg(item_price) as "Cредняя стоимость"
from orderitems
group by order_num;

/*21.Осуществить выборку номера заказа, указать среднюю цену товара в
заказе, сумму и количество товаров в заказе из таблицы orderitems.*/


select
order_num,
avg(item_price) as "Cредняя стоимость",
sum (quantity * item_price) as "Сумма товаров",
sum (quantity) as "Количество товаров"
from orderitems
group by order_num;

/*22.Осуществить выборку номера заказа, указать минимальную, максимальную
и среднюю стоимость товара в заказе из таблицы orderitems.*/

select
order_num,
min(item_price) as "Минимальная стоимость",
max(item_price) as "Максимальная стоимость",
avg(item_price) as "Cредняя стоимость"
from orderitems
group by order_num;

/*23.Осуществить выборку номера заказа, вычислить суммарную стоимость
товаров, а также вычислить налог на добавленную стоимость для
полученных сумм (имя столбца НДС ) , который включен в стоимость и
составляет k = 18%, а также стоимость заказа (Стоимость_без_НДС) без
него. Значения округлить до двух знаков после запятой. Формулы для 
вычисления:
НДС=(количество*цену*0,18)/1,18
Стоимость_без_НДС = Общая_стоимость – НДС*/


select
    order_num,
    round(sum(quantity * item_price), 2) as "Общая_стоимость",
    round(sum((quantity * item_price * 0.18) / 1.18), 2) as "НДС",
    round(sum(quantity * item_price) - sum((quantity * item_price * 0.18) / 1.18), 2) AS "Стоимость_без_НДС"
from orderitems
group by order_num;

/*24.Вычислить общее количество товаров, заказанных клиентами из таблицы
orderitems*/

select
    sum(quantity) as "Общее количество товаров"
from orderitems;

-- 25.Вычислить общее количество записей в таблице products

select
    count(*) as "общее количество записей"
from products;

/*26.Осуществить выборку номера заказа, указать общую стоимость заказа,
минимальную, максимальную и среднюю стоимость товара в заказе из
таблицы orderitems, если общая стоимость заказа > 50*/

select
    order_num,
    sum(quantity * item_price) as "Общая стоимость",
    min(item_price) as "Минимальная стоимость",
    max(item_price) as "Максимальная стоимость",
    AVG(item_price) as "Средняя стоимость"
from orderitems
group by order_num
having sum(quantity * item_price) > 50;

/*27.Осуществить выборку номера заказа, указать минимальную, максимальную
и среднюю стоимость товара в заказе из таблицы orderitems, если стоимость
товаров в заказе > 6*/

select
    order_num,
    min(item_price) as "Минимальная стоимость",
    max(item_price) as "Максимальная стоимость",
    avg(item_price) as "Средняя стоимость"
from  orderitems
where item_price > 6
group by order_num;

/*28.Осуществить выборку номера заказа, указать минимальную, максимальную
и среднюю стоимость товара в заказе из таблицы orderitems, если стоимость
товаров в заказе > 50 и prod_id не является “FB”*/

select
    order_num,
    min(item_price) as "Минимальная стоимость",
    max(item_price) as "Максимальная стоимость",
    avg(item_price) as "Средняя стоимость"
from orderitems
where prod_id != 'FB'
group by order_num
having sum(quantity * item_price) > 50;

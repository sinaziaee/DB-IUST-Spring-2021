/*
The GROUP BY clause allows you to arrange the rows of a query in groups. 
The groups are determined by the columns that you specify in the GROUP BY clause.
SELECT
    select_list
FROM
    table_name
GROUP BY
    column_name1,
    column_name2 ,...;
*/
/*Select * from sales.orders;*/
/*
SELECT
    customer_id,
    YEAR (order_date) order_year
FROM
    sales.orders
WHERE
    customer_id IN (1, 2)
GROUP BY
    customer_id,
    YEAR (order_date)
*/
/*
Functionally speaking, the GROUP BY clause in the above query produced the same result as 
the following query that uses the DISTINCT clause:
*/
/*
SELECT DISTINCT
    customer_id,
    YEAR (order_date) order_year
FROM
    sales.orders
WHERE
    customer_id IN (1, 2)
*/
/*
In practice, the GROUP BY clause is often used with aggregate functions for generating summary reports.

An aggregate function performs a calculation on a group and returns a unique value per group. 
For example, COUNT() returns the number of rows in each group. 
Other commonly used aggregate functions are SUM(), AVG() (average), MIN() (minimum), MAX() (maximum).

The GROUP BY clause arranges rows into groups and an aggregate function returns the summary 
(count, min, max, average, sum, etc.,) for each group.
*/
/*
SELECT
    YEAR (order_date) order_year,
    COUNT (order_id) order_placed
FROM
    sales.orders
GROUP BY
    YEAR (order_date);
 */
 /*
SELECT
	customer_id,
    YEAR (order_date) order_year,
    COUNT (order_id) order_placed
FROM
    sales.orders
WHERE customer_id IN (1, 2)
GROUP BY
	customer_id,
    YEAR (order_date);
	*/
/* 
more examples:
The following query returns the number of customers in every city:
*/
/*
SELECT
    city,
    count (customer_id) customer_count
FROM
    sales.customers
GROUP BY
    city
ORDER BY
    city;
*/

/* select city with the most number of customers*/

/* select city with highest number of customers*/
/*
select city , count(customer_id) from
	sales.customers
	group by city 
	having count(customer_id) = (
SELECT max(customer_count) co
	from (
	SELECT
		city,
		count (customer_id) customer_count
	FROM
		sales.customers
	GROUP BY
		city
	)as temp);
*/



/*
The following query uses the SUM() function to get the net value of every order:
*/
/*
Select * from sales.order_items;

SELECT
    order_id,
    SUM (
        quantity * list_price * (1 - discount)
    ) net_value
FROM
    sales.order_items
GROUP BY
    order_id;
*/


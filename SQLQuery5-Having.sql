/*
The HAVING clause is often used with the GROUP BY clause to filter groups based on a specified list of
conditions. The following illustrates the HAVING clause syntax:

SELECT
    select_list
FROM
    table_name
GROUP BY
    group_list
HAVING
    conditions;

In this syntax, the GROUP BY clause summarizes the rows into groups and the HAVING clause
applies one or more conditions to these groups. Only groups that make the conditions evaluate
to TRUE are included in the result. In other words, the groups for which the condition evaluates
to  FALSE or UNKNOWN are filtered out.
*/
/* The following statement uses the HAVING clause to find the customers 
who placed at least two orders per year:
*/
SELECT
    customer_id,
    YEAR (order_date),
    COUNT (order_id) order_count
FROM
    sales.orders
GROUP BY
    customer_id,
    YEAR (order_date)
HAVING
    COUNT (order_id) >= 2
ORDER BY
    customer_id;

/* The following statement finds the sales orders whose net values are greater than 20,000:*/


SELECT
    order_id,
    SUM (
        quantity * list_price * (1 - discount)
    ) net_value
FROM
    sales.order_items
GROUP BY
    order_id
HAVING
    SUM (
        quantity * list_price * (1 - discount)
    ) > 20000
ORDER BY
    net_value;

/* The following statement first finds the maximum and minimum list prices in
each product category. Then, it filters out the category which has the maximum
list price greater than 4,000 or the minimum list price less than 500:*/

SELECT
    category_id,
    MAX (list_price) max_list_price,
    MIN (list_price) min_list_price
FROM
    production.products
GROUP BY
    category_id
HAVING
    MAX (list_price) > 4000 OR MIN (list_price) < 500;



/*
Creating new table "sales.sales_summary" for this explanation
*/
SELECT
    b.brand_name AS brand,
    c.category_name AS category,
    p.model_year,
    round(
        SUM (
            quantity * i.list_price * (1 - discount)
        ),
        0
    ) sales INTO sales.sales_summary
FROM
    sales.order_items i
INNER JOIN production.products p ON p.product_id = i.product_id
INNER JOIN production.brands b ON b.brand_id = p.brand_id
INNER JOIN production.categories c ON c.category_id = p.category_id
GROUP BY
    b.brand_name,
    c.category_name,
    p.model_year
ORDER BY
    b.brand_name,
    c.category_name,
    p.model_year;

Select * From sales.sales_summary;

/* By definition, a grouping set is a group of columns by which you group. 
Typically, a single query with an aggregate defines a single grouping set.
*/

/* For example, the following query defines a grouping set that includes brand and
category which is denoted as (brand, category). The query returns the sales amount
grouped by brand and category:
*/
SELECT
    brand,
    category,
    SUM (sales) sales
FROM
    sales.sales_summary
GROUP BY
    brand,
    category
ORDER BY
    brand,
    category;
/* The following query returns the sales amount by brand. It defines a grouping set (brand):*/
SELECT
    brand,
    SUM (sales) sales
FROM
    sales.sales_summary
GROUP BY
    brand
ORDER BY
    brand;
/* The following query returns the sales amount by category. It defines a grouping set (category):*/
SELECT
    category,
    SUM (sales) sales
FROM
    sales.sales_summary
GROUP BY
    category
ORDER BY
    category;

/* The following query defines an empty grouping set (). 
It returns the sales amount for all brands and categories. */

SELECT
    SUM (sales) sales
FROM
    sales.sales_summary;

/* The four queries above return four result sets with four grouping sets:
(brand, category)
(brand)
(category)
()
The GROUPING SETS defines multiple grouping sets in the same query. 
The following shows the general syntax of the GROUPING SETS:
SELECT
    column1,
    column2,
    aggregate_function (column3)
FROM
    table_name
GROUP BY
    GROUPING SETS (
        (column1, column2),
        (column1),
        (column2),
        ()
);
which makes four grouping sets
(column1,column2)
(column1)
(column2)
()
*/

SELECT
	brand,
	category,
	SUM (sales) sales
FROM
	sales.sales_summary
GROUP BY
	GROUPING SETS (
		(brand, category),
		(brand),
		(category),
		()
	)
ORDER BY
	brand,
	category;
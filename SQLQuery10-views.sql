/*
When you use the SELECT statement to query data from one or more tables, you get a result set.

For example, the following statement returns the product name, brand, and list price of all
products from the products and brands tables:

*/

SELECT
    product_name, 
    brand_name, 
    list_price
FROM
    production.products p
INNER JOIN production.brands b 
        ON b.brand_id = p.brand_id;
/*
Next time, if you want to get the same result set, you can save this query into a text file, open it, and execute it again.

SQL Server provides a better way to save this query in the database catalog through a view.

A view is a named query stored in the database catalog that allows you to refer to it later.

So the query above can be stored as a view using the CREATE VIEW statement as follows
*/

CREATE VIEW sales.product_info
AS
SELECT
    product_name, 
    brand_name, 
    list_price
FROM
    production.products p
INNER JOIN production.brands b 
        ON b.brand_id = p.brand_id;

/*
Later, you can reference to the view in the SELECT statement like a table as follows:
*/

SELECT * FROM sales.product_info;

/*
When receiving this query, SQL Server executes the following query:

SELECT 
    *
FROM (
    SELECT
        product_name, 
        brand_name, 
        list_price
    FROM
        production.products p
    INNER JOIN production.brands b 
        ON b.brand_id = p.brand_id;
);

*/

/*
	By definition, views do not store data except for indexed views.

A view may consist of columns from multiple tables using joins or just a subset of columns of a single table. 
This makes views useful for abstracting or hiding complex queries.
*/

/*

	MATERIALIZING VIEWS

	Materialized views are called " Indexed views " in sql server

	Regular SQL Server views are the saved queries that provide some benefits such as query simplicity, 
	business logic consistency, and security.
	However, they do not improve the underlying query performance

	Unlike regular views, indexed views are materialized views that stores data physically like a table hence may
	provide some the performance benefit if they are used appropriately.

	To create an indexed view, you use the following steps:

	- First, create a view that uses the WITH SCHEMABINDING option which binds the view to the 
	schema of the underlying tables.
	- Second, create a unique clustered index on the view. This materializes the view.

	Because of the WITH SCHEMABINDING option, if you want to change the structure of the underlying tables which affect the indexed view’s definition, you must drop the indexed view first before applying the changes.

In addition, SQL Server requires all object references in an indexed view to include the two-part naming
convention i.e., schema.object, and all referenced objects are in the same database.

When the data of the underlying tables changes, the data in the indexed view is also automatically updated. This causes a write overhead for the referenced tables. It means that when you write to the underlying table, SQL Server also has to write to the index of the view. Therefore, you should only create an indexed view against the tables that have in-frequent data updates.

*/

/* 
	The following statement creates an indexed view based on columns of the production.products,
	production.brands, and production.categories tables from the sample database:
*/

CREATE VIEW product_master
WITH SCHEMABINDING
AS 
SELECT
    product_id,
    product_name,
    model_year,
    list_price,
    brand_name,
    category_name
FROM
    production.products p
INNER JOIN production.brands b 
    ON b.brand_id = p.brand_id
INNER JOIN production.categories c 
    ON c.category_id = p.category_id;

/*
	Notice the option WITH SCHEMABINDING after the view name. The rest is the same as a regular view.
*/

/*
	Let’s add a unique clustered index to the view:

	A clustered index defines the order in which data is physically stored in a table. 
	Table data can be sorted in only way, therefore, there can be only one clustered index per table. 
	In SQL Server, the primary key constraint automatically creates a clustered index on that 
	particular column.

	A non-clustered index doesn’t sort the physical data inside the table. 
	In fact, a non-clustered index is stored at one place and table data is stored in another place. 
	This is similar to a textbook where the book content is located in one place and the index 
	is located in another. This allows for more than one non-clustered index per table.


	TO CREATE clustered indexes we can do this:

	CREATE CLUSTERED INDEX index_name
	ON schema_name.table_name (column_list);

	In this syntax:

- First, specify the name of the clustered index after the CREATE CLUSTERED INDEX clause.
- Second, specify the schema and table name on which you want to create the index.
- Third, list one or more columns included in the index.

*/

CREATE UNIQUE CLUSTERED INDEX 
    ucidx_product_id 
ON dbo.product_master(product_id);

/*
	You can also add a non-clustered index on the product_name column of the view:

	CREATE NONCLUSTERED INDEX 
    ucidx_product_name
	ON production.product_master(product_name);
*/

/*
	Instead of reading data from three tables, SQL Server now reads data directly from the 
	materialized view product_master
*/

Select * from dbo.product_master;
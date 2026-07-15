



	CREATE TABLE superstore (
category VARCHAR(100),
city VARCHAR(100),
country VARCHAR(100),
customer_id VARCHAR(30),
customer_name VARCHAR(100),
discount NUMERIC(5,2),
market VARCHAR(50),
record_count INT,
order_date DATE,
order_id VARCHAR(30),
order_priority VARCHAR(30),
product_id VARCHAR(50),
product_name VARCHAR(255),
profit NUMERIC(12,4),
quantity INT,
region VARCHAR(50),
row_id INT,
sales NUMERIC(12,2),
segment VARCHAR(50),
ship_date DATE,
ship_mode VARCHAR(50),
shipping_cost NUMERIC(12,2),
state VARCHAR(100),
sub_category VARCHAR(100),
year INT,
market2 VARCHAR(100),
weeknum INT;




    select * from superstore;

        select count(*) from superstore;

   select distinct(year) from superstore;

   
	    SELECT
MIN(year) AS first_year,
MAX(year) AS last_year,
COUNT(DISTINCT year) AS total_years
FROM superstore;


   SELECT
    year,
         SUM(sales) AS total_sales,
       SUM(profit) AS total_profit,
      SUM(discount) AS total_discount,
     COUNT(order_id) AS total_orders
         FROM superstore
           GROUP BY 1
             ORDER BY 1;

      
     SELECT
    category,
    SUM(sales) AS total_sales,
    SUM(profit) AS total_profit
   FROM superstore
     GROUP BY 1
       ORDER BY 3 DESC;
  

    SELECT
    sub_category,
    SUM(sales) AS total_sales,
    SUM(profit) AS total_profit
FROM superstore
WHERE category = 'Furniture'
GROUP BY 1
ORDER BY 3;

    
   
    SELECT
    product_name,
    COUNT(*) AS orders,
    ROUND(AVG(discount),2) AS avg_discount,
    SUM(sales) AS total_sales,
    SUM(profit) AS total_profit
FROM superstore
WHERE sub_category = 'Tables'
GROUP BY 1
ORDER BY total_profit;



   SELECT
    discount,
    COUNT(*) AS orders,
    SUM(sales) AS total_sales,
    SUM(profit) AS total_profit
FROM superstore
WHERE sub_category = 'Tables'
GROUP BY discount
ORDER BY discount;


     
    SELECT
CASE
    WHEN discount <= 0.20 THEN 'Low Discount'
    ELSE 'High Discount'
END AS discount_group,
COUNT(*) AS orders,
SUM(quantity) AS units_sold,
SUM(sales) AS sales,
SUM(profit) AS profit
FROM superstore
  WHERE sub_category = 'Tables'
GROUP BY discount_group;



    SELECT
    region,
    COUNT(*) AS orders,
    SUM(quantity) AS units_sold,
    SUM(sales) AS total_sales,
    SUM(profit) AS total_profit,
    ROUND(AVG(discount),2) AS avg_discount,
	CASE
    WHEN discount <= 0.20 THEN 'Low Discount'
    ELSE 'High Discount'
END AS discount_group
FROM superstore
WHERE sub_category = 'Tables'
GROUP BY 1,7
ORDER BY total_profit;




          SELECT
    segment,
    COUNT(*) AS orders,
    SUM(sales) AS total_sales,
    SUM(profit) AS total_profit,
    ROUND(AVG(discount),2) AS avg_discount
FROM superstore
WHERE sub_category = 'Tables'
GROUP BY segment
ORDER BY total_profit; 


    
              SELECT
    region,
    segment,
    ROUND(AVG(discount),2) AS avg_discount,
    SUM(profit) AS total_profit
FROM superstore
  WHERE sub_category='Tables'
GROUP BY region, segment
   ORDER BY total_profit;



    SELECT
    product_name,
    ROUND(AVG(discount),2) AS avg_discount,
    SUM(profit) AS total_profit,
    DENSE_RANK() OVER (
        ORDER BY SUM(profit)
    ) AS loss_rank
FROM superstore
WHERE sub_category = 'Tables'
GROUP BY product_name
ORDER BY loss_rank;




         SELECT
    product_name,
    ROUND(AVG(discount),2) AS avg_discount,
    SUM(profit) AS total_profit,
    CASE
        WHEN AVG(discount) >= 0.40
             AND SUM(profit) < 0
        THEN 'High Risk'
       WHEN AVG(discount) >= 0.20
             AND SUM(profit) < 0
        THEN 'Medium Risk'
 ELSE 'Low Risk'
    END AS risk_level
FROM superstore
WHERE sub_category = 'Tables'
GROUP BY product_name
ORDER BY total_profit;




	 SELECT
    CASE
        WHEN discount <= 0.20 THEN 'Low Discount'
        ELSE 'High Discount'
    END AS discount_group,
       COUNT(DISTINCT order_id) AS orders
          FROM superstore
             WHERE sub_category='Tables'
    GROUP BY discount_group;



    SELECT
    CASE
        WHEN discount <=0.20 THEN 'Low Discount'
        ELSE 'High Discount'
    END AS discount_group,
     SUM(quantity) AS units_sold
FROM superstore
WHERE sub_category='Tables'
GROUP BY discount_group;
	  

	     SELECT
	CASE
        WHEN discount <=0.20 THEN 'Low Discount'
        ELSE 'High Discount'
    END AS discount_group,
   SUM(sales) total_sales
FROM superstore
WHERE sub_category='Tables'
GROUP BY 1
ORDER BY 1;



	   SELECT
    CASE
        WHEN discount <=0.20 THEN 'Low Discount'
        ELSE 'High Discount'
    END AS discount_group,
   SUM(profit) total_profit
FROM superstore
WHERE sub_category='Tables'
GROUP BY 1
ORDER BY 1;






	  SELECT
CASE
        WHEN discount <=0.20 THEN 'Low Discount'
        ELSE 'High Discount'
    END AS discount_group,
ROUND(
SUM(profit)/SUM(sales)*100,
2
) AS profit_margin
FROM superstore
WHERE sub_category='Tables'
GROUP BY 1
ORDER BY 1;
	 
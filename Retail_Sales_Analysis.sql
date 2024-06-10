/*
-- AGE GROUP NAME WITH ITS AGE RANGE
SELECT 
    age,
    CASE
	    WHEN age BETWEEN 0 and 2  then 'Babies '
        WHEN age BETWEEN 3 AND 16 THEN 'Children'
        WHEN age BETWEEN 17 AND 30 THEN 'Young Aduls'
        WHEN age BETWEEN 31 AND 45 THEN 'Middle-aged Adults'
        WHEN age BETWEEN 46 AND 80 THEN 'Old Adults'
        
    END AS AgeGroup
	
FROM 
    retail_sales; */




/*
 -- THE AMOUNT AND QUANTITY OF EACH DAY'S PURCHASED PRODUCT
SELECT
    date_sales,
    SUM(total_amount) AS DailySales,
    COUNT(*) AS NumberOfTransactions
FROM 
    retail_sales
GROUP BY 
    date_sales
ORDER BY 
    date_sales asc;  */


/*
-- THE TOTAL FOR EACH MONTH AND YEAR
SELECT 
    EXTRACT(YEAR FROM date_sales) AS Year_sales, 
    EXTRACT(MONTH FROM date_sales) AS Month_sales, 
    SUM(total_amount) AS TotalEarned
FROM 
    retail_sales
GROUP BY Year_sales,
	  Month_sales
ORDER BY 
      Year_sales,
	  Month_sales  */


/*

SELECT 
    EXTRACT(YEAR FROM date_sales) AS Year_sales, 
    TO_CHAR(date_sales, 'Month') AS Month_sales, 
    SUM(total_amount) AS TotalEarned
FROM 
    retail_sales
GROUP BY 
    Year_sales,
    Month_sales
ORDER BY 
    Year_sales,
    MIN(date_sales);
-- THE TOTAL FOR EACH QUARTER AND YEAR
SELECT 
    EXTRACT(YEAR FROM date_sales) AS Year_sales, 
    CEIL(EXTRACT(MONTH FROM date_sales) / 3.0) AS Quarter_sales, 
    SUM(total_amount) AS TotalEarned
FROM 
    retail_sales
GROUP BY 
    Year_sales,
    Quarter_sales
ORDER BY 
    Year_sales,
    Quarter_sales; */

 

/*
--NUMBER OF GIRLS AND BOYS BY AGE
SELECT 
    age, COUNT(*) as total_customer,
    SUM(CASE WHEN gender = 'Female' THEN 1 ELSE 0 END) AS female_count,
    SUM(CASE WHEN gender = 'Male' THEN 1 ELSE 0 END) AS male_count
FROM 
    retail_sales
GROUP BY 
    age
ORDER BY 
    total_customer desc
*/


/*
-- EACH CATEGORY WAS USED BY AGE
SELECT 
    age,
    SUM(CASE WHEN product_category = 'Electronics' THEN quantity ELSE 0 END) AS Electronics_quantity,
    SUM(CASE WHEN product_category = 'Clothing' THEN quantity ELSE 0 END) AS Clothing_quantity,
    SUM(CASE WHEN product_category = 'Beauty' THEN quantity ELSE 0 END) AS Beauty_quantity,
    SUM(quantity) AS total_quantity
FROM 
    retail_sales
GROUP BY 
    age
ORDER BY 
    total_quantity desc  */




/*
-- CATEGORY BY QUANTITY ARE USED
SELECT 
    product_category, 
    SUM(quantity) AS total_amount
FROM 
    retail_sales
GROUP BY 
    product_category;  */

/*
-- SAME WITH COLUMNS
SELECT 
    SUM(CASE WHEN product_category = 'Beauty' THEN quantity ELSE 0 END) AS Beauty,
    SUM(CASE WHEN product_category = 'Clothing' THEN quantity ELSE 0 END) AS Clothing,
    SUM(CASE WHEN product_category = 'Electronics' THEN quantity ELSE 0 END) AS Electronics,
    SUM(quantity) AS GrandTotal
FROM 
    retail_sales;
*/

/*
-- EVERY AGE GROUP USING THE CATEGORY
SELECT 
        CASE
        WHEN age BETWEEN 0 and 2  then 'Babies '
        WHEN age BETWEEN 3 AND 16 THEN 'Children'
        WHEN age BETWEEN 17 AND 30 THEN 'Young Aduls'
        WHEN age BETWEEN 31 AND 45 THEN 'Middle-aged Adults'
        WHEN age BETWEEN 46 AND 80 THEN 'Old Adults'
        END AS AgeGroup,
        SUM(CASE WHEN product_category = 'Beauty' THEN quantity ELSE 0 END) AS Beauty,
        SUM(CASE WHEN product_category = 'Clothing' THEN quantity ELSE 0 END) AS Clothing,
        SUM(CASE WHEN product_category = 'Electronics' THEN quantity ELSE 0 END) AS Electronics,
        SUM(quantity) AS GrandTotal
    FROM 
        retail_sales
    GROUP BY agegroup   */




/*

-- ADD A NEW LINE TO CALCULATE THE GRANDTOTAL
SELECT * FROM (
    -- Query to get the sum of quantities by age group and product category
    SELECT 
        CASE
            WHEN age < 17 THEN '0-17'
            WHEN age BETWEEN 18 AND 27 THEN '18-27'
            WHEN age BETWEEN 28 AND 37 THEN '28-37'
            WHEN age BETWEEN 38 AND 47 THEN '38-47'
            WHEN age BETWEEN 48 AND 55 THEN '48-55'
            WHEN age BETWEEN 56 AND 67 THEN '56-67'
            ELSE '67+'
        END AS AgeGroup,
        SUM(CASE WHEN product_category = 'Beauty' THEN quantity ELSE 0 END) AS Beauty,
        SUM(CASE WHEN product_category = 'Clothing' THEN quantity ELSE 0 END) AS Clothing,
        SUM(CASE WHEN product_category = 'Electronics' THEN quantity ELSE 0 END) AS Electronics,
        SUM(quantity) AS GrandTotal
    FROM 
        retail_sales
    GROUP BY 
        CASE
            WHEN age < 17 THEN '0-17'
            WHEN age BETWEEN 18 AND 27 THEN '18-27'
            WHEN age BETWEEN 28 AND 37 THEN '28-37'
            WHEN age BETWEEN 38 AND 47 THEN '38-47'
            WHEN age BETWEEN 48 AND 55 THEN '48-55'
            WHEN age BETWEEN 56 AND 67 THEN '56-67'
            ELSE '67+'
        END

    UNION ALL

    -- Query to get the total sum of GrandTotal
    SELECT 
        'Grand Total' AS AgeGroup,
        SUM(CASE WHEN product_category = 'Beauty' THEN quantity ELSE 0 END) AS Beauty,
        SUM(CASE WHEN product_category = 'Clothing' THEN quantity ELSE 0 END) AS Clothing,
        SUM(CASE WHEN product_category = 'Electronics' THEN quantity ELSE 0 END) AS Electronics,
        SUM(quantity) AS GrandTotal
    FROM 
        retail_sales
) AS combined_results

ORDER BY 
    CASE 
        WHEN AgeGroup = 'Grand Total' THEN 2
        ELSE 1
    END,
    AgeGroup ASC;
*/



/*
-- BY DAYS OF THE WEEKDAY
SELECT 
    date_sales,
    INITCAP(TO_CHAR(date_sales, 'day')) AS DayOfWeek
FROM 
    retail_sales; */

/*
SELECT age, SUM(total_amount) AS TotalSpending
FROM retail_sales
GROUP BY age
ORDER BY TotalSpending DESC;

*/




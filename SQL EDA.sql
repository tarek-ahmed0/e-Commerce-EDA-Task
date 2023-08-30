-- Data Cleaning 
UPDATE 
	`depillow_odoo_sales_july`
SET 
	`Salesperson` = 'Undifined Name'
WHERE 
	`Salesperson` IS NULL OR `Salesperson` = '';


-- Statistical Analysis of "Old Price" Data, Uncovering Insights through Min, Average, and Max Metrics
SELECT 
	MIN(`Old Price Total`), AVG(`Old Price Total`), MAX(`Old Price Total`)
FROM 
	`depillow`.`depillow_odoo_sales_july`;


-- What is the Average and Highest value of the "Commission" achieved by sales? 
SELECT 
	AVG(`Total` - `Old Price Total`), MAX(`Total` - `Old Price Total`)
FROM 
	`depillow`.`depillow_odoo_sales_july`;


--  The Performance of Sales Person in achieving the Commission
SELECT 
    `Salesperson`,
    SUM(`Total` - `Old Price Total`) AS CommissionValue,
    ROUND((SUM(`Total` - `Old Price Total`) / (SELECT SUM(`Total` - `Old Price Total`) FROM `depillow`.`depillow_odoo_sales_july`) * 100), 2) AS CommissionPercentage
FROM 
    `depillow`.`depillow_odoo_sales_july`
GROUP BY 
    `Salesperson`;


-- Find "Total Orders Value" and "Total Commission Value" 
SELECT 
	SUM(`Old Price Total`), (SUM(`Total`) - SUM(`Old Price Total`))
FROM 
	`depillow`.`depillow_odoo_sales_july`;

    
-- Summary of Orders: Order Numbers, Order Values, Commissions and Total Value
SELECT 
	DISTINCT `Creation Date`, COUNT(`Creation Date`), ROUND(SUM(`Old Price Total`), 2), ROUND((SUM(`Total`) - SUM(`Old Price Total`)), 2) AS `Commission`, ROUND(SUM(`Total`), 2)
FROM 
	`depillow`.`depillow_odoo_sales_july`
GROUP BY 
	`Creation Date`
ORDER BY    
	`Creation Date` ASC;
    
    
-- Orders "Status" Details
SELECT 
	`Status`, COUNT(`Status`)
FROM
	`depillow`.`depillow_odoo_sales_july`
GROUP BY 
	`Status`;
    

-- Orders "Delievery Status"
SELECT 
	`Delivery Status`, COUNT(`Delivery Status`)
FROM
	`depillow`.`depillow_odoo_sales_july`
GROUP BY 
	`Delivery Status`;
    

-- Orders "Patially Delievey"
SELECT 
	`Partially Delivered`, COUNT(`Partially Delivered`)
FROM
	`depillow`.`depillow_odoo_sales_july`
GROUP BY 
	`Partially Delivered`;
    

-- Orders "Fully Delievey"
SELECT 
	`Fully Delivered`, COUNT(`Fully Delivered`)
FROM
	`depillow`.`depillow_odoo_sales_july`
GROUP BY 
	`Fully Delivered`;
    
    
-- Orders "Patially Paid"
SELECT 
	`Partially Paid`, COUNT(`Partially Paid`)
FROM
	`depillow`.`depillow_odoo_sales_july`
GROUP BY 
	`Partially Paid`;
    

-- Orders "Fully Paid"
SELECT 
	`Fully Delivered`, COUNT(`Fully Delivered`)
FROM
	`depillow`.`depillow_odoo_sales_july`
GROUP BY 
	`Fully Delivered`;
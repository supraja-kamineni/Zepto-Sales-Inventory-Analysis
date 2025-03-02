/*1.Sales Performance  */

/*Find the top 10 most expensive products based on MRP:*/

select * from zepto order by mrp desc limit 10;

/*Find the top 10 cheapest products after discount:*/

select * from zepto order by discountedSellingPrice asc limit 10;

/* Compare the MRP vs. discounted selling price to check average discount percentage applied:*/

select round(avg((mrp - discountedSellingPrice) / mrp * 100), 2) as avg_discount_percent from zepto;

# Zepto Sales & Inventory Analysis

### 📌 Overview

This project analyzes sales and inventory data from the Zepto dataset using SQL queries. The goal is to extract meaningful insights about product sales, stock levels, discount trends, and customer demand.

### 📂 Dataset Description

The dataset is sourced from Kaggle and contains product details, pricing, stock levels, and sales performance metrics, including:

name: Product name

mrp: Maximum Retail Price

discountedSellingPrice: Price after discount

discountPercent: Discount percentage

availableQuantity: Stock availability

outOfStock: Stock status (TRUE/FALSE)

weightInGms: Product weight

quantity: Quantity sold

##### 🔗  <a href="https://github.com/supraja-kamineni/Zepto-Sales-Inventory-Analysis/blob/main/Zepto.csv">Dataset (CSV File):</a>

##### <a href="https://www.kaggle.com/datasets/devshahoff/zepto-dataset">Kaggle Link(Dataset)</a>

### 📊 SQL Queries & Insights

#### 1️⃣ Sales Performance

Find the top 10 most expensive products based on MRP:

```
SELECT * FROM zepto ORDER BY mrp DESC LIMIT 10;
```
Find the top 10 cheapest products after discount:
```
SELECT * FROM zepto ORDER BY discountedSellingPrice ASC LIMIT 10;
```
Compare MRP vs. discounted selling price to check average discount percentage applied:
```
SELECT ROUND(AVG((mrp - discountedSellingPrice) / mrp * 100), 2) AS avg_discount_percent FROM zepto;
```

#### 2️⃣ Stock & Inventory Analysis

Find products that are out of stock:

```
SELECT * FROM zepto WHERE outOfStock = TRUE;
```

Find the total number of products currently in stock:

```
SELECT COUNT(*) AS total_in_stock FROM zepto WHERE outOfStock = FALSE;
```

Find the products with the lowest available quantity (<5 units available):

```
SELECT * FROM zepto WHERE availableQuantity < 5 ORDER BY availableQuantity ASC;
```

Find the top 5 products with the highest available quantity:

```
SELECT * FROM zepto ORDER BY availableQuantity DESC LIMIT 5;
```

#### 3️⃣ Popular Products & Customer Demand

Find the most frequently purchased products (sorted by quantity sold):

```
SELECT name, SUM(quantity) AS total_sold FROM zepto GROUP BY name ORDER BY total_sold DESC LIMIT 10;
```

Find low-demand products:

````
SELECT name, SUM(quantity) AS total_sold FROM zepto GROUP BY name ORDER BY total_sold ASC LIMIT 10;
````

Find the most popular weight category based on sales:

```
SELECT weightInGms, SUM(quantity) AS total_sold FROM zepto GROUP BY weightInGms ORDER BY total_sold DESC LIMIT 5;
```

#### 4️⃣ Discount & Promotional Analysis

Find products with the highest discount percentage:

````
SELECT * FROM zepto ORDER BY discountPercent DESC LIMIT 10;
````

Find the number of products with a discount greater than 20%:

```
SELECT COUNT(*) FROM zepto WHERE discountPercent > 20;
````

Find how many products have no discount:

```
SELECT COUNT(*) FROM zepto WHERE discountPercent = 0;
````

#### 5️⃣ Category & Segment Analysis

Find the average MRP for different weight categories:

```
SELECT weightInGms, ROUND(AVG(mrp),2) AS avg_mrp FROM zepto GROUP BY weightInGms ORDER BY avg_mrp DESC;
```

Find the most expensive vs. cheapest weight category based on average discounted price:

```
SELECT weightInGms, ROUND(AVG(discountedSellingPrice),2) AS avg_price FROM zepto GROUP BY weightInGms ORDER BY avg_price DESC LIMIT 1;

SELECT weightInGms, ROUND(AVG(discountedSellingPrice),2) AS avg_price FROM zepto GROUP BY weightInGms ORDER BY avg_price ASC LIMIT 1;
```

### 📌 How to Use

Clone this repository.

Load the dataset into your SQL database.

Run the queries to explore insights.

Modify or extend the queries as needed for deeper analysis.

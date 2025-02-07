Customer Segmentation and Behavior Analysis

Overview

This SQL project focuses on analyzing customer segmentation and behavior by examining key factors such as revenue contribution, order frequency, customer lifetime value (CLV), retention vs. churn trends, and product popularity. The dataset includes customer demographics, purchase history, order details, product information, and customer engagement data.

Database Schema

The project consists of the following five tables:

Customers - Stores customer demographics and segmentation.

CustomerID (Primary Key)

Name

Age

Gender

SignupDate

CustomerSegment

Orders - Contains purchase transactions.

OrderID (Primary Key)

CustomerID (Foreign Key references Customers)

OrderDate

TotalAmount

OrderDetails - Holds details of each order item.

OrderDetailID (Primary Key)

OrderID (Foreign Key references Orders)

ProductID (Foreign Key references Products)

Quantity

Price

Products - Stores product catalog information.

ProductID (Primary Key)

ProductName

Category

Price

CustomerEngagement - Tracks customer activity and purchase behavior.

EngagementID (Primary Key)

CustomerID (Foreign Key references Customers)

LastPurchaseDate

TotalOrders

TotalSpent

LastEngagementDate

SQL Queries

The following queries provide valuable insights into customer behavior:

Top 10% of customers contributing to 80% of revenue

Average order value per customer segment

Customer Lifetime Value (CLV) calculation

Order frequency per customer segment

Retention vs. churn trends (Active vs. inactive customers)

Total revenue per product category

Monthly revenue trend analysis

Most popular products by sales volume

Customer segments with highest retention rates

Identifying high-value customers with high engagement

Average customer age per segment

Usage Instructions

Execute the SQL scripts to create and populate the database tables.

Run the queries to analyze customer segmentation and behavior.

Use the insights for business decisions such as marketing strategies, customer engagement, and sales optimization.

This SQL-based approach helps in better understanding customer behavior and optimizing business strategies for improved retention and revenue generation.

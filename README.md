# Restaurant Orders: Exploratory Data Analysis with SQL

An exploratory data analysis (EDA) of a restaurant ordering database, done entirely in SQL. The project answers common business questions about orders, customers, menu items, restaurants, cuisines, cities, revenue and delivery times.

## Objective

Explore the data to find out:

- What sells the most (items, cuisines)
- Which restaurants and cities generate the most revenue and orders
- Who the most valuable and most frequent customers are
- How long deliveries take

## Tools

- MySQL 8.0
- MySQL Workbench

## Dataset

The database contains five tables:

| Table | Key columns |
|---|---|
| `customers_medium` | `customer_id`, `city`, `signup_date` |
| `restaurants` | `restaurant_id`, `cuisine`, `rating`, `city` |
| `menu_items` | `item_id`, `restaurant_id`, `price` |
| `orders_medium` | `order_id`, `customer_id`, `restaurant_id`, `order_time`, `delivery_time`, `status` |
| `order_items` | `order_id`, `item_id`, `quantity`, `price` |

Source: Kaggle

## SQL Skills Used

- Aggregation: `count`, `sum`, `avg`, `round`
- Grouping and sorting: `group by`, `order by`, `limit`
- Multi-table joins
- Common table expressions (CTEs) for two-step calculations
- Date-time arithmetic with `timestampdiff`

## How to Run

1. Create the database and load the five tables into MySQL.
2. Open the `Restaurant_db.sql` file in MySQL Workbench.
3. Run each query and review the results.

## Author

_Moka Victoria_ 

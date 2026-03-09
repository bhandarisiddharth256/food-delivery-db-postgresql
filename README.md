# 🍔 Food Delivery Database (PostgreSQL)

Production-style **PostgreSQL database schema design** for a food delivery platform inspired by systems like **Swiggy / Zomato**.

This project demonstrates **real-world database design principles**, including relational modeling, indexing, constraints, and scalable schema architecture used in backend systems.

---

# 🚀 Project Goals

The goal of this project is to design a **production-ready relational database** that supports core operations of a food delivery platform:

* User account management
* Restaurant and menu management
* Order processing
* Delivery partner logistics
* Payments
* Reviews and ratings
* Coupon-based discounts

The schema is designed with **performance, scalability, and data integrity** in mind.

---

# 🧱 Database Architecture

The system models the following major domains:

### 👤 Users

Customers who place orders.

### 🏬 Restaurants

Restaurants registered on the platform.

### 🍕 Menu Items

Food items offered by restaurants.

### 📦 Orders

Orders placed by users containing multiple food items.

### 🚚 Deliveries

Delivery partner assignment and delivery tracking.

### 💳 Payments

Payment records for each order.

### ⭐ Reviews

User ratings and feedback for restaurants.

### 🎟 Coupons

Discount codes applied during checkout.

---

# 🗄️ Database Schema

The database consists of **14 relational tables**.

| Table                       | Description                                              |
| --------------------------- | -------------------------------------------------------- |
| users                       | Stores user accounts                                     |
| addresses                   | User delivery addresses                                  |
| restaurants                 | Restaurant information                                   |
| restaurant_categories       | Food categories (Pizza, Chinese, etc.)                   |
| restaurant_category_mapping | Many-to-many relation between restaurants and categories |
| menu_items                  | Food items offered by restaurants                        |
| orders                      | Orders placed by users                                   |
| order_items                 | Items within each order                                  |
| payments                    | Payment transactions                                     |
| order_status_history        | Order lifecycle tracking                                 |
| delivery_partners           | Delivery agents                                          |
| deliveries                  | Delivery assignment and tracking                         |
| reviews                     | Customer feedback and ratings                            |
| coupons                     | Discount coupons                                         |

---

# ⚡ Performance Optimization

Indexes are added on frequently queried columns to improve performance.

Example indexed fields:

```
orders(user_id)
orders(restaurant_id)
menu_items(restaurant_id)
reviews(restaurant_id)
deliveries(delivery_partner_id)
```

These indexes optimize common operations like:

* fetching user order history
* loading restaurant menus
* retrieving restaurant reviews
* dispatching delivery partners

---

# 🧪 Running the Database Locally

Create a PostgreSQL database and execute the SQL files.

```bash
createdb food_delivery
```

Run the schema:

```bash
psql -d food_delivery -f database/enums.sql
psql -d food_delivery -f database/schema.sql
psql -d food_delivery -f database/indexes.sql
psql -d food_delivery -f database/seed.sql
```

Now the database will contain **sample users, restaurants, menus, and orders**.

---

# 📈 Example Queries

### Get all orders of a user

```sql
SELECT *
FROM orders
WHERE user_id = 1;
```

### Get menu of a restaurant

```sql
SELECT *
FROM menu_items
WHERE restaurant_id = 1;
```

### Top rated restaurants

```sql
SELECT name, rating
FROM restaurants
ORDER BY rating DESC;
```

---

# 🛠 Technologies Used

* **PostgreSQL**
* **Relational Database Design**
* **SQL**
* **Index Optimization**
* **Schema Modeling**

---

# 👨‍💻 Author

**Siddharth Bhandari**

Backend engineering enthusiast
---

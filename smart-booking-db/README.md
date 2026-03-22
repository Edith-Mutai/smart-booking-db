Smart Property Booking & Analytics System (PostgreSQL)

Project Overview

This project is a PostgreSQL-based backend database system designed for a property booking platform (similar to Airbnb).

It manages:

* Users (guests, hosts, admins)
* Properties
* Bookings
* Payments
* Reviews

Beyond basic CRUD operations, the system includes advanced analytics, triggers, and performance-focused SQL queries to simulate real-world business intelligence.


Objectives

* Design a relational database schema with proper normalization
* Implement foreign key relationships to maintain data integrity
* Use PostgreSQL-specific features (views, triggers, window functions)
* Generate **business insights using SQL queries


Database Schema

The database includes the following core tables:

* `users` – stores user information and roles
* `properties` – property listings created by hosts
* `bookings` – reservations made by users
* `payments` – payment transactions for bookings
* `reviews` – customer feedback and ratings


Key Features

Relational Integrity

* Foreign key constraints ensure consistency between tables
* Example: bookings link users and properties

Triggers

* Automatically update property status after booking
* Demonstrates backend automation using PostgreSQL

Views (Analytics Layer)

Pre-built SQL views for business insights:

* Monthly revenue tracking
* Top-performing properties
* Popular locations
* Customer activity
* Host performance ranking

Advanced SQL

Includes:

* Window functions (`RANK`, `LAG`)
* Common Table Expressions (CTEs)
* Aggregations and filtering
* Date-based analysis


Business Insights Generated

The system answers real-world questions such as:

* Who are the top-paying customers?
* What is the monthly revenue trend?
* Which properties generate the most income?
* Which locations are most popular?
* What is the booking cancellation rate?
* Who are repeat customers?


How to Run the Project

1. Open PostgreSQL (pgAdmin)
2. Create a database:

   ```
   smart_booking_db
   ```
3. Run files in this order:

   * `schema.sql`
   * `seed_data.sql`
   * `triggers.sql`
   * `views.sql`
   * `advanced_queries.sql`


Technologies Used

* PostgreSQL
* pgAdmin 4
* SQL (Advanced Queries)
* Git & GitHub


Key Learnings

* Designing normalized relational databases
* Managing foreign key dependencies
* Writing advanced analytical SQL queries
* Using PostgreSQL features for real-world applications


Project Structure

```
smart-booking-db/
│── schema.sql
│── seed_data.sql
│── triggers.sql
│── views.sql
│── advanced_queries.sql
│── README.md
```

Author

Edith Mutai
Freelance Web Developer & UI/UX Designer
Nairobi, Kenya


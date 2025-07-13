# Wisdom Pets Digital Transformation — GCP BigQuery Analytics Project


## 📁 Project Overview

### 1️ Problem Statement  
**Wisdom Pets Medicine** is a growing business (est. 2019) that sells pet supplements, treatment packages, and vaccines. Initially serving retail customers, the company later expanded into wholesale distribution. As part of its digital transformation, Wisdom Pets aims to centralize and analyze raw sales, customer, and product data to gain actionable business insights.
In this project, we migrated their data into Google BigQuery, structured it for efficient querying, and performed analytical SQL queries to support data-driven decision-making.

---

## 2 Objectives

- Set up a GCP project and BigQuery environment  
- Load CSV datasets into structured BigQuery tables  
- Perform SQL-based data exploration and cleaning  
- Analyze customer segments, product popularity, and pricing patterns  
- Design a scalable schema for future analytics
- design an interactive dashbord

---

### 3 Tools & Technologies Used  

| Tool/Service               | Purpose                              |
|----------------------------|--------------------------------------|
| **Google Cloud Platform**  | Cloud infrastructure                 |
| **Google BigQuery**        | Data warehousing & SQL analytics     |
| **Google Cloud Storage**   | Raw CSV storage                      |
| **SQL**                    | Querying and business analysis       |
| **Looker Studio**          | Interactive dashboards and visualization |
| **CSV Files**              | Raw data sources                     |

---

### 4 CSV Files & Schema  

#### 📋 customers.csv  
| Column Name        | Description                        |
|--------------------|------------------------------------|
| customer_id        | Unique customer identifier         |
| vip_customer_flag  | Boolean flag for VIP customers     |
| business_name      | Business or retail customer name   |
| contact_name       | Main point of contact              |
| email_address      | Contact email                      |
| phone_number       | Customer phone number              |
| postal_address     | Shipping/billing address           |

---

#### 📦 products.csv  
| Column Name                 | Description                          |
|-----------------------------|--------------------------------------|
| product_id                  | Unique product identifier            |
| product_name                | Name of the product                  |
| category_name               | Product category (e.g., vaccine)     |
| retail_price                | Listed price for retail customers    |
| wholesale_discount_percentage | Discount for wholesale buyers    |
| rating                      | Average customer rating (1–5)        |

---

#### 💰 sales.csv  
| Column Name       | Description                              |
|-------------------|------------------------------------------|
| customer_id       | Foreign key reference to customers       |
| transaction_type  | Retail or Wholesale                      |
| transaction_id    | Unique transaction identifier            |
| transaction_date  | Date of transaction                      |
| product_id        | Foreign key reference to products        |
| quantity          | Quantity of product sold                 |
| total_amount      | Final billed amount                      |

---
## 5 Project Overview

**Wisdom Pets Medicine** is a growing business (est. 2019) that sells pet supplements, treatment packages, and vaccines. Initially serving retail customers, they have expanded into wholesale distribution and now seek better data-driven decisions.

This project focuses on:
- **Ingesting raw CSV data** into BigQuery
- **Structuring datasets** (Products, Customers, Transactions)
- **Analyzing sales performance** across retail and wholesale channels
- **Deriving actionable insights** to support business strategy


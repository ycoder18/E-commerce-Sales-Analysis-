# Wisdom Pets Digital Transformation — GCP BigQuery Analytics Project


## 📁 Project Overview

### 1️⃣ Problem Statement  
Wisdom Pets Medicine, an e-commerce and wholesale company for pet healthcare products, is undergoing a digital transformation. Their goal is to centralize and analyze raw sales, customer, and product data to gain actionable business insights. Our task is to migrate this data into **Google BigQuery**, structure it properly, and run analytical queries to support data-driven decisions.

---

### 2️⃣ Tools & Technologies Used  

| Tool/Service               | Purpose                              |
|----------------------------|--------------------------------------|
| **Google Cloud Platform**  | Cloud infrastructure                 |
| **Google BigQuery**        | Data warehousing & SQL analytics     |
| **Google Cloud Storage**   | Raw CSV storage                      |
| **SQL**                    | Querying and business analysis       |
| **CSV Files**              | Raw data sources                     |

---

### 3️⃣ CSV Files & Schema  

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

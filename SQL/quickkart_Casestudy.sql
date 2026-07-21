/* =====================================================================
   QUICKKART E-COMMERCE — SQL CASE STUDY (MySQL 8.x)
   Junior Data Engineer deliverable
   Run this file top to bottom.
   ===================================================================== */


/* =====================================================================
   PHASE 1 — DATABASE SETUP
   Why: centralised storage instead of scattered Excel files.
   ===================================================================== */

-- 1. Create database
DROP DATABASE IF EXISTS quickkart;
CREATE DATABASE quickkart
    DEFAULT CHARACTER SET utf8mb4
    DEFAULT COLLATE utf8mb4_unicode_ci;

-- 2. Use database
USE quickkart;

-- 3. Verify current database
SELECT DATABASE() AS current_database;

-- 4 & 5. Create all tables with proper constraints

CREATE TABLE suppliers (
    supplier_id   INT AUTO_INCREMENT PRIMARY KEY,
    supplier_name VARCHAR(100) NOT NULL UNIQUE,
    contact_email VARCHAR(150),
    phone         VARCHAR(15),
    city          VARCHAR(50) NOT NULL
) ENGINE=InnoDB;

CREATE TABLE customers (
    customer_id     INT AUTO_INCREMENT PRIMARY KEY,
    first_name      VARCHAR(50)  NOT NULL,
    last_name       VARCHAR(50)  NOT NULL,
    email           VARCHAR(150) UNIQUE,              -- NULL allowed: Phase 2.4
    phone           VARCHAR(15)  NOT NULL,
    city            VARCHAR(50)  NOT NULL,
    state           VARCHAR(50),
    join_date       DATE         NOT NULL DEFAULT (CURRENT_DATE),
    membership_type ENUM('Regular','Premium') NOT NULL DEFAULT 'Regular',
    CONSTRAINT chk_phone_len CHECK (CHAR_LENGTH(phone) >= 10)
) ENGINE=InnoDB;

CREATE TABLE products (
    product_id     INT AUTO_INCREMENT PRIMARY KEY,
    product_name   VARCHAR(120)  NOT NULL,
    category       VARCHAR(50)   NOT NULL,
    price          DECIMAL(10,2) NOT NULL,
    stock_quantity INT           NOT NULL DEFAULT 0,
    supplier_id    INT,
    CONSTRAINT chk_price CHECK (price > 0),
    CONSTRAINT chk_stock CHECK (stock_quantity >= 0),
    CONSTRAINT fk_product_supplier
        FOREIGN KEY (supplier_id) REFERENCES suppliers(supplier_id)
        ON DELETE SET NULL ON UPDATE CASCADE
) ENGINE=InnoDB;

CREATE TABLE orders (
    order_id     INT AUTO_INCREMENT PRIMARY KEY,
    customer_id  INT NOT NULL,
    order_date   DATE NOT NULL,
    status       ENUM('Pending','Processing','Shipped','Delivered','Cancelled')
                 NOT NULL DEFAULT 'Pending',
    total_amount DECIMAL(12,2) NOT NULL DEFAULT 0,
    CONSTRAINT chk_total CHECK (total_amount >= 0),
    CONSTRAINT fk_order_customer
        FOREIGN KEY (customer_id) REFERENCES customers(customer_id)
        ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB;

CREATE TABLE order_items (
    order_item_id INT AUTO_INCREMENT PRIMARY KEY,
    order_id      INT NOT NULL,
    product_id    INT NOT NULL,
    quantity      INT NOT NULL,
    unit_price    DECIMAL(10,2) NOT NULL,
    CONSTRAINT chk_qty CHECK (quantity > 0),
    CONSTRAINT uq_order_product UNIQUE (order_id, product_id),
    CONSTRAINT fk_item_order
        FOREIGN KEY (order_id) REFERENCES orders(order_id) ON DELETE CASCADE,
    CONSTRAINT fk_item_product
        FOREIGN KEY (product_id) REFERENCES products(product_id)
) ENGINE=InnoDB;

-- Helpful indexes for the reporting queries below
CREATE INDEX idx_cust_city    ON customers(city);
CREATE INDEX idx_prod_cat     ON products(category);
CREATE INDEX idx_ord_date     ON orders(order_date);
CREATE INDEX idx_ord_status   ON orders(status);


/* =====================================================================
   PHASE 2 — CUSTOMER MANAGEMENT
   Why: marketing wants customer insights.
   ===================================================================== */

-- Reference data first (suppliers, then products) --------------------
INSERT INTO suppliers (supplier_name, contact_email, phone, city) VALUES
('Sharma Electronics',  'sales@sharmaelec.in',  '9812345670', 'Delhi'),
('WoodCraft Interiors',  'info@woodcraft.in',   '9822345671', 'Jaipur'),
('StyleHub Apparel',     'orders@stylehub.in',  '9833345672', 'Mumbai'),
('FreshMart Distributors','contact@freshmart.in','9844345673', 'Pune');

INSERT INTO products (product_name, category, price, stock_quantity, supplier_id) VALUES
('Dell Inspiron 15 Laptop', 'Electronics', 58000.00,   7, 1),
('Samsung 55" 4K TV',       'Electronics', 62000.00,  25, 1),
('boAt Rockerz Headphones', 'Electronics',  1999.00, 140, 1),
('iPhone 15',               'Electronics', 79999.00,   4, 1),
('Teak Office Desk',        'Furniture',   24500.00,  12, 2),
('Ergonomic Chair',         'Furniture',    8999.00,  48, 2),
('Bookshelf 5-Tier',        'Furniture',    5499.00,   9, 2),
('Cotton Formal Shirt',     'Clothing',      1299.00, 200, 3),
('Denim Jeans',             'Clothing',      2199.00,  75, 3),
('Organic Green Tea 500g',  'Grocery',        749.00,  60, 4);

-- 1. Insert customer records
INSERT INTO customers
    (first_name, last_name, email, phone, city, state, join_date, membership_type) VALUES
('Aarav',  'Sharma',  'aarav.sharma@mail.com',  '9811100001', 'Delhi',     'Delhi',       '2026-02-11', 'Premium'),
('Diya',   'Patel',   'diya.patel@mail.com',    '9811100002', 'Ahmedabad', 'Gujarat',     '2025-08-03', 'Regular'),
('Rohan',  'Verma',   NULL,                     '9811100003', 'Delhi',     'Delhi',       '2026-01-19', 'Regular'),
('Isha',   'Nair',    'isha.nair@mail.com',     '9811100004', 'Kochi',     'Kerala',      '2024-11-27', 'Premium'),
('Kabir',  'Singh',   'kabir.singh@mail.com',   '9811100005', 'Mumbai',    'Maharashtra', '2026-03-30', 'Regular'),
('Meera',  'Iyer',    NULL,                     '9811100006', 'Mumbai',    'Maharashtra', '2026-05-14', 'Premium'),
('Arjun',  'Reddy',   'arjun.reddy@mail.com',   '9811100007', 'Hyderabad', 'Telangana',   '2025-12-01', 'Regular'),
('Sneha',  'Kulkarni','sneha.k@mail.com',       '9811100008', 'Pune',      'Maharashtra', '2026-06-22', 'Premium');

-- Orders + line items (revenue backbone)
INSERT INTO orders (customer_id, order_date, status, total_amount) VALUES
(1, '2026-01-15', 'Delivered',  120000.00),
(1, '2026-03-02', 'Delivered',   58000.00),
(2, '2026-02-20', 'Pending',     24500.00),
(3, '2026-04-11', 'Delivered',    8999.00),
(4, '2026-05-05', 'Processing', 141999.00),
(5, '2026-06-18', 'Delivered',   62000.00),
(6, '2026-06-29', 'Cancelled',    1999.00),
(7, '2026-07-02', 'Shipped',     15497.00),
(8, '2026-07-10', 'Pending',     79999.00),
(2, '2026-07-14', 'Delivered',    3498.00);

INSERT INTO order_items (order_id, product_id, quantity, unit_price) VALUES
(1, 1, 1, 58000.00), (1, 2, 1, 62000.00),
(2, 1, 1, 58000.00),
(3, 5, 1, 24500.00),
(4, 6, 1,  8999.00),
(5, 4, 1, 79999.00), (5, 2, 1, 62000.00),
(6, 2, 1, 62000.00),
(7, 3, 1,  1999.00),
(8, 8, 3,  1299.00), (8, 9, 5, 2199.00),
(9, 4, 1, 79999.00),
(10, 9, 1, 2199.00), (10, 8, 1, 1299.00);

-- Keep orders.total_amount in sync with the line items
UPDATE orders o
JOIN (SELECT order_id, SUM(quantity * unit_price) AS amt
      FROM order_items GROUP BY order_id) t
  ON o.order_id = t.order_id
SET o.total_amount = t.amt;

-- 2. Customers from a particular city
SELECT customer_id, CONCAT(first_name,' ',last_name) AS customer_name, city, join_date
FROM customers
WHERE city = 'Mumbai';

-- 3. Customers who joined this year
SELECT customer_id, CONCAT(first_name,' ',last_name) AS customer_name, join_date
FROM customers
WHERE YEAR(join_date) = YEAR(CURDATE())
ORDER BY join_date;

-- 4. Customers without an email
SELECT customer_id, CONCAT(first_name,' ',last_name) AS customer_name, phone
FROM customers
WHERE email IS NULL OR TRIM(email) = '';

-- 5. Premium customers
SELECT customer_id, CONCAT(first_name,' ',last_name) AS customer_name, city, membership_type
FROM customers
WHERE membership_type = 'Premium';


/* =====================================================================
   PHASE 3 — PRODUCT MANAGEMENT
   Why: inventory team wants stock monitoring.
   ===================================================================== */

-- 1. Low stock products (re-order level = 10)
SELECT product_id, product_name, category, stock_quantity
FROM products
WHERE stock_quantity < 10
ORDER BY stock_quantity;

-- 2. Products not sold in the last 90 days (includes never-sold items)
SELECT p.product_id, p.product_name, p.category, MAX(o.order_date) AS last_sold_on
FROM products p
LEFT JOIN order_items oi ON oi.product_id = p.product_id
LEFT JOIN orders o       ON o.order_id    = oi.order_id
GROUP BY p.product_id, p.product_name, p.category
HAVING MAX(o.order_date) IS NULL
    OR MAX(o.order_date) < CURDATE() - INTERVAL 90 DAY;

-- 3. Most expensive products (top 5)
SELECT product_id, product_name, category, price
FROM products
ORDER BY price DESC
LIMIT 5;

-- 4. Products by category
SELECT product_id, product_name, price, stock_quantity
FROM products
WHERE category = 'Electronics'
ORDER BY price DESC;

-- 5. Products supplied by a specific vendor
SELECT p.product_id, p.product_name, p.price, s.supplier_name
FROM products p
JOIN suppliers s ON s.supplier_id = p.supplier_id
WHERE s.supplier_name = 'Sharma Electronics';


/* =====================================================================
   PHASE 4 — ORDER MANAGEMENT
   Why: sales team tracks business performance.
   ===================================================================== */

-- 1. All orders
SELECT o.order_id, CONCAT(c.first_name,' ',c.last_name) AS customer_name,
       o.order_date, o.status, o.total_amount
FROM orders o
JOIN customers c ON c.customer_id = o.customer_id
ORDER BY o.order_date DESC;

-- 2. Delivered orders
SELECT order_id, customer_id, order_date, total_amount
FROM orders
WHERE status = 'Delivered';

-- 3. Pending orders
SELECT order_id, customer_id, order_date, total_amount
FROM orders
WHERE status = 'Pending';

-- 4. High-value orders (> ₹50,000)
SELECT order_id, customer_id, order_date, status, total_amount
FROM orders
WHERE total_amount > 50000
ORDER BY total_amount DESC;

-- 5. Orders placed in the last month
SELECT order_id, customer_id, order_date, status, total_amount
FROM orders
WHERE order_date >= CURDATE() - INTERVAL 1 MONTH
ORDER BY order_date DESC;


/* =====================================================================
   PHASE 5 — KPIs (aggregate functions)
   Why: management wants headline numbers.
   Cancelled orders are excluded from revenue.
   ===================================================================== */

-- 1-5 individually
SELECT SUM(total_amount) AS total_revenue      FROM orders WHERE status <> 'Cancelled';
SELECT ROUND(AVG(total_amount),2) AS avg_order_value FROM orders WHERE status <> 'Cancelled';
SELECT MAX(total_amount) AS highest_order_value FROM orders WHERE status <> 'Cancelled';
SELECT MIN(total_amount) AS lowest_order_value  FROM orders WHERE status <> 'Cancelled';
SELECT COUNT(*)          AS number_of_orders    FROM orders;

-- Single consolidated KPI dashboard
SELECT
    COUNT(*)                                        AS number_of_orders,
    SUM(total_amount)                               AS total_revenue,
    ROUND(AVG(total_amount), 2)                     AS avg_order_value,
    MAX(total_amount)                               AS highest_order_value,
    MIN(total_amount)                               AS lowest_order_value
FROM orders
WHERE status <> 'Cancelled';


/* =====================================================================
   PHASE 6 — GROUP BY REPORTS
   Why: executives want summarised reports.
   ===================================================================== */

-- 1. Revenue by month
SELECT DATE_FORMAT(order_date, '%Y-%m') AS order_month,
       COUNT(*)          AS orders_count,
       SUM(total_amount) AS revenue
FROM orders
WHERE status <> 'Cancelled'
GROUP BY order_month
ORDER BY order_month;

-- 2. Revenue by status
SELECT status, COUNT(*) AS orders_count, SUM(total_amount) AS revenue
FROM orders
GROUP BY status
ORDER BY revenue DESC;

-- 3. Revenue by customer
SELECT c.customer_id,
       CONCAT(c.first_name,' ',c.last_name) AS customer_name,
       COUNT(o.order_id)                    AS orders_count,
       IFNULL(SUM(o.total_amount), 0)       AS revenue
FROM customers c
LEFT JOIN orders o
       ON o.customer_id = c.customer_id AND o.status <> 'Cancelled'
GROUP BY c.customer_id, customer_name
ORDER BY revenue DESC;

-- 4. Revenue by product
SELECT p.product_id, p.product_name, p.category,
       SUM(oi.quantity)                  AS units_sold,
       SUM(oi.quantity * oi.unit_price)  AS revenue
FROM products p
JOIN order_items oi ON oi.product_id = p.product_id
JOIN orders o       ON o.order_id    = oi.order_id
WHERE o.status <> 'Cancelled'
GROUP BY p.product_id, p.product_name, p.category
ORDER BY revenue DESC;

-- 5. Revenue by category
SELECT p.category,
       COUNT(DISTINCT o.order_id)       AS orders_count,
       SUM(oi.quantity * oi.unit_price) AS revenue
FROM products p
JOIN order_items oi ON oi.product_id = p.product_id
JOIN orders o       ON o.order_id    = oi.order_id
WHERE o.status <> 'Cancelled'
GROUP BY p.category
ORDER BY revenue DESC;


/* =====================================================================
   PHASE 7 — HAVING (filtering grouped results)
   Why: management only wants meaningful groups.
   ===================================================================== */

-- 1. Customers generating more than ₹50,000 revenue
SELECT c.customer_id, CONCAT(c.first_name,' ',c.last_name) AS customer_name,
       SUM(o.total_amount) AS revenue
FROM customers c
JOIN orders o ON o.customer_id = c.customer_id
WHERE o.status <> 'Cancelled'
GROUP BY c.customer_id, customer_name
HAVING SUM(o.total_amount) > 50000
ORDER BY revenue DESC;

-- 2. Products generating more than ₹1,00,000 revenue
SELECT p.product_id, p.product_name,
       SUM(oi.quantity * oi.unit_price) AS revenue
FROM products p
JOIN order_items oi ON oi.product_id = p.product_id
JOIN orders o       ON o.order_id    = oi.order_id
WHERE o.status <> 'Cancelled'
GROUP BY p.product_id, p.product_name
HAVING revenue > 100000
ORDER BY revenue DESC;

-- 3. Categories with more than 10 orders
SELECT p.category, COUNT(DISTINCT o.order_id) AS orders_count
FROM products p
JOIN order_items oi ON oi.product_id = p.product_id
JOIN orders o       ON o.order_id    = oi.order_id
GROUP BY p.category
HAVING orders_count > 10
ORDER BY orders_count DESC;

-- 4. Months with revenue above the overall monthly average
SELECT DATE_FORMAT(order_date, '%Y-%m') AS order_month,
       SUM(total_amount)                AS revenue
FROM orders
WHERE status <> 'Cancelled'
GROUP BY order_month
HAVING revenue > (
    SELECT AVG(monthly_revenue)
    FROM (
        SELECT SUM(total_amount) AS monthly_revenue
        FROM orders
        WHERE status <> 'Cancelled'
        GROUP BY DATE_FORMAT(order_date, '%Y-%m')
    ) AS m
)
ORDER BY revenue DESC;

-- 5. Customers with multiple orders
SELECT c.customer_id, CONCAT(c.first_name,' ',c.last_name) AS customer_name,
       COUNT(o.order_id) AS orders_count
FROM customers c
JOIN orders o ON o.customer_id = c.customer_id
GROUP BY c.customer_id, customer_name
HAVING orders_count > 1
ORDER BY orders_count DESC;


/* =====================================================================
   PHASE 8 — BUSINESS CLASSIFICATION (CASE expressions)
   Why: management needs segmentation.
   ===================================================================== */

-- 1. Order value bands
SELECT order_id, customer_id, total_amount,
       CASE
           WHEN total_amount > 50000                      THEN 'Premium'
           WHEN total_amount >= 20000                     THEN 'Standard'
           ELSE                                                'Basic'
       END AS order_segment
FROM orders
ORDER BY total_amount DESC;

-- 2. Product priority by category
SELECT product_id, product_name, category,
       CASE category
           WHEN 'Electronics' THEN 'High Priority'
           WHEN 'Furniture'   THEN 'Medium Priority'
           ELSE                    'Low Priority'
       END AS handling_priority
FROM products
ORDER BY FIELD(handling_priority, 'High Priority','Medium Priority','Low Priority'),
         product_name;

-- 3. Customer tiers by lifetime revenue
SELECT c.customer_id,
       CONCAT(c.first_name,' ',c.last_name)   AS customer_name,
       IFNULL(SUM(o.total_amount), 0)         AS lifetime_revenue,
       CASE
           WHEN IFNULL(SUM(o.total_amount),0) > 100000 THEN 'Platinum'
           WHEN IFNULL(SUM(o.total_amount),0) >  50000 THEN 'Gold'
           WHEN IFNULL(SUM(o.total_amount),0) >  20000 THEN 'Silver'
           ELSE                                             'Regular'
       END AS customer_tier
FROM customers c
LEFT JOIN orders o
       ON o.customer_id = c.customer_id AND o.status <> 'Cancelled'
GROUP BY c.customer_id, customer_name
ORDER BY lifetime_revenue DESC;

-- 4. Inventory health
SELECT product_id, product_name, category, stock_quantity,
       CASE
           WHEN stock_quantity < 10  THEN 'Critical'
           WHEN stock_quantity <= 50 THEN 'Low'
           ELSE                           'Healthy'
       END AS stock_status
FROM products
ORDER BY stock_quantity;

-- 5. Order fulfilment action list
SELECT order_id, customer_id, order_date, status,
       CASE status
           WHEN 'Pending'    THEN 'Action Required'
           WHEN 'Processing' THEN 'In Progress'
           WHEN 'Shipped'    THEN 'In Progress'
           WHEN 'Delivered'  THEN 'Completed'
           WHEN 'Cancelled'  THEN 'Closed - Cancelled'
           ELSE                   'Unknown'
       END AS action_status
FROM orders
ORDER BY FIELD(status,'Pending','Processing','Shipped','Delivered','Cancelled'),
         order_date;

/* ===================== END OF CASE STUDY ===================== */

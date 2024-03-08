---------------------------------------------CODING CHALLENGE---- ECOMMERCE--------------------------------------------------------

---create database
create database Ecommerce

USE Ecommerce

----create table
/**customers table:
• customer_id (Primary Key)
• name
• email
• address**/create table Customers(Customer_id int  Primary key not null,Customer_Name varchar(20) not null,Email varchar(20) not null,Addresss varchar(30) not null)/**products table:
• product_id (Primary Key)
• name
• price
• description
• stockQuantity**/create table Products(Product_id int Primary key not null,Product_name varchar(20) not null,Price float not null,Descriptionn varchar(30) not null,StockQuantity int not null)/** cart table:
• cart_id (Primary Key)
• customer_id (Foreign Key)
• product_id (Foreign Key)
• quantity **/create table cart_tables(cart_id int Primary key not null,Customer_id int,foreign key (Customer_id) references Customers(Customer_id),Product_id int ,foreign key (Product_id) references Products(Product_id),Quantity int )/**orders table:
• order_id (Primary Key)
• customer_id (Foreign Key)
• order_date
• total_price
• shipping_address **/create table Orders(Order_id int Primary key not null,Customer_id int,foreign key (Customer_id) references Customers(Customer_id),Total_price float ,shipping_address varchar(100))/**order_items table (to store order details):
• order_item_id (Primary Key)
• order_id (Foreign Key)
• product_id (Foreign Key)
• quantity**/create table Order_items(Order_item_id int primary key not null,Order_id int,foreign key (Order_id) references Orders(Order_id),Product_id int,foreign key (Product_id) references Products(Product_id),Quantity int)------INSERT VALUES TO EACH TABLEINSERT  into Customers(Customer_id,Customer_Name,Email,Addresss) values(1,'John Doe', 'johndoe@example.com','123 Main St, City'),
(2,'Jane Smith', 'janes@example.com', '456 Elm St, Town'),
(3, 'Robert Johnson', 'robert@example.com', '789 Oak St, Village'),
(4, 'Sarah Brown', 'sarah@example.com','101 Pine St, Suburb'),
(5, 'David Lee', 'david@example.com', '234 Cedar St, District'),
(6, 'Laura Hall','laura@example.com', '567 Birch St, County'),
(7, 'Michael Davis', 'michael@example.com', '890 Maple St, State'),
(8, 'Emma Wilson', 'emma@example.com', '321 Redwood St, Country'),
(9, 'William Taylor', 'william@example.com', '432 Spruce St, Province'),
(10, 'Olivia Adams' ,'olivia@example.com', '765 Fir St, Territory')INSERT INTO Products(Product_id,Product_name,Price,Descriptionn,StockQuantity) values (1, 'Laptop', 800.00, 'High-performance laptop', 10),
(2, 'Smartphone', 600.00, 'Latest smartphone', 15),
(3, 'Tablet', 300.00, 'Portable tablet', 20),
(4, 'Headphones', 150.00, 'Noise-canceling', 30),
(5, 'TV', 900.00, '4K Smart TV', 5),
(6, 'Coffee Maker', 50.00, 'Automatic coffee maker', 25),
(7, 'Refrigerator', 700.00, 'Energy-efficient', 10),
(8, 'Microwave Oven', 80.00, 'Countertop microwave', 15),
(9, 'Blender', 70.00, 'High-speed blender', 20),
(10, 'Vacuum Cleaner', 120.00, 'Bagless vacuum cleaner', 10);


INSERT INTO cart_tables (cart_id, Customer_id, Product_id, Quantity) 
VALUES 
(1, 1, 1, 2),
(2, 1, 3, 1),
(3, 2, 2, 3),
(4, 3, 4, 4),
(5, 3, 5, 2),
(6, 4, 6, 1),
(7, 5, 1, 1),
(8, 6, 10, 2),
(9, 6, 9, 3),
(10, 7, 7, 2);


INSERT INTO Orders (Order_id, Customer_id, Total_price, shipping_address) 
VALUES 
(1, 1, 1200.00, '123 Main Street, Anytown, USA'),
(2, 2, 900.00, '456 Elm Avenue, Springfield, USA'),
(3, 3, 300.00, '789 Oak Lane, Lakeside, USA'),
(4, 4, 150.00, '101 Maple Drive, Riverdale, USA'),
(5, 5, 1800.00, '202 Pine Street, Hillcrest, USA'),
(6, 6, 400.00, '303 Cedar Avenue, Sunnyville, USA'),
(7, 7, 700.00, '404 Birch Lane, Mountainview, USA'),
(8, 8, 160.00, '505 Walnut Street, Oceanview, USA'),
(9, 9, 140.00, '606 Spruce Drive, Lakeshore, USA'),
(10, 10, 1400.00, '707 Cherry Lane, Parkside, USA');

INSERT INTO Order_items (Order_item_id, Order_id, Product_id, Quantity) 
VALUES 
(1, 1, 1, 2),
(2, 1, 3, 1),
(3, 2, 2, 3),
(4, 3, 5, 2),
(5, 4, 4, 4),
(6, 4, 6, 1),
(7, 5, 1, 1),
(8, 5, 2, 2),
(9, 6, 10, 2),
(10, 6, 9, 3);

--1. Update refrigerator product price to 800.
SELECT*FROM Products
update Products
set Price=800
where Product_name='Refrigerator'

--2. Remove all cart items for a specific customer
declare @Customer_id int
set @Customer_id=3
delete from cart_tables where Customer_id=@Customer_id
select*from cart_tables

--3. Retrieve Products Priced Below $100.
select*from Products
where Price<=100

--4. Find Products with Stock Quantity Greater Than 5.
select Product_name from Products 
where StockQuantity >5

--5. Retrieve Orders with Total Amount Between $500 and $1000.
select*from Orders
where Total_price between 500 and 1000

--6. Find Products which name end with letter ‘r’.
select Product_name from Products
where Product_name like '%r'

--7. Retrieve Cart Items for Customer 5
select* from cart_tables
where Customer_id=5

--8. Find Customers Who Placed Orders in 2023.
alter table Orders
add orderDate date

UPDATE Orders
SET orderDate = '2024-01-05' WHERE Order_id = 1;

UPDATE Orders
SET orderDate = '2024-02-10' WHERE Order_id = 2;

UPDATE Orders
SET orderDate = '2024-03-15' WHERE Order_id = 3;

UPDATE Orders
SET orderDate = '2023-04-20' WHERE Order_id = 4;

UPDATE Orders
SET orderDate = '2023-05-25' WHERE Order_id = 5;

UPDATE Orders
SET orderDate = '2023-06-30' WHERE Order_id = 6;

UPDATE Orders
SET orderDate = '2023-07-05' WHERE Order_id = 7;

UPDATE Orders
SET orderDate = '2023-08-10' WHERE Order_id = 8;

UPDATE Orders
SET orderDate = '2023-09-15' WHERE Order_id = 9;

UPDATE Orders
SET orderDate = '2023-10-20' WHERE Order_id = 10;

select Customer_name from Customers c
join Orders O on c.Customer_id=O.Customer_id
where year(O.orderDate)=2023

select*from Orders

--9. Determine the Minimum Stock Quantity for Each Product Category.

ALTER TABLE Products
ADD  Category VARCHAR(50)
UPDATE Products
SET Category = 
    CASE 
        WHEN Product_name = 'Laptop' THEN 'Electronics'
        WHEN Product_name = 'Smartphone' THEN 'Electronics'
        WHEN Product_name = 'Tablet' THEN 'Electronics'
        WHEN Product_name = 'Headphones' THEN 'Electronics'
        WHEN Product_name = 'TV' THEN 'Electronics'
        WHEN Product_name = 'Coffee Maker' THEN 'Appliances'
        WHEN Product_name = 'Refrigerator' THEN 'Appliances'
        WHEN Product_name = 'Microwave Oven' THEN 'Appliances'
        WHEN Product_name = 'Blender' THEN 'Appliances'
        WHEN Product_name = 'Vacuum Cleaner' THEN 'Appliances'
        ELSE 'Other'
    END;

SELECT Category,MIN(StockQuantity) as Min_stock_quantity
FROM Products
GROUP BY  Category

SELECT*FROM Products

--10. Calculate the Total Amount Spent by Each Customer.
SELECT Customer_Name,Total_price from Customers c
join Orders o on c.Customer_id=o.Customer_id

SELECT*FROM Orders

--11. Find the Average Order Amount for Each Customer.
SELECT Customer_Name,AVG(Total_price) as avg_order_amount
FROM Customers c
JOIN Orders o ON c.Customer_id = o.Customer_id
GROUP BY c.Customer_Name;

--12. Count the Number of Orders Placed by Each Customer.SELECT *FROM Order_items
select Customer_Name , COUNT(oi.Order_id) as No_of_orders
from Customers c
join Orders o on c.Customer_id=o.Customer_id
join Order_items oi on o.Order_id=oi.Order_id
group by Customer_Name

--13. Find the Maximum Order Amount for Each Customer.

select Customer_Name,Max(Total_Price) as max_order_amount
from Customers c
join Orders o on c.Customer_id=o.Customer_id
group by Customer_Name

--14. Get Customers Who Placed Orders Totaling Over $1000.
select Customer_Name ,sum(Total_Price) 
from Customers c
join Orders o on c.Customer_id=o.Customer_id
group by Customer_Name
having sum(Total_Price)>=1000

---15. Subquery to Find Products Not in the Cart.
select Product_id, Product_name
from Products
where Product_id NOT IN (Select distinct Product_id from cart_tables)

select* from cart_tables

---16.Subquery to Find Customers Who Haven't Placed Orders.
select * from Customers
where Customer_id not in (Select Customer_id from Orders)

---17. Subquery to Calculate the Percentage of Total Revenue for a Product.
Select oi.product_id,
(SUM(oi.quantity * p.price) / (Select SUM(total_price) From orders)) * 100 as revenue_percentage
From order_items oi
JOIN products p on  oi.product_id = p.product_id
group by oi.product_id;

--18. Subquery to Find Products with Low Stock.
select* from Products 
where StockQuantity=(select MIN(StockQuantity) from Products)

--19. Subquery to Find Customers Who Placed High-Value Orders.
select *  from customers
where Customer_id in (select customer_id from orders 
where Total_price = (select max(Total_price) as Maximum_value from orders))
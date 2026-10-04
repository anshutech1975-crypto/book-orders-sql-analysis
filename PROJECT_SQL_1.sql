-- Import Data into books table --
drop table if exists books ;
create table books (Book_ID	serial ,
Title	varchar(100),
Author	varchar (50),
Genre	varchar (50),
Published_Year	integer,
Price	numeric(10,2),
Stock	integer 
) ;

select * from books

-- Import Data into Customers table --

create table customers (
Customer_ID	serial,	
customer_Name varchar(50),
Email	varchar(100) unique,
Phone	integer	,
City	varchar(50),
Country	varchar(50) )

select * from customers ;

-- Import Data into orders table --

drop table orders
create table orders (Order_ID	serial,
Customer_ID	integer,
Book_ID	integer,
Order_Date	date,
Quantity	integer,
Total_Amount numeric (10,2))

select * from orders ;

-- 1.retrive all books in fiction genre : --


select * 
from books 
where genre = 'Fiction';

-- 2.find books published after the year 1950: --

select * 
from books 
where published_year>1950 ;

-- 3.list all the customers from canada : -- 

select customer_id,customer_name,country 
from customers 
where country = 'Canada';

--4.show orders placed in november 2023 : -- 

select * 
from orders 
where order_date between '2023-11-1' and '2023-11-30';

--5.retrive total stock of books available : --

select sum(stock) as Total_stock 
from books ;

--6.Find details of most expensive book : --

select * 
from books 
order by price desc 
limit  1 ;

--7.show all the customer who ordered more than 1 quantity of a book : --

select * 
from orders 
where quantity>1 ;

--8.retrive all orders where total amount exceed $20 : --

select *
from orders 
where total_amount>20 ;

--9.list all genres available in books table : --

select distinct(genre) 
from books ;

--10.find the book with lowest stock : --

select * 
from books 
where stock>0
order by stock asc 
limit 6

select * 
from books 
order by stock asc 
limit 5 ;

-- 11.calculate the total revenue generated from all orders : --

select sum(total_amount) as Total_Revenue 
from orders ;

-- Advance Quries -- 

-- 1.retrive total number of books sold for each genre : -- 

select b.genre, SUM (o.quantity) as Total_books_sold 
from orders o
join books b 
on b.book_id = o.book_id 
group by b.genre ;

-- 2.find the average price of books in 'fantasy' genre : --

select avg(price) as average_price 
from books
where genre = 'Fantasy' ;

-- 3.list customers who have placed atleast 2 orders : --

select o.customer_id ,c.customer_name ,
count(o.order_id) as order_count 
from orders o
join customers c on c.customer_id = o.customer_id
group by o.customer_id ,
c.customer_name
having count(order_id)>=2 ; 

-- 4.find the most frequently ordered book : -- 

select o.book_id , b.title, count (o.order_id) as order_count 
from orders o
join books b on b.book_id = o.book_id 
group by o.book_id ,
b.title
order by order_count desc 
limit 1 

-- 5.show the top 3 most expensive book of fantasy genre :  --

select * 
from books 
where genre = 'Fantasy'
order by price desc 
limit 3 ;

-- 6.retrive the total quantity of books sold by each author : -- 

select b.author,sum(o.quantity) as total_books_sold
from orders o
join books b on o.book_id = b.book_id 
group by b.author ;

-- 7.list the cities where customer spent more than $30 : --

select distinct(c.city),
       o.total_amount 
from orders o 
join customers c on o.customer_id = c.customer_id 
where o.total_amount>30 ;

-- 8.find the customer who spent most on orders : -- 

select c.customer_id , c.customer_name , sum(o.total_amount) as total_amount_spent
from orders o 
join customers c on o.customer_id = c.customer_id
group by c.customer_name ,
c.customer_id 
order by total_amount_spent desc 
limit 1 ;

-- 9.Calculate the stock remaining after fulfilling after all orders : --

select b.book_id , b.title , b.stock , coalesce(sum(o.quantity),0) as ordered_quantity ,
       b.stock - coalesce(sum(o.quantity),0) as remaining_stock
from books b 
left join orders o on b.book_id = o.book_id 
group by b.book_id,
b.title,
b.stock 
order by b.book_id asc ; 


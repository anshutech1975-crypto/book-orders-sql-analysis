Overview :-
An online bookstore wants to understand its sales performance. This project uses SQL to analyse three related tables (books, customers, orders) and answer 20 business questions, from simple filtering to multi-table joins, aggregations and inventory calculations.

The analysis looks at:-

Which genres, authors and books sell the most ,
Whether customers buy single or multiple copies per order ,
Who the top and repeat customers are ,
How much stock remains after all orders are fulfilled

Tools & SQL Concepts Used :-

Database: PostgreSQL, Client: pgAdmin
SELECT, WHERE, ORDER BY, LIMIT, DISTINCT
Aggregate functions: SUM, AVG, COUNT
GROUP BY and HAVING
INNER JOIN and LEFT JOIN across multiple tables
COALESCE for handling nulls
Calculated columns (remaining stock = stock − ordered quantity)

 Business Questions Solved :-
Basic Queries

Retrieve all books in the Fiction genre ,
Find books published after the year 1950 ,
List all customers from Canada ,
Show orders placed in November 2023 ,
Retrieve the total stock of books available ,
Find the details of the most expensive book ,
Show all orders where more than 1 copy was bought ,
Retrieve all orders where the total amount exceeds $20 ,
List all genres available in the books table ,
Find the books with the lowest stock ,
Calculate the total revenue generated from all orders

Advanced Queries

Total number of books sold for each genre ,
Average price of books in the Fantasy genre ,
Customers who have placed at least 2 orders ,
The most frequently ordered book ,
Top 3 most expensive Fantasy books ,
Total quantity of books sold by each author ,
Cities where customers spent more than $30 in an order ,
The customer who spent the most on orders ,
Stock remaining after fulfilling all orders

Key Insights :-

Total revenue: $75,628.66 from 500 orders, an average of about $151 per order.
Mystery is the best-selling genre by volume (504 copies), followed by Science Fiction (447) and Fantasy (446). Romance earns the most revenue ($13,087) despite selling fewer copies, which points to a higher average price per copy.
Fiction is the weakest genre, with only 225 copies sold and the lowest revenue ($7,271) among the 7 genres.
Customers buy in bulk. About 88% of orders (438 of 500) contain more than one copy, with an average of roughly 5 copies per order. Almost all orders (473 of 500) exceed $20.
Top author: Patrick Contreras leads with 28 copies sold, followed by Melissa Taylor (27) and Emily James and Thomas Trujillo (24 each).
Customer loyalty: 139 of 307 buying customers (about 45%) ordered more than once. The highest spender, Kim Turner, spent $1,398.90.
Fantasy pricing: the average Fantasy book costs about $25.98, and the three priciest Fantasy titles are all priced between $48.97 and $49.90.
Inventory risk: 5 books are already out of stock, and when all order quantities are subtracted from stock, 30 titles end up with negative remaining stock (up to 18 copies short). These need restocking or a data check.


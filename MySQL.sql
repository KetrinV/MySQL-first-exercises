-- Yl 21

-- Yl 21.2
SELECT * FROM books WHERE release_date >= 2010 AND type = 'new'; 
-- Yl 21.3
 SELECT title, release_date, price, type FROM books WHERE release_date <= 1970 AND type = 'used' AND price <= 20; 
-- Yl 22.4
SELECT COUNT(id) as tellimuste_arv,order_date as aasta FROM orders GROUP BY year(aasta); 
-- Yl 21.5
SELECT ROUND(SUM(price),2) AS "Ümardus" FROM orders LEFT JOIN books ON orders.book_id = books.id GROUP BY YEAR(order_date); 
-- Yl 21.6
 SELECT count(*), sum(books.price) FROM orders LEFT JOIN books ON orders.book_id = books.id WHERE year(order_date) = 2017; 
-- Yl 21.7
SELECT ROUND(SUM(price),2) AS "Ümardus", year(order_date) as Aasta, count(*) as "tellimuste arv" From orders LEFT JOIN books ON orders.book_id = books.id WHERE year(order_date) = 2017 GROUP BY YEAR(order_date); 
-- Yl 21.8
SELECT books.title, books.price, count(*) from orders left join books on book.id = orders.client_id order by count(*) DESC limit 10; 
-- Yl 21.9
SELECT avg(price) from books; 

SELECT title as "pealkiri" from books where price > (SELECT avg(price) from books); 

-- Yl 22 

-- Yl 22.1
select sum(price * stock_saldo) as laoväärtus from books; 
-- Yl 22.2
SELECT avg(price), max(price), min(price) from books; 
-- Yl 22.3
SELECT max(price) as "kõige kallim kasutatud raamat" from books where type = "used"; 
-- Yl 22.4
SELECT CASE WHEN type = "new" THEN "uus" WHEN type = "used" THEN "kasutatud" WHEN type = "ebook" THEN "e-raamat" END as Tüüp, round(avg(price),2) as Keskmine_Hind, COUNT(*) AS Hulk FROM books GROUP BY type; 
-- Yl 22.5
SELECT avg(price) from books where type = 'new'; 
-- Yl 22.6
SELECT title, price, type FROM books WHERE type = 'used' AND price > (SELECT avg(price) from books where type = 'new') order by price; 
SELECT avg(price) FROM authors LEFT JOIN books_authors ON book_authors.author_id = authors.id LEFT JOIN books ON book_authors.book_id = books.id LEFT JOIN orders ON orders.book_id = books.id WHERE orders.id is not null GROUP BY authors.id order by count(*) DESC limit 1; 
SELECT * FROM books where price < (SELECT avg(price) FROM authors LEFT JOIN books_authors ON book_authors.author_id = authors.id LEFT JOIN books ON book_authors.book_id = books.id LEFT JOIN orders ON orders.book_id = books.id WHERE orders.id is not null GROUP BY authors.id order by count(*) DESC limit 1); 
-- Yl 22.7
SELECT * FROM books WHERE release_date % 2 = 0; 
-- Yl 22.8
SELECT count(*), language FROM books GROUP BY language ORDER BY count(*) desc LIMIT 3; 

-- YL 23 

-- YL 23.1
INSERT INTO clients (username, first_name, last_name, email, address)VALUES ("Ketrin124", "Ketrin", "Vanatoa", "ketrin.vanatoa@ametikool.ee", "1. Mai 1-4"); 
-- YL 23.2
UPDATE books SET language = "Eesti" WHERE id = 1; 
-- YL 23.3
DELETE FROM orders WHERE id = 2300; 
-- YL 23.4
INSERT INTO clients (username, first_name, last_name, email, address)VALUES ("HeyHEY", "Lisbet", "Kask", "hey@gmail.com", "Tartu"),("Liis", "Liis", "Maeitea", "Liisi@gmail.com", "Kohila"),("yesmee", "Peeter", "Samblik", "yesmees@gmail.com", "Pärnu"),("Timokene", "Timo", "Lepik", "timolepik@gmail.com", "aikuse"),("notyou", "Heinz", "Puu", "puukene@gmail.com", "Tallinn"); 
-- YL 23.5
INSERT INTO orders (delivery_address, order_date, status, client_id, book_id)VALUES("5344 Kodu", "2007-10-10", "sent",(SELECT id FROM clients WHERE username = "mcage1o"),(SELECT id FROM books WHERE title = "Vendetta")); 
-- YL 23.6
UPDATE books set price = price * 1.05, pages = pages - 5  where id > 0; 
-- YL 23.7
SELECT authors.id FROM authors LEFT JOIN book_authors ON authors.id = book_authors.author_id WHERE book_authors.id is NULL; 
DELETE FROM authors WHERE id IN (SELECT authors.id FROM authors LEFT JOIN book_authors ON authors.id = book_authors.author_id WHERE book_authors.id is NULL); 
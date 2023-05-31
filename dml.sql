
INSERT INTO author VALUES (1, 'Mohammad Rahman', 32, 'Male', '12/A, Dhaka Road, Dhaka');
INSERT INTO author VALUES (2, 'Fatima Ahmed', 27, 'Female', '34/B, Chittagong Avenue, Chittagong');
INSERT INTO author VALUES (3, 'Abdul Ali', 41, 'Male', '56/C, Sylhet Lane, Sylhet');
INSERT INTO author VALUES (4, 'Ayesha Khan', 38, 'Female', '78/D, Khulna Street, Khulna');
INSERT INTO author VALUES (5, 'Kamal Hussain', 29, 'Male', '90/E, Rajshahi Road, Rajshahi');
INSERT INTO author VALUES (6, 'Nadia Islam', 36, 'Female', '23/F, Barisal Avenue, Barisal');
INSERT INTO author VALUES (7, 'Rahim Chowdhury', 43, 'Male', '45/G, Rangpur Lane, Rangpur');
INSERT INTO author VALUES (8, 'Saira Akter', 31, 'Female', '67/H, Comilla Road, Comilla');
INSERT INTO author VALUES (9, 'Tariq Hasan', 34, 'Male', '89/I, Jessore Street, Jessore');




INSERT INTO publisher VALUES (1, 'Bangla Publishers', '22/K, Dhaka Road, Dhaka');
INSERT INTO publisher VALUES (2, 'Chittagong Books', '44/L, Chittagong Avenue, Chittagong');
INSERT INTO publisher VALUES (3, 'Sylhet Publications', '66/M, Sylhet Lane, Sylhet');
INSERT INTO publisher VALUES (4, 'Khulna Printers', '88/N, Khulna Street, Khulna');
INSERT INTO publisher VALUES (5, 'Rajshahi Press', '11/O, Rajshahi Road, Rajshahi');
INSERT INTO publisher VALUES (6, 'Barisal Publishers', '33/P, Barisal Avenue, Barisal');
INSERT INTO publisher VALUES (7, 'Rangpur Books', '55/Q, Rangpur Lane, Rangpur');
INSERT INTO publisher VALUES (8, 'Comilla Publications', '77/R, Comilla Road, Comilla');
INSERT INTO publisher VALUES (9, 'Jessore Printers', '99/S, Jessore Street, Jessore');
 

INSERT INTO books VALUES (1, 'Bengali Adventures', 29.99, 280, 15, 1, 1);
INSERT INTO books VALUES (2, 'Coastal Tales', 24.99, 320, 20, 2, 2);
INSERT INTO books VALUES (3, 'Mysteries of Sylhet', 34.99, 400, 10, 3, 3);
INSERT INTO books VALUES (4, 'Khulna Chronicles', 27.99, 350, 25, 4, 4);
INSERT INTO books VALUES (5, 'Rajshahi Memoirs', 21.99, 200, 30, 5, 5);
INSERT INTO books VALUES (6, 'Barisal Stories', 31.99, 380, 35, 6, 6);
INSERT INTO books VALUES (7, 'Rangpur Legends', 28.99, 340, 40, 7, 7);
INSERT INTO books VALUES (8, 'Comilla Sagas', 23.99, 260, 50, 8, 8);
INSERT INTO books VALUES (9, 'Jessore Journeys', 26.99, 300, 45, 9, 9);

INSERT INTO customer VALUES (1, 'Farhana Begum', '22/K, Dhaka Road, Dhaka', 12345678);
INSERT INTO customer VALUES (2, 'Kamrul Islam', '44/L, Chittagong Avenue, Chittagong', 23456789);
INSERT INTO customer VALUES (3, 'Nadia Ahmed', '66/M, Sylhet Lane, Sylhet', 34567890);
INSERT INTO customer VALUES (4, 'Rahim Khan', '88/N, Khulna Street, Khulna', 45678901);
INSERT INTO customer VALUES (5, 'Sara Akter', '11/O, Rajshahi Road, Rajshahi', 56789012);
INSERT INTO customer VALUES (6, 'Tanjim Hussain', '33/P, Barisal Avenue, Barisal', 67890123);
INSERT INTO customer VALUES (7, 'Rina Chowdhury', '55/Q, Rangpur Lane, Rangpur', 78901234);
INSERT INTO customer VALUES (8, 'Imran Hasan', '77/R, Comilla Road, Comilla', 89012345);
INSERT INTO customer VALUES (9, 'Shabnam Khan', '99/S, Jessore Street, Jessore', 90123456);

INSERT INTO orders VALUES (1, 1, 1);
INSERT INTO orders VALUES (2, 2, 2);
INSERT INTO orders VALUES (3, 3, 3);
INSERT INTO orders VALUES (4, 4, 4);
INSERT INTO orders VALUES (5, 5, 5);
INSERT INTO orders VALUES (6, 6, 6);
INSERT INTO orders VALUES (7, 7, 7);
INSERT INTO orders VALUES (8, 8, 8);
INSERT INTO orders VALUES (9, 9, 9);

set pagesize 180
set linesize 180


SELECT * FROM author;
SELECT * FROM publisher;
SELECT * FROM books;
SELECT * FROM customer;
SELECT * FROM orders;


-- update
update books set price= 1200 where book_id= 3;

SELECT * FROM books;


-- delete
INSERT INTO author VALUES (11, 'Sadi', 32, 'Male', '12/A, Green Road, Dhaka');

-- Print the contents of the 'author' table
SELECT * FROM author;

delete from  author where author_id=11;


-- Print the contents of the 'author' table
SELECT * FROM author;

-- Union
select book_name from books where book_name like '%r%' union select book_name from books where book_name like '%e%';


-- Aggregate function
SELECT COUNT(*) AS total_authors FROM author;
SELECT AVG(age) AS average_age FROM author;
SELECT MAX(price) AS max_price FROM books;
SELECT MIN(page_number) AS min_page_number FROM books;
SELECT SUM(stock) AS total_stock FROM books;


-- group by

SELECT gender, COUNT(*) AS author_count
FROM author
GROUP BY gender;



-- nested sub query

SELECT book_name, (
    SELECT author_name
    FROM author
    WHERE author_id = books.author_id
) AS author_name
FROM books
WHERE price > (SELECT AVG(price) FROM books);


SELECT author_name
FROM author
WHERE author_id IN (
    SELECT author_id
    FROM books
    WHERE publisher_id = (
        SELECT publisher_id
        FROM publisher
        WHERE publisher_name = 'Bangla Publishers'
    )
);


-- set Membership

SELECT author_name
FROM author
WHERE author_id IN (
    SELECT author_id
    FROM books
    WHERE price > 30
);


-- join

SELECT books.book_name, author.author_name
FROM books
JOIN author ON books.author_id = author.author_id;


-- string operation

SELECT *
FROM books
WHERE book_name LIKE '%d%';


SELECT *
FROM author
WHERE author_name LIKE 'E%';




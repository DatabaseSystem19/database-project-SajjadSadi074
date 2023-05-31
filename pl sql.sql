

-- pl sql


SET SERVEROUTPUT ON

DECLARE
  book_id books.book_id%TYPE;
  book_name books.book_name%TYPE;
  book_stock books.stock%TYPE;
BEGIN
  SELECT book_id, book_name, stock INTO book_id, book_name, book_stock
  FROM books
  WHERE book_id = 1;

  DBMS_OUTPUT.PUT_LINE('Book ID: ' || book_id || ' | Name: ' || book_name || ' | Stock: ' || book_stock);
END;
/






SET SERVEROUTPUT ON

DECLARE
  author_id author.author_id%TYPE := 10; 
  author_name author.author_name%TYPE := 'New Author';
  age author.age%TYPE := 30;
  gender author.gender%TYPE := 'Male';
  address author.address%TYPE := 'New Address';
BEGIN
  INSERT INTO author (author_id, author_name, age, gender, address)
  VALUES (author_id, author_name, age, gender, address);

  DBMS_OUTPUT.PUT_LINE('New Row inserted successfully.');
END;
/

SELECT * FROM author;





SET SERVEROUTPUT ON

DECLARE
   book_name books.book_name%TYPE;
   book_price books.price%TYPE;

   CURSOR book_cursor IS
      SELECT book_name, price
      FROM books;
BEGIN
   OPEN book_cursor;
   FETCH book_cursor INTO book_name, book_price;

   WHILE book_cursor%FOUND LOOP
      IF book_price < 25 THEN
         DBMS_OUTPUT.PUT_LINE('Book "' || book_name || '" is affordable.');
      ELSIF book_price >= 25 AND book_price < 50 THEN
         DBMS_OUTPUT.PUT_LINE('Book "' || book_name || '" is moderately priced.');
      ELSE
         DBMS_OUTPUT.PUT_LINE('Book "' || book_name || '" is expensive.');
      END IF;
      
      FETCH book_cursor INTO book_name, book_price;
   END LOOP;

   CLOSE book_cursor;
END;
/





SET SERVEROUTPUT ON

CREATE OR REPLACE PROCEDURE GetBookDetails(p_book_id IN books.book_id%TYPE) IS
  v_book_name books.book_name%TYPE;
  v_book_price books.price%TYPE;
BEGIN
  SELECT book_name, price
  INTO v_book_name, v_book_price
  FROM books
  WHERE book_id = p_book_id;

  DBMS_OUTPUT.PUT_LINE('Book ID: ' || p_book_id || ' | Name: ' || v_book_name || ' | Price: ' || v_book_price);
EXCEPTION
  WHEN NO_DATA_FOUND THEN
    DBMS_OUTPUT.PUT_LINE('Book not found for ID: ' || p_book_id);
END;
/
BEGIN
  GetBookDetails(3); -- Replace with the desired book_id
END;
/

DROP PROCEDURE GetBookDetails;








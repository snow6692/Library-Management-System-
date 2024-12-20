create database libraryApp
 use libraryApp
 
 CREATE TABLE user (
    id INT AUTO_INCREMENT PRIMARY KEY,
    username VARCHAR(255) NOT NULL,
    email VARCHAR(255) NOT NULL UNIQUE,
    password VARCHAR(255) NOT NULL
);
CREATE TABLE books (
    book_id INT AUTO_INCREMENT PRIMARY KEY,
    book_name VARCHAR(255) NOT NULL,
    author VARCHAR(255) NOT NULL,
    copies_count INT NOT NULL
);
CREATE TABLE LoanedBooks (
    id INT AUTO_INCREMENT PRIMARY KEY,
    book_id INT NOT NULL,
    book_name VARCHAR(255) NOT NULL,
    borrower_name VARCHAR(255) NOT NULL,
    borrower_email VARCHAR(255) NOT NULL,
    FOREIGN KEY (book_id) REFERENCES books(book_id)
);
INSERT INTO user(   username, email, password) 
VALUES 
('Amr mohamed', 'theo@gmail.com', 'password123'),
('shika', 'shika@gmali.com', '1911'),
('leao', 'admain@gmail.com', '123456');
INSERT INTO user(   username, email, password) 
VALUES ('leao', 'admain@gmail.com', '123456');
-- Check if email exists
SELECT COUNT(*) FROM user WHERE email = ?;

-- Check if credentials are correct (for login)
SELECT password FROM user WHERE email = ?;

-- Insert a new book
INSERT INTO books (book_name, author, copies_count) 
VALUES ('The Catcher in the Rye', 'J.D. Salinger', 10);

INSERT INTO books (book_name, author, copies_count) 
VALUES ('To Kill a Mockingbird', 'Harper Lee', 5);

INSERT INTO books (book_name, author, copies_count) 
VALUES ('1984', 'George Orwell', 7);

INSERT INTO books (book_name, author, copies_count) 
VALUES ('Moby Dick', 'Herman Melville', 3);

INSERT INTO books (book_name, author, copies_count) 
VALUES ('Pride and Prejudice', 'Jane Austen', 8);

-- Delete a book by ID
DELETE FROM books WHERE book_id = ?;

-- Update book copies (decrease count by 1)
UPDATE books SET copies_count = copies_count - 1 WHERE book_id = ?;

-- Get all books
SELECT * FROM books;

-- Get all loaned books
SELECT * FROM LoanedBooks;

-- Insert a new loan record
INSERT INTO LoanedBooks (book_id, book_name, borrower_name, borrower_email) 
VALUES (?, ?, ?, ?);

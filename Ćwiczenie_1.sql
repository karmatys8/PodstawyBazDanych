/*
--1.
SELECT title, title_no
FROM title
*/

/*
--2.
SELECT title
FROM title
WHERE title_no = 10
*/

/*
--3.
SELECT member_no, fine_assessed
FROM loanhist
WHERE fine_assessed BETWEEN 8 AND 9
*/

/*
--4.
SELECT title_no, author
FROM title
WHERE author IN ('Charles Dickens', 'Jane Austen')
*/

/*
--5.
SELECT title_no, title
FROM title
WHERE title LIKE '%adventures%'
*/

/*
--6.
SELECT member_no, fine_assessed, fine_paid
FROM loanhist
WHERE fine_assessed > (ISNULL(fine_paid, 0) + ISNULL(fine_waived, 0))
*/

/*
--7.
SELECT DISTINCT city, state
FROM adult
*/
--1.
SELECT title
FROM title
ORDER BY title

--2.
SELECT member_no, isbn, fine_assessed, fine_assessed * 2 as "double fine"
FROM loanhist
WHERE fine_assessed != 0 AND fine_assessed IS NOT NULL

--3.2.
SELECT firstname + middleinitial + lastname AS email_name
FROM member
WHERE lastname = 'Anderson'

--3.3.
SELECT LOWER(firstname + middleinitial + SUBSTRING(lastname, 1, 2))
AS "listê proponowanych loginów e-mail"
FROM member

--4.
SELECT 'The title is: ' + title + ', title number ' + CAST(title_no as nchar)
FROM title
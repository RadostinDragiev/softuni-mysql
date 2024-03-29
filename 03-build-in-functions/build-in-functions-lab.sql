#---------- 01. Find Book Titles ----------

SELECT `title` FROM `books`
WHERE SUBSTRING(`title`, 1, 3) = 'The'
ORDER BY `id`;


#---------- 02. Replace Titles ----------

SELECT REPLACE(`title`, 'The', '***') FROM `books`
WHERE SUBSTRING(`title`, 1, 3) = 'THE'
ORDER BY `id`;


#---------- 03. Sum Cost of All Books ----------

SELECT SUM(`cost`) FROM books;


#---------- 04. Days Lived ----------

SELECT concat(`first_name`, ' ', `last_name`) AS 'Full name',
timestampdiff(day, `born`, `died`) AS 'Days Lived'
FROM `authors`;


#---------- 05. Harry Potter Books ----------
SELECT `title` FROM `books`
WHERE substring(`title`, 1, 5) = 'Harry';
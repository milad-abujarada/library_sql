-- ADVANCED / JOIN QUERIES
-- For all of these queries, you SHOULD NOT use an id # in a WHERE clause

-- Find all fields (book and author related) for all books written by George R.R. Martin.
select * from books where author_id = (select id from authors where name = 'George R.R. Martin');
or 
select * from authors join books on (books.author_id = authors.id and authors.name = 'George R.R. Martin');

-- Find all fields (book and author related) for all books written by Milan Kundera.
select * from books where author_id = (select id from authors where name = 'Milan Kundera');
or 
select * from authors join books on (books.author_id = authors.id and authors.name = 'Milan Kundera');
-- Find all books written by an author from China or the UK.
select * from authors join books on (authors.id = books.author_id and (nationality = 'China' or nationality = 'United Kingdom'));
-- Find out how many books Albert Camus wrote.
select count(name) from books join authors on (books.author_id = authors.id and authors.name = 'Albert Camus');
or
 select count(title) from books where books.author_id = (select id from authors where name = 'Albert Camus');

-- Find out how many books written before 1980 were by authors not from the US.
select count(title) from books join authors on (books.publication_date < 1980 and books.author_id = authors.id and authors.nationality != 'United States of America')
-- For these last two, you should not need a JOIN.

-- Find all authors whose names start with 'J'.
select * from authors where name like 'J%';
-- Find all books whose titles contain 'the'.
select * from books where title like '% the %';

-- 1. Create a new file called select_exercises.sql. Store your code for this exercise in that file. You should be testing your code in Sequel Ace as you go.

-- 2. Use the albums_db database

use albums_db;

-- 3. Explore the structure of the albums table.

describe albums;

    -- a. How many rows are in the albums table?

select count(*)
from albums;
        -- 33
    
    -- b. How many unique artist names are in the albums table?
    
select count(distinct(artist))
from albums;
        -- 23
        
    -- c. What is the primary key for the albums table?
    
show create table albums;
        -- id is the primary key
        
    -- d. What is the oldest release date for any album in the albums table? What is the most recent release date?
    
select release_date
from albums
order by release_date
limit 1;
        -- 1967
        
-- 4. Write queries to find the following information:

    -- a. The name of all albums by Pink Floyd
    
select artist, name
from albums
where artist = 'Pink Floyd';

    -- b. The year Sgt. Pepper's Lonely Hearts Club Band was released
    
select name, release_date
from albums
where name = 'Sgt. Pepper\'s Lonely Hearts Club Band' ;

    -- c.  The genre for the album Nevermind
    
select name, genre
from albums
where name = 'Nevermind';

    -- d. Which albums were released in the 1990s
    
select name, release_date
from albums
where release_date like '199%';

    -- e. Which albums had less than 20 million certified sales
    
select name, sales
from albums
where sales > 20;

    -- f. All the albums with a genre of "Rock". Why do these query results not include albums with a genre of "Hard rock" or "Progressive rock"?
    
select name, genre
from albums
where genre = 'Rock';
    
select name, genre
from albums
where genre like '%rock%' or genre like '%Rock%';
        -- When you query with a where clause equals a string it will only look for exact matches
        -- If you want similar matches you must use a like clause and search using wildcards 
        

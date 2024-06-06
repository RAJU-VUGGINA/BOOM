/*Exam on SQL
Exam on SQL [Time: 1 hr]
[Total Marks: 100]
Perform the following tasks, based on the SQL Dataset Marks
Q1. Write a query where it should contain all the data of the movies which were released 
after 1995 having their movie duration greater than 120 and should be including A in their
movie title.
[10]
*/
#METHOD-1
use actorsdata;

#using single query
SELECT*FROM movie 
where mov_year>1995 and mov_time>120 and mov_title like "%a%";                        

----------------------------------------------------------------------------------------------------------------------------
/*Q2. Write an SQL query to find the actors who played a role in the
movie 'Chinatown'. Fetch all the fields of actor table. (Hint: Use
the IN operator)
[10]*/
#METHOD-1 


select a.act_ID,concat(a.act_fname," ",a.act_lname) as 
Name_of_actor,mov_title,a.act_gender,
c.role from movie as m inner join 
cast as c on m.mov_id=c.mov_id 
JOIN actor as a on
c.act_id=a.act_id 
where mov_title in ("chinatown");
----------------------------------------------------------------------------------------------------------------------------
/*Q3. Write an SQL query for extracting the data from the ratings
table for the movie who got the maximum number of ratings.(862618)
[10]*/



#using join
select mov_title,num_o_ratings from movie as m join ratings as r on 
m.mov_id=r.mov_id
order by num_o_ratings desc
limit 1;

----------------------------------------------------------------------------------------------------------------------------

/*Q4. Write an SQL query to determine the Top 7 movies which were
released in United Kingdom. Sort the data in ascending order
of the movie year*/
## ANS
#note: according to question top 7 movies released in uk when data is in ascending order of year


select row_number() over() as Top_7,mov_title as MOVIE_NAME,mov_rel_country,mov_year from movie
where mov_rel_country in ("UK") 
order by mov_year asc
limit 7;

----------------------------------------------------------------------------------------------------------------------------
/*
Q5. Set the language of movie language as 'Chinese' for the movie
which has its existing language as Japanese and their movie
year was 2001.
[10]*/

select*from movie;
update movie set mov_lang="chineese" where mov_lang="japanese" and mov_year=2001;


----------------------------------------------------------------------------------------------------------------------------
/*Q6. Print genre title, maximum movie duration and the count the
number of movies in each genre.
[10]*/

select*from genres;
select row_number() over (), gen_title as genre,count(gen_title) as no_of_movie_in_genre , max(mov_time) as maximum_movie_duration ,
max(mov_title) as max_duration_movie_in_genre 
from movie as M join movie_genres as Mg
on M.mov_id=Mg.mov_id join genres as G
on Mg.gen_id=G.gen_id
group by gen_title
order by row_number () over () asc;

-------------------------------------------------------------------------------

/*Q7. Create a view which should contain the first name, last name,
title of the movie & role played by particular actor.
[10]*/
select*from actor;
select*from cast;
select*from movie;

create view ACTORS_INFO (ACT_ID,ACTOR_FNAME,ACTOR_LNAME,MOVIE,GENDER,ROLE_PLAYED) AS

select a.act_ID,a.act_fname,a.act_lname,mov_title,a.act_gender,c.role from movie as m inner join 
cast as c on m.mov_id=c.mov_id 
JOIN actor as a on
c.act_id=a.act_id ;

SELECT*FROM actors_INFO;

----------------------------------------------------------------------------------------------------------------------------
/*
Q8. Display the movies that were released before 31st March 1995. [10]
Exam on SQL*/

select * from movie;

select extract(YEAR from mov_dt_rel) from movie;

# here mov_dt_rel is in not in data format lets check in which format it is

desc movie; # it is in text format 

select date_format(mov_dt_rel,"%m-%d-%y") as mov_dt from movie;






#Answer due to text format of data in mov_dt_rel in movie we are changing format of data into date
#clone a table like movie

/*
create table movie_clone (select*from movie);
select* from movie_clone;
alter table movie_clone alter mov_dt_rel date;
update movie_clone set date_in_datefomt=str_to_date(mov_dt_rel) 


select mov_title, mov_dt_rel from movie where (mov_dt_rel<1995-03-31) and mov_dt_rel is not null;
desc movie;
alter table movie add mov_dt_rel_date_2 date;
UPDATE movie SET mov_dt_rel = STR_TO_DATE(mov_dt_rel, '%m-%d-%y'); */
select Mov_title,mov_year from movie where  mov_year>1995-03-31;
select * from movie;
select (convert(mov_dt_rel,date)) from movie;
alter table movie add mov_dt_rel_date date ;
insert into  movie (mov_dt_rel_date)values((select mov_dt_rel  as mov_date from movie)); 


----------------------------------------------------------------------------------------------------------------------------
/*
Q9. Write a query which fetch the first name, last name & role
played by the actor where output should all exclude Male
actors.
[10]*/
select*from actors_info where gender="f";
#(or)
select*from actors_info where gender not in  ("m");

-----------------------------------------------------------------------------------------------------------------------

/*Q10. Insert five rows into the cast table where the ids for movie
should be 936,939,942,930,941 and their respective roles
should be Darth Vader, Sarah Connor, Ethan Hunt, Travis
Bickle, Antoine Doinel & their actor ids should be set up as
126,140,135,131,144.
[10]*/
select*from cast;
insert into cast (act_id,role,mov_id)
values(126,"Darth Vader",936),
(140, "Sarah Connor",939),  
(135,"Ethan Hunt", 942),
(131,"Travis Bickle",930),
(144,"Antoine Doinel",941);





use sakila;
show databases;


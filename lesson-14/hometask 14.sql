use W3Resource

--1. From the following table, write a SQL query to find the actors who played a role in the movie 'Annie Hall'. Return all the fields of actor table.
select * from Movies.Actor
select * from Movies.Movie_cast
select * from Movies.Movie

select * from Movies.Actor
where act_id in (select act_id from Movies.Movie_cast where mov_id = (select mov_id from Movies.Movie where mov_title = 'Annie Hall'))
---2. From the following tables, write a SQL query to find the director of a film that cast a role in 'Eyes Wide Shut'. Return director first name, last name.
select * from Movies.Movie
select * from Movies.Movie_cast
select * from Movies.Director
select * from Movies.Movie_Direction

select dir_fname,dir_lname from Movies.Director
where dir_id in (select dir_id from Movies.Movie_Direction where mov_id in (select mov_id from Movies.Movie_cast where mov_id 
in (select mov_id from Movies.Movie where mov_title= 'Eyes Wide Shut')))
--3. From the following table, write a  SQL query to find those movies that have been released in countries other than the United Kingdom. Return movie title, movie year, movie time, and date of release, releasing country.
select * from Movies.Movie
where mov_rel_country <> 'UK'
select* from Movies.Movie
where mov_rel_country not in (select mov_rel_country from Movies.Movie where mov_rel_country = 'UK')
--4. From the following tables, write a SQL query to find for movies whose reviewer is unknown. Return movie title, year, release date, director first name, last name, actor first name, last name.
select * from Movies.Movie
select * from Movies.Actor
select * from Movies.Movie_cast
select * from Movies.Director
select * from Movies.Movie_Direction
select * from Movies.Rating
select * from Movies.Reviewer

select  mov_title,mov_year,mov_dt_rel,dir_fname,dir_lname,act_fname,act_lname from Movies.Movie,Movies.Director,Movies.Actor
where mov_id in (select mov_id from Movies.Movie_cast where act_id in (select act_id from Movies.Actor
where rev_name is null))


select  mov_title,mov_year,mov_dt_rel,dir_fname,dir_lname,act_fname,act_lname from Movies.Movie,Movies.Director,Movies.Actor
where act_id in (select act_id from Movies.Movie_cast where mov_id in (select mov_id from Movies.Rating where rev_id in (select rev_id from Movies.Reviewer where rev_name is null))) 


select  mov_title,mov_year,mov_dt_rel,dir_fname,dir_lname,act_fname,act_lname from Movies.Movie a,Movies.Director b,Movies.Actor c,Movies.Movie_cast d,Movies.Movie_Direction e, Movies.Rating
f,Movies.Reviewer g
where a.mov_id=f.mov_id and
f.rev_id=g.rev_id and
a.mov_id=d.mov_id and
d.act_id=c.act_id and
a.mov_id=e.mov_id and
e.dir_id=b.dir_id and rev_name is null
---5. From the following tables, write a SQL query to find those movies directed by the director whose first name is Woddy and last name is Allen. Return movie title.
select * from Movies.Movie
select * from Movies.Director
select * from Movies.Movie_Direction

select mov_title from Movies.Movie
where mov_id = any ( select mov_id from Movies.Movie_Direction where dir_id = any (select dir_id  from Movies.Director where dir_fname='Woody' and dir_lname='Allen'))

--6. From the following tables, write a  SQL query to determine those years in which there was at least one movie that received a rating of at least three stars. Sort the result-set in ascending order by movie year. Return movie year.
select * from Movies.Movie
select * from Movies.Rating

select distinct mov_year from Movies.Movie
where mov_id = any ( select mov_id from Movies.Rating where rev_stars >=3)
--7. From the following table, write a SQL query to search for movies that do n0t h0000any ratings. Return movie title.
select mov_title from Movies.Movie
where mov_id in ( select mov_id from Movies.Movie where mov_id not in (select mov_id from Movies.Rating))
--8. From the following table, write a SQL query to find those reviewers who have not given a rating to certain films. Return reviewer name.
select * from Movies.Rating
select * from Movies.Reviewer
select * from Movies.Movie
select rev_name from Movies.Reviewer
where rev_id  in (select rev_id from Movies.Rating where rev_stars is null)
--9. From the following tables, write a SQL query to find movies that have been reviewed by a reviewer and received a rating.
--Sort the result-set in ascending order by reviewer name, movie title, review Stars. Return reviewer name, movie title, review Stars.

select * from Movies.Movie
select * from Movies.Reviewer
select * from Movies.Rating

select mov_title,rev_name,rev_stars from Movies.Movie t1,Movies.Reviewer t2,Movies.Rating t3
where  t1.mov_id=t3.mov_id and t2.rev_id=t3.rev_id
and rev_stars is not null


select mov_title,rev_name,rev_stars from Movies.Movie t1
join Movies.Rating t3 on t1.mov_id=t3.mov_id
 join Movies.Reviewer t2 on t2.rev_id=t3.rev_id           
 where rev_stars is not null and t3.rev_id in (select rev_id from Movies.Reviewer) and rev_name is not null
 --10. From the following table, write a  SQL query to find movies that have been reviewed by a reviewer and received a rating.
 --Group the result set on reviewer’s name, movie title. Return reviewer’s name, movie title.
 select * from Movies.Movie
select * from Movies.Reviewer
select * from Movies.Rating
select * from Movies.Movie
select rev_name from Movies.Reviewer


 select mov_title ,rev_name from Movies.Movie t1
 join Movies.Rating t2 on t1.mov_id =t2.mov_id
 join Movies.Reviewer t3  ON t3.rev_id=t2.rev_id
 where t1.mov_id = any (select mov_id from Movies.Rating where rev_stars is not null and rev_id = any (select rev_id from Movies.Reviewer t1 where rev_name is not null))
 group by mov_title,rev_name
 having count(*)>1

 select mov_title,rev_name from Movies.Movie a,Movies.Reviewer b,Movies.Rating c,Movies.Rating d
 where a.mov_id=c.mov_id and b.rev_id=c.rev_id and d.rev_id=b.rev_id
 group by rev_name,mov_title
 having count(*)>1
 --11. From the following tables, write a SQL query to find those movies, which have received highest number of stars.
 --Group the result set on movie title and sorts the result-set in ascending order by movie title. Return movie title and maximum number of review stars.
 select * from Movies.Rating
 select mov_title, max(rev_stars)  from Movies.Movie t1,Movies.Rating t2
 where t1.mov_id in (select max(mov_id) from Movies.Rating )
 group by mov_title
 order by rev_stars
 --12. From the following tables, write a SQL query to find all reviewers who rated the movie 'American Beauty'. Return reviewer name.

  select * from Movies.Movie
select * from Movies.Reviewer
select * from Movies.Rating

select rev_name from Movies.Reviewer
where rev_id in (select rev_id from Movies.Rating where mov_id in (select mov_id from Movies.Movie where mov_title='American Beauty'))

--13. From the following table, write a  SQL query to find the movies that have not been reviewed by any reviewer body other than 'Paul Monks'. Return movie title.
 select mov_title from Movies.Movie
 where mov_id in (select mov_id from Movies.Rating where rev_id  not in (select rev_id from Movies.Reviewer where rev_name = 'Paul Monks'))
 --14. From the following table, write a SQL query to find the movies with the lowest ratings. Return reviewer name, movie title, and number of stars for those movies.
 select rev_name,mov_title from Movies.Rating c ,Movies.Reviewer b,Movies.Movie a
 where a.mov_id=c.mov_id and c.rev_id=b.rev_id and rev_stars =(select min(rev_stars) from Movies.Rating)

 --15. From the following tables, write a SQL query to find the movies directed by 'James Cameron'. Return movie title.
 select * from Movies.Movie
 select * from Movies.Director
 select * from Movies.Movie_Direction

  select mov_title from Movies.Movie
  where mov_id in (select mov_id from Movies.Movie_Direction where dir_id in (select dir_id from Movies.Director where  dir_fname= 'James' and  dir_lname =  'Cameron'))

  --16. Write a query in  SQL to find the movies in which one or more actors appeared in more than one film.
 select * from Movies.Movie
  select * from Movies.Movie_cast
   select * from Movies.Actor

 select mov_title from Movies.Movie
 where mov_id in (select mov_id from Movies.Movie_cast where act_id in (select act_id from Movies.Movie_cast  group by act_id having count(act_id )>1))
 ------------------------

 --Homework for recursive cte. Find the hierarchial level of people

create table PostDef(postid int, definition varchar(25))
insert into PostDef values (0, 'Director'), (1, 'Deputy Director'), (2, 'Executive Director'), (3, 'Department head'), 
              (4, 'Manager'), (5, 'Senior officer'), (6, 'Junior Officer'), (7, 'Intern')

			  create table Hierarchy(id int, name varchar(100), manager_id int, manager varchar(100))

insert into Hierarchy values 
(150, 'John Ryden', 111, 'Jack Tarkowski'),
(165, 'Sara Miller', 111, 'Jack Tarkowski'), 
(180, 'Rebecca Carson', 211, 'Thomas Kim'), 
(107, 'Sean Sullivan', 180, 'Rebecca Carson'), 
(142, 'Floyd Kan', 122, 'Alex Pereira'), 
(122, 'Alex Pereira', 107, 'Sean Sullivan'), 
(111, 'Jack Tarkowski', 107, 'Sean Sullivan'), 
(211, 'Thomas Kim', 191, 'Nicolas Jackson'), 
(177, 'Michael Rim', Null, Null), 
(191, 'Nicolas Jackson', 177, 'Michael Rim')


 
 select * from PostDef
 select * from Hierarchy

 with empoloyeeorder as (select *, 0 as Level_hierarch  from Hierarchy t4   where manager_id is not null 
 union all
 select t1.*,t2.Level_hierarch +1 from Hierarchy t1  join empoloyeeorder t2 on t2.manager_id=t1.id join PostDef t3 on t3.postid=t2.Level_hierarch +1 )
 select distinct *from empoloyeeorder


 join PostDef t3 on t3.postid=t2.Level_hierarch

 WITH HierarchyCTE AS (SELECT  h.*,  0 AS Level FROM Hierarchy h WHERE h.manager_id IS NULL
    UNION ALL
 SELECT 
        h.*, 
        hc.Level + 1
    FROM Hierarchy h
    INNER JOIN HierarchyCTE hc ON h.manager_id = hc.id
)
SELECT 
    h.*, 
    hc.Level,
    pd.definition AS Occupation
FROM Hierarchy h
JOIN HierarchyCTE hc ON h.id = hc.id
JOIN PostDef pd ON pd.postid = hc.Level
ORDER BY hc.Level, h.name;

select * from PostDef
select * from Hierarchy
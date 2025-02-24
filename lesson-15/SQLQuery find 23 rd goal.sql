with cte as(
select  *, sum(goal_score) over (order by match_no) gls from soccer.match_details)
select top 1*  from cte
where gls >= 23
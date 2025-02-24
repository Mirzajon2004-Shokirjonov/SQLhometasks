INSERT INTO #Routes (RouteID, DepartureCity, ArrivalCity, Cost) VALUES
(1, 'Tashkent', 'Andijan', 150),
(2, 'Andijan', 'Fergana', 200),
(3, 'Fergana', 'Namangan', 250),
(4, 'Namangan', 'Kokand', 300),
(5, 'Tashkent', 'Nukus', 350),
(6, 'Nukus', 'Urgench', 400);
GO

 
SELECT * FROM #Routes;
with cte as (select cast(departureCity +'->' +arrivalcity as varchar(max) ) as Route, Arrivalcity,cost as c  from #routes   where departurecity='Tashkent'
union all
select cast(c.Route+'->'+r.arrivalcity as varchar(max)) as Ro  , r.Arrivalcity,cost +r.cost as Xarajat from  #routes R join cte c on r.departurecity=c.Arrivalcity 
 )
select   *  from cte
where arrivalcity='Namangan'

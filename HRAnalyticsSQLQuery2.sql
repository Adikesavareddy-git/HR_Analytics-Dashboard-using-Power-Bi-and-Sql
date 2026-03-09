
select * from ['HR data$'] ;
select sum( [Employee Count])  from  ['HR data$'] ;--Ans 1470

select sum( [Employee Count])  AS HighSchool from  ['HR data$'] 
	where Education = 'High School '; --  Ans 170

select sum( [Employee Count])  AS Department from  ['HR data$'] 
	--where Department = 'R&D';-- Ans 961
where [Education Field] = 'Medical';-- Ans 464

select count(Attrition)  from  ['HR data$']
where  Attrition = 'Yes'And Department = 'R&D'
AND [Education Field] = 'Medical'
And Education = 'High School'; --Ans 237 And  133 And 47 And 9

select round(((select count(Attrition)  As AttritionPercentage from  ['HR data$'] where  Attrition = 'Yes')/
sum ([Employee COUNT]) )* 100 ,2) from ['HR data$']
where Department = 'sales'; -- Ans 16.12% and 53.14%

select sum([Employee Count]) - (select count(Attrition) from ['HR data$'] where Attrition = 'Yes')
 As TotalEmployee from ['HR data$'] where Gender = 'Male' ;   -- Ans 1233 and 645

 select round(avg(age),0) as Avg_age from ['HR data$']; -- Ans  37
 
 -- attrition by gender 
 select Gender , count(Attrition) from ['HR data$']
 where Attrition = 'Yes'
 Group By Gender
 order by  count(Attrition)desc;-- M=150 ,F = 87

 select Department , count(Attrition),
  round((cast(count(Attrition) as numeric) 
  / (select count(Attrition) from ['HR data$'] where Attrition = 'Yes'))   * 100,2)
  from ['HR data$']
 where Attrition = 'Yes' and Gender = 'Male'
 Group By Department
 order by  count(Attrition)desc;

 select age ,sum([Employee Count]) from ['HR data$']
 group by age
 order  by age;

 select [CF_age band],
 Gender , Count(Attrition) AS Attrition_count,
  round(
  cast(count(Attrition) as numeric)/ 
  (select count(Attrition) from ['HR data$'] where Attrition = 'Yes')*100,2)as pct from ['HR data$']
 where Attrition = 'Yes' 
 Group By [CF_age band],Gender 
 order By [CF_age band],Gender;


 SELECT *
FROM
(
    SELECT 
        [Job Role],
        [Job Satisfaction],
        [Employee Count]
    FROM ['HR data$']) AS source_table
PIVOT
(
    SUM([Employee Count])
    FOR [Job Satisfaction] IN ([1], [2], [3], [4])
) AS pivot_table
ORDER BY [Job Role];


 select [CF_age band],
 Gender ,SUM([Employee Count]) FROM ['HR data$']
Group By [CF_age band],Gender 
 order By [CF_age band],Gender;
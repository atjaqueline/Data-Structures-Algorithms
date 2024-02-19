select F1.X,
       F1.Y
from Functions as F1
inner join Functions as F2
on F1.X = F2.Y and F1.Y = F2.X
group by F1.X, F1.Y
having F1.X < F1.Y                 -- for cases where X1 != Y1 (i.e. for symmetric pairs 2 24, and 24 2)
       or count(F1.X) > 1          -- for cases where X1 = Y1 (i.e. for symmetric pairs 10 10, and 10 10. Note that there need to be two separate pairs)
order by F1.X;
-- 
SELECT player_name,
       weight,
       CASE WHEN weight > 250 THEN 'over 250'
            WHEN weight > 200 THEN '201-250'
            WHEN weight > 175 THEN '176-200'
            ELSE '175 or under' END AS weight_group
  FROM benn.college_football_players

  --

  SELECT COUNT(CASE WHEN year = 'FR' THEN 1 ELSE NULL END) AS fr_count,
       COUNT(CASE WHEN year = 'SO' THEN 1 ELSE NULL END) AS so_count,
       COUNT(CASE WHEN year = 'JR' THEN 1 ELSE NULL END) AS jr_count,
       COUNT(CASE WHEN year = 'SR' THEN 1 ELSE NULL END) AS sr_count
  FROM benn.college_football_players

  --

  SELECT companies.permalink,
       companies.name,
       companies.status,
       COUNT(investments.investor_permalink) AS investors
  FROM tutorial.crunchbase_companies companies
  LEFT JOIN tutorial.crunchbase_investments_part1 investments
    ON companies.permalink = investments.company_permalink
   AND investments.funded_year > companies.founded_year + 5
 GROUP BY 1,2, 3

 --
 Select D.Name as Doctor_name,
       P.Name as Professor_name,
       S.Name as Singer_name,
       A.Name as Actor_name
from(
    (Select Name,
            row_number() over (partition by occupation
                               order by name) as id
     from Occupations
     where Occupation = 'Doctor') as D
    full outer join
    (Select Name,
            row_number() over (partition by occupation
                               order by name) as id
     from Occupations
     where Occupation = 'Professor') as P
    on D.id = P.id
    full outer join
    (Select Name,
            row_number() over (partition by occupation
                               order by name) as id
     from Occupations
     where Occupation = 'Singer') as S
    on P.id = S.id
    full outer join
    (Select Name,
            row_number() over (partition by occupation
                               order by name) as id
     from Occupations
     where Occupation = 'Actor') as A
    on S.id = A.id
   );
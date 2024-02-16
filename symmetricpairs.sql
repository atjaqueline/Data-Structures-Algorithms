select F1.X,
       F1.Y
from Functions as F1
inner join Functions as F2
on F1.X = F2.Y and F1.Y = F2.X
group by F1.X, F1.Y
having F1.X < F1.Y                 -- for cases where X1 != Y1 (i.e. for symmetric pairs 2 24, and 24 2)
       or count(F1.X) > 1          -- for cases where X1 = Y1 (i.e. for symmetric pairs 10 10, and 10 10. Note that there need to be two separate pairs)
order by F1.X;
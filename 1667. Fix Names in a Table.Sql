
Example 1:

Input: 
Users table:
+---------+-------+
| user_id | name  |
+---------+-------+
| 1       | aLice |
| 2       | bOB   |
+---------+-------+
Output: 
+---------+-------+
| user_id | name  |
+---------+-------+
| 1       | Alice |
| 2       | Bob   |
+---------+-------+

soln:

select  user_id ,
Concat(upper(SUBSTRING(name ,1,1 )),lower(SUBSTRING(name,2,LEN(name)))) as name 
from    Users
ORDER BY user_id

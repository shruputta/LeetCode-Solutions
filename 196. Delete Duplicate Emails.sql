Write a solution to delete all duplicate emails, keeping only one unique email with the smallest id.

For SQL users, please note that you are supposed to write a DELETE statement and not a SELECT one.


Example 1:

Input: 
Person table:
+----+------------------+
| id | email            |
+----+------------------+
| 1  | john@example.com |
| 2  | bob@example.com  |
| 3  | john@example.com |
+----+------------------+
Output: 
+----+------------------+
| id | email            |
+----+------------------+
| 1  | john@example.com |
| 2  | bob@example.com  |
+----+------------------+
Explanation: john@example.com is repeated two times. We keep the row with the smallest Id = 1.



soln:

------First Method------

With Ranked_Email As (
select id,email,          
Row_number() over(partition  by email order by  id  ) as rn
FROM Person 
)

DELETE FROM  Ranked_Email
WHERE rn>1


------Second Method------
DELETE  p1
FROM
Person p1
JOIN Person p2
ON p1.email=p2.email
AND  p1.id>p2.id 

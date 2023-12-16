select e1.reports_to as employee_id  ,
       e2.name,
       count(e1.reports_to) as reports_count,
    ROUND(AVG(CAST(e1.age AS decimal)), 0) as average_age 
FROM employees e1
join employees e2
ON e1.reports_to =e2.employee_id
group by  e1.reports_to,e2.name
order by   e1.reports_to


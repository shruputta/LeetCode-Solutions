SELECT E.employee_id 
from Employees E
WHERE salary<30000
      AND manager_id IS NOT NULL
      AND NOT EXISTS(SELECT 1 FROM Employees M
                      WHERE M.employee_id = E.manager_id   ) 
ORDER BY employee_id 

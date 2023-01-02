
Tasks
Task 1. Find the average salary of employees working in the department 41. Table s_еmp.<br />
Найдите среднюю заработную плату сотрудников, работающих в отделе 41. Таблица s_emp.удников, работающих в отделе 41. Таблица s_emp.<br />

```SELECT round(AVG(salary), -2) From  employees WHERE department_id=50;```


Task 2. To return the department numbers, which have the lowest salary of employees less 1000.<br />
Вернуть номера отделов, у которых самая низкая зарплата сотрудников меньше 1000.<br />
```SELECT department_id FROM employees GROUP BY department_id HAVING MIN(salary) < 10000;```



Task 3. To return average annual salary by department. The department numbers in ascending.<br /> 
Вернуть среднюю годовую заработную плату по отделам. Номера отделов в порядке возрастания.<br />
```SELECT department_id, round(AVG(salary), 2) FROM employees order by department_id;```
```SELECT department_id, round(AVG(salary), 2) FROM employees GROUP BY department_id  order by department_id;``` 



Придумать 2 своих запроса:<br />
```SELECT department_id, round(AVG(salary), 2) FROM employees where salary> 4400 GROUP BY department_id order by department_id;```

```SELECT department_id, AVG(COMMISSION_PCT) FROM employees where commission_pct != 0  GROUP BY department_id order by department_id;```

 

 

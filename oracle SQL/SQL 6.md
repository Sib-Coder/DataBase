Задания:<br />
Все запросы из лекции. <br />

Создать три своих запроса с рекурсией, используя лекционный материал.<br />
Запросы из лекций:<br />
```SELECT employee_id, last_name, department_id, manager_id, salary, hire_date FROM employees WHERE manager_id IS NULL;``` 


```SELECT e.last_name "Employee", m.last_name "Manager" FROM employees e, employees m WHERE e.manager_id = m.employee_id;```




```SELECT e.last_name "Employee", m.last_name "Manager" FROM employees e LEFT OUTER JOIN employees m ON e.manager_id = m.employee_id;```




```SELECT employee_id, last_name, department_id, manager_id, salary, hire_date FROM employees e WHERE employee_id NOT IN (SELECT manager_id FROM employees  WHERE manager_id IS NOT NULL);```



```SELECT e_top.last_name, e_2.last_name, e_3.last_name, e_4.last_name FROM employees e_top LEFT OUTER JOIN employees e_2 ON e_top.employee_id = e_2.manager_id LEFT OUTER JOIN employees e_3 ON e_2.employee_id = e_3.manager_id LEFT OUTER JOIN employees e_4 ON e_3.employee_id = e_4.manager_id WHERE e_top.manager_id IS NULL;```



```SELECT last_name, employee_id, manager_id FROM employees START WITH manager_id IS NULL CONNECT BY PRIOR employee_id = manager_id;```
 


```SELECT last_name, employee_id, manager_id FROM employees START WITH UPPER(last_name) = 'JONES' CONNECT BY manager_id = PRIOR employee_id;```






```SELECT last_name, employee_id, manager_id FROM employees START WITH hire_date = (SELECT MIN(hire_date) FROM employees) CONNECT BY manager_id = PRIOR employee_id;```

 


```SELECT level, last_name, employee_id, manager_id FROM employees START WITH manager_id IS NULL CONNECT BY manager_id = PRIOR employee_id;```
 


Показывает поддерево, корнем которого является сотрудник из отдела 80 с максимальными комиссионными<br />

```SELECT level, last_name, employee_id, manager_id FROM employees START WITH department_id = '80' AND commission_pct = (SELECT MAX(commission_pct) FROM employees) CONNECT BY manager_id = PRIOR employee_id ORDER BY level;```




показывает количество подчиненных у каждого менеджера<br />

```SELECT COUNT(*)"Subordinate", "Manager" FROM (SELECT e.last_name "Employee", m.last_name "Manager" FROM employees e LEFT OUTER JOIN employees m ON e.manager_id = m.employee_id) GROUP BY "Manager";```



показывает самых младших менеджеров<br />

```SELECT employee_id, last_name, first_name FROM employees WHERE employee_id IN (SELECT manager_id FROM employees e WHERE employee_id NOT IN (SELECT manager_id FROM employees WHERE manager_id IS NOT NULL));```



Свои запросы  на основе материала из лекций:
Обход дерева, начиная с корневого узла, где salary максимально.<br />
```SELECT last_name, employee_id, manager_id FROM employees START WITH salary = (SELECT max(salary) FROM employees) CONNECT BY manager_id = PRIOR employee_id;```


Обход дерева, начиная с корневого узла, где commission_pct is NULL.<br />
```SELECT last_name, employee_id, manager_id FROM employees START WITH commission_pct is not NULL CONNECT BY manager_id = PRIOR employee_id;```

Обход дерева, начиная с корневого узла, где last_name='Kochhar'.<br />
```SELECT last_name, employee_id, manager_id FROM employees START WITH last_name='Kochhar' CONNECT BY manager_id = PRIOR employee_id;```



 





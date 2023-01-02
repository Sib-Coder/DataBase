Напишите запрос в SQL для отображения полного имени (имя и фамилия) сотрудника с идентификатором и названием страны, в которой он в настоящее время работает.<br />
```SQL
SELECT first_name, last_name, employee_id, country_name FROM departments NATURAL JOIN locations RIGHT OUTER JOIN employees USING(department_id) LEFT OUTER JOIN countries USING(country_id);
```

Запрос с которым мы проверяли объединение:<br />
```SQL
SELECT first_name, last_name, employee_id, country_name, region_name FROM employees LEFT OUTER JOIN departments using(department_id) LEFT OUTER JOIN locations using(location_id) LEFT OUTER JOIN countries USING(country_id) LEFT OUTER JOIN regions USING(region_id);
```

Напишите запрос в SQL для отображения названия отдела и количества сотрудников в каждом из отделов.<br />
```SQL
SELECT department_name, COUNT(employee_id) FROM departments LEFT OUTER JOIN employees USING(department_id) GROUP BY department_name;
```

Напишите запрос в SQL для отображения полного имени (имя и фамилия), должности, даты начала и окончания последних заданий для тех сотрудников, которые работали без комиссионных процентов.<br />
```SQL
SELECT first_name, last_name, job_title, start_date, end_date FROM employees INNER JOIN job_history USING(employee_id) LEFT OUTER JOIN jobs ON job_history.job_id = jobs.job_id WHERE commission_pct IS NULL;
```

Напишите запрос в SQL для отображения полного имени (имя и фамилия) и заработной платы тех сотрудников, которые работают в любом отделе, расположенном в Лондоне.<br />
```SQL
SELECT first_name , last_name, salary from employees INNER JOIN departments USING(department_id) INNER JOIN locations USING(location_id) where city ='London';
```

Напишите запрос в SQL для отображения идентификатора сотрудника, названия должности, количества отработанных дней для всех этих заданий в отделе 80.<br />
```SQL
SELECT employee_id, job_title, (end_date - start_date) from employees inner JOIN job_history using(employee_id) left outer join jobs on job_history.job_id =jobs.job_id WHERE job_history.department_id =80;
```

Напишите запрос в SQL для отображения названия отдела, полного имени (имя и фамилия) менеджера и их города.<br />
```SQL
SELECT department_name, first_name, last_name, city from departments left OUTER join locations using(location_id) Left outer JOIN employees on departments.manager_id = employees.employee_id;
```

Напишите запрос в SQL для отображения названия страны, города и номера тех отделов, где работают по крайней мере 2 сотрудника.<br />
```SQL
SELECT department_id, country_name, city FROM departments NATURAL JOIN locations NATURAL JOIN countries LEFT OUTER JOIN employees USING(department_id) GROUP BY department_id, country_name, city HAVING COUNT(employee_id) > 2;
```

Для каждого сотрудника отобразите имя, фамилию, номер отдела и название отдела.<br />
```SQL
SELECT first_name, last_name, department_id, department_name FROM employees LEFT OUTER JOIN departments USING(department_id);
```

Отобразите имя, фамилию, номер отдела и название отдела для всех сотрудников в отделах 50 или 90.<br />
```SQL
SELECT first_name, last_name, department_id, department_name FROM employees LEFT OUTER JOIN departments USING(department_id) WHERE department_id = 50 OR department_id = 90;
```

Для каждого отдела отобразите название отдела, город и провинцию штата.<br />
```SQL
SELECT first_name, last_name, department_name, city, state_province FROM departments LEFT OUTER JOIN locations RIGHT OUTER JOIN employees USING(department_id);
```



Для каждого сотрудника укажите полное имя, название отдела, город и провинцию штата.<br />
```SQL
SELECT department_name, city, state_province FROM departments NATURAL JOIN locations;

SELECT department_name, city, state_province FROM departments LEFT OUTER JOIN location  using(location_id);
```


Отобразите полное имя, название отдела, город и провинцию штата для всех сотрудников, фамилия которых содержит букву а.<br />
```SQL
SELECT first_name, last_name, department_name, city, state_province FROM departments NATURAL JOIN locations RIGHT OUTER JOIN employees USING(department_id) WHERE last_name LIKE '%a%';

SELECT first_name, last_name, department_name, city, state_province FROM departments LEFT OUTER JOIN locations USING(location_id) RIGHT OUTER JOIN employees USING(department_id) WHERE last_name LIKE '%a%';
```


`+` примеры все из файла присоединиться примеры
Примеры:
+ Выводит номера, фамилии сотрудников и номера их отделов для тех сотрудников, у которых номера их менеджеров и менеджеров департаментов совпадают:<br />
```SQL
SELECT employees.employee_id, employees.last_name, employees.department_id FROM employees, departments WHERE employees.manager_id = departments.manager_id;
```

+ Выводит номера, фамилии, зарплаты сотрудников и названия работ где зарплата сотрудника превышает минимальную зарплату:<br />
```SQL
SELECT employees.employee_id, employees.last_name, employees.salary, jobs.job_title FROM employees, jobs WHERE employees.salary > jobs.min_salary ORDER BY employees.employee_id;
```

+ Выводит айди работ у которых минимальное значение зарплат совпадают с максимальными значениями:<br />
```SQL
SELECT t1.job_id, t2.job_id FROM jobs t1, jobs t2 WHERE t1.min_salary = t2.max_salary;
```

+ Выводит фамилии сотрудников и название их работ: <br />
```SQL
SELECT last_name, job_title FROM employees NATURAL JOIN jobs;
```

+ Выводит декартово произведение таблиц countries и regions: <br />
```SQL
SELECT country_id, country_name, region_name FROM countries CROSS JOIN regions;
```

+ выводит все столбцы и все записи из таблиц jobs и job_history: <br />
```SQL
SELECT * FROM job_history FULL OUTER JOIN jobs USING(job_id);
```

+ выводит все столбцы и записи, совпадающие или принадлежащие только job_history: <br />
```SQL
SELECT * FROM job_history LEFT OUTER JOIN jobs USING(job_id);
```

+ выводит все столбцы и записи, совпадающие или принадлежащие только jobs: <br />
```SQL
SELECT * FROM job_history RIGHT OUTER JOIN jobs USING(job_id);
```

+ выводит все столбцы и все совпадающие записи из таблиц jobs и job_history: <br />
```SQL
SELECT * FROM job_history INNER JOIN jobs USING(job_id);
```



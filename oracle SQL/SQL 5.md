Задания: <br />
Вернуть имена, наименование отдела для сотрудников, получающих ту же зарплату, что и «URGUHART»<br />
```select first_name, last_name, department_id, salary from employees where salary=(select salary from employees where last_name ='Abel');```


Возвратите отделы и среднюю зарплату для каждого отдела, где средняя зарплата для отдела больше, чем средняя зарплата для всех сотрудников.<br />
```select department_id,AVG(salary) from employees GROUP by department_id having  avg(salary) >(select avg(salary) from employees);```

Вернуть наименование должности сотрудника и имя сотрудника, отдела, в котором работает сотрудник по имени «midori»<br />
```select department_name, last_name from departments a right join employees b on(a.department_id=b.department_id) where last_name=any(select last_name from employees where last_name='Abel');```

Сделать запросы с  функциями ALL ANY SOME<br />
Выбрать имя, фамилию, зарплату, где фамилия любая, где имя ‘John’<br />
```select first_name, last_name, salary from employees where last_name=any(```select last_name from employees where first_name='John');```

Выбрать имя, фамилию, зарплату у работников, у которых зарплата некотороя, где зарплата >6000<br />
```select first_name, last_name, salary from employees where salary=some(select salary from employees where salary>6000);```

Выбрать имена, зарплату работников,у которох зарплата больше всех, где имя ‘Donald’ или имя ‘John’<br />
```select first_name, salary from employees where salary>all(select salary from employees where first_name='Donald' or first_name='John' ) order by salary;```

Придумать коррелированный запрос<br />
Выбрать имена, зарплату, где зарплата=любой, где в фамилии встречается a и в имени встречается a(имя-ссылка на внешний запрос)<br />
 
```select a.first_name, a.salary from employees a where a.salary=any(select b.salary from employees b where b.last_name like '%a%' and a.first_name like '%a%')order by a.salary;```

Придумать многостолбцовый запрос и использовать его в WHERE или в HAVING<br />
Выбрать фамилии, коммисионные, где фамилия, коммисионные совпадают  как у сотрудника, у которого есть в имени a (одного и того же)<br />
```select last_name, nvl(commission_pct,-1) from employees where (last_name, nvl(commission_pct, -1)) in(select last_name, nvl(commission_pct,-1) from employees where first_name like '%a%');```


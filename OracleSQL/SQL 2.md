Задания:<br />
Задание 1. Вывести фамилию, должность в нижнем регистре и номер отдела для всех сотрудников у кого зарплата за полугодие меньше 12000. Таблица s_emp.<br />
```SQL
SELECT last_name, lower(job_id), department_id from employees WHERE salary < 12000;
```

Задание 2. Вывод имени без последнего символа и номера отдела для сотрудника по фамилии «NGAO» (независимо от регистра). Таблица s_emp.<br />
Какая фамилия была такую и взял)))<br />
```SQL
SELECT substr(first_name, 1, (length(first_name)-1)), department_id from employees WHERE last_name = 'Vargas';
```

Задание 3. Вывод имени в нижнем регистре, зарплаты за год, округленной до сотен, для всех сотрудников, кроме сотрудника с фамилией «biri» (независимо от регистра). Упорядочить по убыванию зарплаты. Таблица s_emp.<br />
```SQL
SELECT lower(last_name), lower(first_name), round(salary,-2) from employees WHERE last_name != 'Vargas' ORDER BY salary DESC;
```
Задание 4. Найти корень из 8899, усеченный до сотых. Таблица dual.<br />
```SQL
SELECT round(sqrt(8899),2) from dual;
```
Задание 5. Вывести фамилию с длиной 5 символов и комиссионные для всех служащих с зарплатой менее 1440. Таблица s_emp.<br />
```SQL
SELECT last_name, commission_pct FROM employees WHERE salary>= 1440 and LENGTH(last_name)=5 ;
```
Примеры запросов на некоторые  функции:<br />
```SQL
SELECT ascii(last_name) from employees;

SELECT CHR (49)  from dual;

SELECT LENGTH(last_name)  from employees;

SELECT NLS_LOWER(last_name)  from employees;

SELECT NLS_UPPER(last_name)  from employees;
```


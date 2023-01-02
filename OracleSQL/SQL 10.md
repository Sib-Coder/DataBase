Задания<br/>
Вывод имен в нижнем регистре, зарплаты и дат найма всех служащих, нанятых с февраля по октябрь в 1992 году. <br/>
```SQL
SELECT LOWER(first_name), salary, hire_date FROM employees WHERE hire_date BETWEEN TO_DATE ('2002/02/01', 'yyyy/mm/dd') AND TO_DATE ('2002/10/31', 'yyyy/mm/dd');
```
Вывод имени в нижнем регистре, зарплаты за квартал и стажа работы в днях для сотрудника по фамилии «Fay».<br/>
```SQL 
SELECT LOWER(first_name), ROUND(salary/4, 0),ROUND(SYSDATE - hire_date, 0) AS working_days FROM employees WHERE last_name = 'Fay';
```
Найдите количество сотрудников, которые в первом месяце отработали всего 10 дней.<br/>
```SQL 
SELECT COUNT(*) FROM employees WHERE  ROUND(LAST_DAY(hire_date)+1 - hire_date, 0) = 10;
```
Вывести всех сотрудников, которые были устроены на работу в первый день любого месяца.<br/>
```SQL
SELECT * FROM employees WHERE TO_CHAR (hire_date, 'DD') = '01';
```
Показать вчерашнюю дату в формате: Вчерашняя дата -  4 августа 2022г.<br/>
```SQL
SELECT  LOWER(TO_CHAR(SYSDATE - 1, 'DD MonthYYYY')) || 'г. - 4 августа 2022г.' AS "Date" FROM   DUAL;
```

Вывести список  сотрудников, которые были устроены на работу  в Nом году<br/>
```SQL
SELECT * FROM employees WHERE TO_CHAR (hire_date, 'YYYY') = '2002';
```

Для каждой страны показать, регион в котором он находится: 1-Europe, 2-America, 3-Asia, 4-Africa (без Join). Изучите конструкции DECODE и CASE<br/>
```SQL
SELECT country_name country,
       DECODE (region_id,
               1, 'Europe',
               2, 'America',
               3, 'Asia',
               4, 'Africa',
               'Unknown')
           region
  FROM countries;
```
Второй вариант:<br/>
```SQL
SELECT country_name
           country,
       CASE region_id
           WHEN 1 THEN 'Europe'
           WHEN 2 THEN 'America'
           WHEN 3 THEN 'Asia'
           WHEN 4 THEN 'Africa'
           ELSE 'Unknown'
   	END
       	Region
FROM countries;
```


Вывести список всех сотрудников, которые были трудоустроены на работу в марте Nго года.<br/>
```SQL
SELECT * FROM employees  WHERE TO_CHAR (hire_date, 'MM') = '03' AND TO_CHAR (hire_date, 'YYYY') = '2004';
```

Вывести сотрудника, который отработал максимальное количество дней.<br/>
```SQL
SELECT * FROM employees WHERE ROUND(SYSDATE - hire_date, 0) = (SELECT ROUND(MAX(SYSDATE - hire_date), 0) FROM employees);
```

Придумать 1 свой запрос с функцией преобразования и форматирования дат.<br/>
* Если ты забыл сегодняшнюю дату SQL тебе поможет 
```SQL
SELECT SYSDATE FROM dual;
```

* Вывести сотрудников устроившихся в определенном диапазоне.
```SQL
SELECT *  FROM employees WHERE hire_date BETWEEN TO_DATE ('2001/01/11', 'yyyy/mm/dd')and TO_DATE('2022/12/25', 'yyyy/mm/dd');
```

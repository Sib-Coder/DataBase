Задания:```
1. найти все записи, у которых  LAST_NAME  заканчивается буквой ‘a’ < /br>
```SELECT last_name from employees Where last_name  Like '%a' ;```
2. найти все записи, в которых  FIRST_NAME  содержит букву ‘l’.
```SELECT first_name from employees where first_name  Like '%l%' ;```


3. найти все записи, в которых supplier_id состоит из 3 цифр и начинается с ‘10’ и FIRST_NAME начинается на «D» (сравните с «d»)
```SELECT first_name, employee_id from employees where first_name  Like 'D%' and employee_id Like '10_' ;```



Примеры на почти все запросы:
```SELECT last_name from employees ;```

```SELECT salary from employees WHERE salary >10000 ORDER BY salary ASC;```

```SELECT salary from employees WHERE salary >10000 AND salary<=14000 ORDER BY salary ASC;```

```SELECT last_name From employees WHERE last_name Like 'D%' ;```

```SELECT last_name From employees WHERE last_name Like 'D_ll%' ;```

```SELECT last_name From employees WHERE last_name Like 'D%!%' ESCAPE '!';```

```SELECT * From employees WHERE last_name not in ('Grant' ,'Baer') ;```

```SELECT * From employees WHERE last_name in ('Grant' ,'Baer') ;```



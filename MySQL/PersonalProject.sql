# ALTER TABLE tasks MODIFY id AUTO_INCREMENT;
DROP TABLE task_for_emp;

DROP TABLE tasks;

DROP TABLE projects;

DROP TABLE employees;

create table projects
(
    id          int  not null AUTO_INCREMENT
        primary key,
    name        varchar(100)  null,
    start_date  date          null,
    end_date    date          null,
    colour      varchar(100)  null,
    description varchar(1000) null
);


create table employees
(
    id         int not null AUTO_INCREMENT
        primary key,
    login      varchar(100) not null,
    password   varchar(100) not null,
    first_name varchar(100) null,
    last_name  varchar(100) null,
    is_admin   tinyint(1)   null
);


create table tasks
(
    id          int not null AUTO_INCREMENT
        primary key,
    name        varchar(100)  null,
    start_date  date          null,
    end_date    date          null,
    project_id  int           null,
    description varchar(1000) null,
    constraint tasks_projects_fk
        foreign key (project_id) references projects (id)
);


create table task_for_emp
(
    task_id int not null,
    emp_id  int not null,
    primary key (task_id, emp_id),
    constraint task_for_emp_ibfk_1
        foreign key (task_id) references tasks (id),
    constraint task_for_emp_ibfk_2
        foreign key (emp_id) references employees (id)
);

create index emp_id
    on task_for_emp (emp_id);



alter table projects add text_colour varchar(100) null;
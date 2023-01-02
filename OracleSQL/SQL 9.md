Задание <br/>
Представления <br/>
Создать представление на основе 3х  ВАШИХ таблиц с условием отбора данных.
Обосновать необходимость создания данного представления.<br/>

Создаём таблицы:<br/>
```SQL
CREATE TABLE list_command (
    id_command   NUMBER NOT NULL,
    min_size     NUMBER,
    max_size     NUMBER,
    command_name VARCHAR2(100)
);
ALTER TABLE list_command ADD CONSTRAINT list_command_pk PRIMARY KEY ( id_command );
CREATE TABLE member (
    id                           NUMBER NOT NULL,
    firs_name                    VARCHAR2(100),
    last_name                    VARCHAR2(100),
    phone_number                 VARCHAR2(11),
    list_command_id_command      NUMBER NOT NULL,
    position_in_team_id_position NUMBER NOT NULL,
    nickname                     VARCHAR2(100),
    place_of_study_id_student    NUMBER NOT NULL
);
CREATE UNIQUE INDEX member__idx ON
    member (
        place_of_study_id_student
    ASC );
ALTER TABLE member ADD CONSTRAINT member_pk PRIMARY KEY ( id );
CREATE TABLE seminars (
    id_seminar              NUMBER NOT NULL,
    command                 VARCHAR2(100),
    theme                   VARCHAR2(200),
    link_presentation       VARCHAR2(200),
    list_command_id_command NUMBER NOT NULL
);

ALTER TABLE seminars ADD CONSTRAINT seminars_pk PRIMARY KEY ( id_seminar );
ALTER TABLE member
    ADD CONSTRAINT member_list_command_fk FOREIGN KEY ( list_command_id_command )
        REFERENCES list_command ( id_command );
ALTER TABLE seminars
    ADD CONSTRAINT seminars_list_command_fk FOREIGN KEY ( list_command_id_command )
        REFERENCES list_command ( id_command );
```




Создаём представление:<br/>
Выполнял от Админа так как была ошибка с правами<br/>
Вариант с WHERE:<br/>
```SQL
CREATE VIEW sib_coder_seminars_2 AS
SELECT member.firs_name, member.last_name, list_command.id_command, seminars.id_seminar 
FROM member, list_command, seminars  WHERE member.list_command_id_command = list_command.id_command AND (list_command.id_command = seminars.list_command_id_command ) ;
```

Вариант с JOIN:<br/>
```SQL
CREATE VIEW sib_coder_seminars AS
SELECT member.firs_name, member.last_name, list_command.id_command, seminars.id_seminar 
FROM HR.member LEFT OUTER JOIN HR.list_command on member.list_command_id_command = list_command.id_command LEFT OUTER JOIN HR.seminars  using(list_command_id_command) ;
```


Идея создания подобного представления в том когда нам под приложение необходимо иметь отдельную таблицу с параметрами семинара в которую мы можем вносить временных участников и информация внесённая в таблицу не должна повлиять на информацию в Базе Данных.<br/>

Индексы<br/>
Создать  4 индекса  для ВАШИХ таблиц, включающие 1,2 или более полей, 2 индекса должны быть уникальными.<br/>
Обосновать необходимость применения индексов.<br/>
```SQL
 CREATE  INDEX index_member ON member (last_name, firs_name);
    - Бухгалтерия будет рада
CREATE  INDEX index_list_command ON list_command  (command_name);
    - Часто для соревнований ищут информацию по имени команды.
CREATE UNIQUE INDEX member_phone ON member (phone_number);
	- Ищем по номеру телефона - это уникальный параметр.
CREATE UNIQUE INDEX index_member_unic ON member (last_name, firs_name);
    - Предполагаем что у нас нет участников с одинаковым именем и фамилией и делаем сочетание имени и фамилии уникальным.
```




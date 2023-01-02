ЗАДАНИЯ:<br/>
DDL:  Создайте 3 таблицы из вашей модели со всеми типами ограничений <br/> 
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
<br/> 


Попробуйте изменить структуру таблицы <br/> 
```SQL
ALTER TABLE MEMBER ADD Income varchar2(15);
```

Изменяем структуру существующей таблицы<br/> 
```SQL
ALTER TABLE MEMBER MODIFY last_name VARCHAR2(20);
```


Удалить столбцы и таблицу.<br/> 
```SQL
ALTER TABLE MEMBER DROP COLUMN nickname;
```


Удалить таблицу с ее внешними ключами<br/> 
```SQL
DROP TABLE Seminars CASCADE CONSTRAINTS;
```

DML:<br/> 
Воссоздал таблицу Seminar из DDL<br/> 
В созданные таблицы вставить данные.<br/> 
```SQL
INSERT INTO seminars (id_seminar, command,theme) VALUES (1, 'Sibears', 'From_Sib-Coder_with_Love'); 
INSERT INTO seminars (id_seminar, command,theme) VALUES (2, 'Sibears', 'From_Sib-Coder');
INSERT INTO seminars (id_seminar, command,theme) VALUES (3, 'Sibears', 'Sib-Coder_with_Love');
INSERT INTO seminars (id_seminar, command,theme) VALUES (4, 'GACHI_MUCHI', 'Mans_Love'); 


INSERT INTO list_command (id_command, min_size, max_size, command_name) VALUES (1, 2, 15, 'Sibears'); 
INSERT INTO list_command (id_command, min_size, max_size, command_name) VALUES (2, 2, 15, 'GACHI_MUCHI'); 


INSERT INTO seminars (id_seminar, command,theme, list_command_id_command) VALUES (1, 'Sibears', 'From_Sib-Coder_with_Love', 1); 
INSERT INTO seminars (id_seminar, command,theme, list_command_id_command) VALUES (2, 'Sibears', 'From_Sib-Coder', 1);
INSERT INTO seminars (id_seminar, command,theme, list_command_id_command) VALUES (3, 'Sibears', 'Sib-Coder_with_Love', 1);
INSERT INTO seminars (id_seminar, command,theme, list_command_id_command) VALUES (4, 'GACHI_MUCHI', 'Mans_Love', 2); 



INSERT INTO seminars ( command,theme, list_command_id_command) VALUES ( 'Sibears', 'From_Sib-Coder_with_Love', 1); 
```

Изменить данные, используя условия.<br/> 
```SQL
UPDATE list_command SET max_size = min_size  * 10 WHERE command_name = 'Sibears';
```
Удалить данные, используя условия.<br/> 
```SQL
DELETE FROM list_command  WHERE command_name = 'GACHI_MUCHI';


DELETE FROM seminars  WHERE command = 'GACHI_MUCHI'; 
```
Удалили порождённую запись.<br/> 
```SQL
DELETE FROM list_command  WHERE command_name = 'GACHI_MUCHI';
```






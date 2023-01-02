Задание<br/>

1.Создайте последовательность и триггер для вашей таблицы, чтобы автоматически заполнить «id»
Создаём таблицы:
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

Создаём тригер для таблицы  seminars для автоматического заполнения параметра id_seminar:
```SQL
create sequence for_seminars  start with 1;

create or replace trigger  for_id_seminar
    before insert or update on seminars  
    for each row
begin
    if inserting and :new.id_seminar is null then
        :new.id_seminar := for_seminars.nextval;
    end if;
end;
```




2. Создайте триггер, который заполняет таблицу для сохранения логов, содержащую информацию о том, кто и когда внес  изменения в таблицу и какие изменения (какая директива и какая строка(ключ)ю) Или другой триггер, изменяющий данные в другой таблице. 
```SQL
CREATE TABLE log_seminars (
    change_id_seminar              NUMBER ,
    change_command                 VARCHAR2(100),
    change_theme                   VARCHAR2(200),
    change_link_presentation       VARCHAR2(200),
    change_list_command_id_command NUMBER ,
  change_time         timestamp,  -- дата изменения
    change_type         varchar(7)  -- тип изменения (insert, update, delete)

);
create or replace trigger TRIGGER_CHANGE_log_seminars
    after insert or update or delete on seminars
for each row
declare
    current_time timestamp;
begin
    current_time := systimestamp;
    if (inserting) then
        insert into log_seminars (change_id_seminar, change_command, change_theme, change_link_presentation, change_list_command_id_command,change_time, change_type) values 
        (:NEW.id_seminar, :NEW.command, :NEW.theme, :NEW.link_presentation, :NEW.list_command_id_command,  current_time, 'insert');
    elsif (updating) then
  insert into log_seminars(change_id_seminar, change_command,change_theme,change_link_presentation,change_list_command_id_command,  change_time, change_type) values 
 (:NEW.id_seminar, :NEW.command, :NEW.theme, :NEW.link_presentation, :NEW.list_command_id_command,  current_time, 'update');
else 
insert into log_seminars(change_id_seminar, change_command,change_theme,change_link_presentation,change_list_command_id_command,  change_time, change_type) values 
 (:OLD.id_seminar, :OLD.command, :OLD.theme, :OLD.link_presentation, :OLD.list_command_id_command,  current_time, 'delete');
end if;
end;
```






 


DDL script:
```SQL
CREATE TABLE achevements (
    id_achevement         NUMBER NOT NULL,
    achevements           VARCHAR2(100),
    "date"                DATE,
    confirment_achivement VARCHAR2(100),
    member_id             NUMBER NOT NULL
);

ALTER TABLE achevements ADD CONSTRAINT achevements_pk PRIMARY KEY ( id_achevement );

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

CREATE TABLE partisiment (
    member_id                   NUMBER NOT NULL,
    personal_project_id_project NUMBER NOT NULL,
    date_start                  DATE,
    part_development            VARCHAR2(200)
);

ALTER TABLE partisiment ADD CONSTRAINT partisiment_pk PRIMARY KEY (     member_id,
personal_project_id_project 
);

CREATE TABLE personal_project (
    id_project           NUMBER NOT NULL,
    name_project         VARCHAR2(100),
    development_language VARCHAR2(100),
    git_hub              VARCHAR2(100)
);

ALTER TABLE personal_project ADD CONSTRAINT personal_project_pk PRIMARY KEY ( id_project );

CREATE TABLE place_of_study (
    id_student      NUMBER NOT NULL,
    name            VARCHAR2(4000),
    year_of_study   DATE,
    university_name VARCHAR2(100),
    group_namber    NUMBER,
    progress        CLOB
);

ALTER TABLE place_of_study ADD CONSTRAINT place_of_study_pk PRIMARY KEY ( id_student );

CREATE TABLE position_in_team (
    id_position NUMBER NOT NULL,
    role        VARCHAR2(100)
);

ALTER TABLE position_in_team ADD CONSTRAINT position_in_team_pk PRIMARY KEY ( id_position );

CREATE TABLE rating_local_board (
    id_raiting     NUMBER NOT NULL,
    list_tasks     CLOB,
    nickname_board VARCHAR2(100),
    member_id      NUMBER NOT NULL
);

CREATE UNIQUE INDEX rating_local_board__idx ON
    rating_local_board (
        member_id
    ASC );

ALTER TABLE rating_local_board ADD CONSTRAINT rating_local_board_pk PRIMARY KEY ( id_raiting );

CREATE TABLE seminars (
    id_seminar              NUMBER NOT NULL,
    command                 VARCHAR2(100),
    theme                   VARCHAR2(200),
    link_presentation       VARCHAR2(200),
    list_command_id_command NUMBER NOT NULL
);

ALTER TABLE seminars ADD CONSTRAINT seminars_pk PRIMARY KEY ( id_seminar );

CREATE TABLE skill_level (
    skills_id_skills  NUMBER NOT NULL,
    member_id         NUMBER NOT NULL,
    proficiency_level NUMBER
);

ALTER TABLE skill_level
    ADD CONSTRAINT skill_level_p_l_ck CHECK ( proficiency_level >= 1
                                              AND proficiency_level <= 5 );

ALTER TABLE skill_level ADD CONSTRAINT skill_level_pk PRIMARY KEY ( skills_id_skills,
                                                                    member_id );

CREATE TABLE skills (
    id_skills   NUMBER NOT NULL,
    skills_name VARCHAR2(100),
    soft_hard   CHAR(1)
);

ALTER TABLE skills ADD CONSTRAINT skills_pk PRIMARY KEY ( id_skills );

CREATE TABLE writeups (
    id_writeup   NUMBER NOT NULL,
    autor        VARCHAR2(100),
    topic_report VARCHAR2(1000),
    member_id    NUMBER NOT NULL
);

ALTER TABLE writeups ADD CONSTRAINT writeups_pk PRIMARY KEY ( id_writeup );

ALTER TABLE achevements
    ADD CONSTRAINT achevements_member_fk FOREIGN KEY ( member_id )
        REFERENCES member ( id );

ALTER TABLE member
    ADD CONSTRAINT member_list_command_fk FOREIGN KEY ( list_command_id_command )
        REFERENCES list_command ( id_command );

ALTER TABLE member
    ADD CONSTRAINT member_place_of_study_fk FOREIGN KEY ( place_of_study_id_student )
        REFERENCES place_of_study ( id_student );

ALTER TABLE member
    ADD CONSTRAINT member_position_in_team_fk FOREIGN KEY ( position_in_team_id_position )
        REFERENCES position_in_team ( id_position );

ALTER TABLE partisiment
    ADD CONSTRAINT partisiment_member_fk FOREIGN KEY ( member_id )
        REFERENCES member ( id );

ALTER TABLE partisiment
    ADD CONSTRAINT personal_project FOREIGN KEY ( personal_project_id_project )
        REFERENCES personal_project ( id_project );

ALTER TABLE rating_local_board
    ADD CONSTRAINT rating_local_board_member_fk FOREIGN KEY ( member_id )
        REFERENCES member ( id );

ALTER TABLE seminars
    ADD CONSTRAINT seminars_list_command_fk FOREIGN KEY ( list_command_id_command )
        REFERENCES list_command ( id_command );

ALTER TABLE skill_level
    ADD CONSTRAINT skill_level_member_fk FOREIGN KEY ( member_id )
        REFERENCES member ( id );

ALTER TABLE skill_level
    ADD CONSTRAINT skill_level_skills_fk FOREIGN KEY ( skills_id_skills )
        REFERENCES skills ( id_skills );

ALTER TABLE writeups
    ADD CONSTRAINT writeups_member_fk FOREIGN KEY ( member_id )
        REFERENCES member ( id );
```

Тригеры:
```SQL
--seminar:
create sequence for_seminars  start with 1;

create or replace trigger  for_id_seminar
    before insert or update on seminars  
    for each row
begin
    if inserting and :new.id_seminar is null then
        :new.id_seminar := for_seminars.nextval;
    end if;
end;


--achevements:

 CREATE SEQUENCE for_achevements START with 1;
 
 create or replace trigger  for_id_achevements
    before insert or update on achevements  
    for each row
begin
    if inserting and :new.id_achevement is null then
        :new.id_achevement := for_achevements.nextval;
    end if;
end;




--list_command:

 CREATE SEQUENCE for_list_command START with 1;
 
 create or replace trigger  for_command
    before insert or update on list_command  
    for each row
begin
    if inserting and :new.id_command is null then
        :new.id_command := for_list_command.nextval;
    end if;
end;


--member:
 CREATE SEQUENCE for_member START with 1;
 
 create or replace trigger  for_id_member
    before insert or update on member  
    for each row
begin
    if inserting and :new.id is null then
        :new.id := for_member.nextval;
    end if;
end;

--partisiment:
 CREATE SEQUENCE for_PARTISIMENT START with 1;
 
 create or replace trigger  for_id_PARTISIMENT
    before insert or update on PARTISIMENT  
    for each row
begin
    if inserting and :new.member_id is null then
        :new.member_id := for_PARTISIMENT.nextval;
    end if;
end;

--personal_project:
CREATE SEQUENCE for_PERSONAL_PROJECT START with 1;
 
 create or replace trigger  for_id_PERSONAL_PROJECT
    before insert or update on PERSONAL_PROJECT  
    for each row
begin
    if inserting and :new.id_project is null then
        :new.id_project := for_PERSONAL_PROJECT.nextval;
    end if;
end;

--place_of_study:
CREATE SEQUENCE for_PLACE_OF_STUDY START with 1;
 
 create or replace trigger  for_id_PLACE_OF_STUDY
    before insert or update on PLACE_OF_STUDY  
    for each row
begin
    if inserting and :new.id_student is null then
        :new.id_student := for_PLACE_OF_STUDY.nextval;
    end if;
end;

--position_in_team:
 CREATE SEQUENCE for_POSITION_IN_TEAM  START with 1;
 
 create or replace trigger  for_id_POSITION_IN_TEAM 
    before insert or update on POSITION_IN_TEAM   
    for each row
begin
    if inserting and :new.id_position is null then
        :new.id_position := for_POSITION_IN_TEAM.nextval;
    end if;
end;


--rating_locale_board:
 CREATE SEQUENCE for_RATING_LOCAL_BOARD START with 1;
 
 create or replace trigger  for_id_RATING_LOCAL_BOARD 
    before insert or update on RATING_LOCAL_BOARD   
    for each row
begin
    if inserting and :new.id_raiting is null then
        :new.id_raiting := for_RATING_LOCAL_BOARD.nextval;
    end if;
end;



--skill_level:
CREATE SEQUENCE for_SKILL_LEVEL START with 1;
 
 create or replace trigger  for_id_SKILL_LEVEL 
    before insert or update on SKILL_LEVEL   
    for each row
begin
    if inserting and :new.SKILLS_ID_SKILLS is null then
        :new.SKILLS_ID_SKILLS :=  for_SKILL_LEVEL.nextval;
    end if;
end;


--skills:
 CREATE SEQUENCE for_SKILLS START with 1;
 
 create or replace trigger  for_id_SKILLS 
    before insert or update on SKILLS   
    for each row
begin
    if inserting and :new.ID_SKILLS is null then
        :new.ID_SKILLS := for_SKILLS.nextval;
    end if;
end;



--writeups:
 CREATE SEQUENCE for_WRITEUPS START with 1;
 
 create or replace trigger  for_id_WRITEUPS 
    before insert or update on WRITEUPS   
    for each row
begin
    if inserting and :new.ID_WRITEUP is null then
        :new.ID_WRITEUP := for_WRITEUPS.nextval;
    end if;
end;


```


Индексы:

```sql
 CREATE  INDEX index_member ON member (last_name, firs_name);

 CREATE  INDEX index_achevements ON achevements (achevements);

 CREATE  INDEX index_COMMAND_NAME ON list_command (COMMAND_NAME);

 CREATE  INDEX index_DATE_START ON PARTISIMENT (DATE_START);

 CREATE  INDEX index_PERSONAL_PROJECT ON PERSONAL_PROJECT (NAME_PROJECT);

 CREATE  INDEX index_PLACE_OF_STUDY ON PLACE_OF_STUDY (UNIVERSITY_NAME);

 CREATE  INDEX index_POSITION_IN_TEAM ON POSITION_IN_TEAM (ROLE);

 CREATE  INDEX index_RATING_LOCAL_BOARD ON RATING_LOCAL_BOARD         (NICKNAME_BOARD);

 CREATE  INDEX index_SEMINARS  ON SEMINARS  (THEME);

 CREATE UNIQUE INDEX index_SKILL_LEVEL  ON SKILL_LEVEL  (SKILLS_ID_SKILLS);

 CREATE UNIQUE INDEX index_SKILLS   ON SKILLS   (SKILLS_NAME);

 CREATE  INDEX index_ID_WRITEUP   ON WRITEUPS   (AUTOR);

```


Представления:<br/>
Выполнял от Админа так как была ошибка с правами<br/>
* Вариант с WHERE:<br/>
```SQL
CREATE VIEW sib_coder_seminars_2 AS
SELECT member.firs_name, member.last_name, list_command.id_command, seminars.id_seminar 
FROM member, list_command, seminars  WHERE member.list_command_id_command = list_command.id_command AND (list_command.id_command = seminars.list_command_id_command ) ;
```

* Вариант с JOIN:
```SQL
CREATE VIEW sib_coder_seminars AS
SELECT member.firs_name, member.last_name, list_command.id_command, seminars.id_seminar 
FROM HR.member LEFT OUTER JOIN HR.list_command on member.list_command_id_command = list_command.id_command LEFT OUTER JOIN HR.seminars  using(list_command_id_command) ;
```

Идея создания подобного представления в том когда нам под приложение необходимо иметь отдельную таблицу с параметрами семинара в которую мы можем вносить временных участников и информация внесённая в таблицу не должна повлиять на информацию в Базе Данных.

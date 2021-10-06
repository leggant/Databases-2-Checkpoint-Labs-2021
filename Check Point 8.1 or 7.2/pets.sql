DROP TABLE IF EXISTS pet;

CREATE TABLE pet (p_id int auto_increment primary key, name VARCHAR(20), owner VARCHAR(20), species VARCHAR(20), sex CHAR(1), birth DATE, death DATE);

alter table pet auto_increment=0;

insert into pet (name,owner,species,sex,birth,death)
values ('Fluffy','Harold','cat','f','1993-02-04',NULL),
('Claws','Gwen','cat','m','1994-03-17',NULL),
('Buffy','Harold','dog','f','1989-05-13',NULL),
('Fang','Benny','dog','m','1990-08-27',NULL),
('Bowser','Diane','dog','m','1979-08-31','1995-07-29'),
('Chirpy','Gwen','bird','f','1998-09-11',NULL),
('Whistler','Gwen','bird','m','1997-12-09',NULL),
('Slim','Benny','snake','m','1996-04-29',NULL),
('Puffball','Diane','hamster','f','1999-03-30',NULL);

select * from pet;

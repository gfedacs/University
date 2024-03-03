-- Tarefa 4 
-- Observar modelo conceitual
-- Criar modelo lógico

-- Questão 2  

create table engenheiro(
codeng serial, 
nome varchar(30), 
salario numeric(15,2), 
constraint pkeng primary key(codeng));

create table projeto(
codproj serial, 
titulo varchar(30), 
area varchar(30), 
constraint pkproj primary key(codproj));

create table atuação(
codeng integer, 
codproj integer, 
função varchar(30), 
constraint pkatua primary key(codeng,codproj));

alter table atuação add constraint fkeng foreign key (codeng) references engenheiro;
alter table atuação add constraint fkproj foreign key (codproj) references projeto;

-- Questão 5

Alter table engenheiro add constraint c_sal check (salario > 2000 and salario < 30000); 

-- Questão 6

insert into engenheiro values(default,'José Gomes',10000);
insert into engenheiro values(default,'Joana Pires',9000);
insert into engenheiro values(default,'Alvaro Silva',11000);

insert into projeto values(default,'Artifícios','BD'); 
insert into projeto values(default,'Análises','CD'); 
insert into projeto values(default,'Projetos','BD'); 

insert into atuação values(1,1,'Gerente');
insert into atuação values(2,2,'Engenheiro');
insert into atuação values(3,3,'Projetista'); 

select * from engenheiro;
select * from projeto; 
select * from atuação; 

-- Questão 9 

select nome
from engenheiro
where salario < 15000; 

select e.nome
from engenheiro e join atuação a on e.codeng = a.codeng
where a.função like 'Projetista'; 
 
select p.area, count(*) 
from projeto p join atuação a on a.codproj = p.codproj join 
         engenheiro e on e.codeng = a.codeng 
group by p.area; 

select nome
from engenheiro
where salario > (select avg(salario) from engenheiro)

-- Questão 10 

Select SUBSTR(e.nome, 1, 1) AS PrimeiraLetra,COUNT(*) AS Contagem
From engenheiro e
Group By SUBSTR(e.nome, 1, 1);

-- Questão 11

select nome
from engenheiro
where codeng in (select codeng
                  from atuação
                  where codproj in (select codproj
                                     from projeto 
                                     where area like 'BD'))

select e.nome  
from engenheiro e JOIN atuação a on e.codeng = a.codeng 
     JOIN projeto p on a.codproj = p.codproj
where p.area like 'BD';

-- Questão 12
select codeng 
from engenheiro
where salario > 1200 
  INTERSECT
select codeng 
from atuação;

select e.codeng 
from engenheiro e
where e.salario > 1200 and 
      codeng in (select codeng from atuação)
order by codeng desc;

select e.codeng
from engenheiro e JOIN atuação a on e.codeng = a.codeng 
where e.salario > 1200
order by e.codeng desc; 

-- Questão 13

select * from engenheiro; 
insert into engenheiro values(4,'Mariana Barros',15000);

Questão 14

Select e.nome, e.codeng
from engenheiro e left join atuação a on e.codeng = a.codeng
where a.codeng is null
Order by e.nome;

select e.codeng
from engenheiro e
EXCEPT 
select a.codeng
from atuação a; 

select n.nome, n.codeng
from engenheiro n
where n.codeng in (
	select e.codeng
    from engenheiro e
    EXCEPT 
    select a.codeng
    from atuação a)
order by n.nome; 

-- Questão 15

create or replace view engproj as 
select e.nome, a.função, p.titulo
from engenheiro e join atuação a on e.codeng = a.codeng 
join projeto p on a.codproj = p.codproj;

select * from engproj; 

-- Questão 16  
WITH projs_por_area AS (
  Select area, count(*) AS contagemArea
  From projeto
  Group by area )
Select distinct p.titulo, ppa.contagemArea
From projeto p JOIN projs_por_area ppa ON p.area = ppa.area
Order by ppa.contagemArea DESC;

-- Questão 17

Select p.area, sum(E.salario) AS Area_Total
From engenheiro e JOIN atuação a ON e.codeng = a.codeng 
     JOIN projeto p on a.codproj = p.codproj
Group by p.area
Having SUM(e.salario) > 
       (Select SUM(Area_Total)/COUNT(*)
	    From (Select p.area, SUM(e.salario) AS Area_Total
              From engenheiro e JOIN atuação a ON e.codeng = a.codeng
		  JOIN projeto p on a.codproj = p.codproj
              Group by p.area) as temp)                                                       
Order by p.area;

WITH
  Area_custo AS 
    (Select p.area, SUM(e.salario) AS Area_Total
     From engenheiro e JOIN atuação a ON e.codeng = a.codeng
	      JOIN projeto p on a.codproj = p.codproj
     Group by p.area),
          Media_custo AS (Select SUM(Area_Total)/COUNT(*) AS area_media
			              From Area_custo)
        Select *
        From Area_custo
        Where Area_Total > 
		     (Select area_media
			  From Media_custo)
        Order by area;


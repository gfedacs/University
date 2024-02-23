-- Tarefa 3 - subconsultas

-- questão 1

select f.titulo
from filme f
where f.codest in (select e.codest
               	from estudio e
               	where e.nomeest like 'P%')
order by f.titulo;

				   		   
-- questão 2

select f.titulo
from filme f
where exists
 	(select e.codest
 	 from estudio e
  	where f.codest = e.codest and nomeest like 'P%')
order by f.titulo;   

-- questão 3

select * from categoria; 
select * from filme; 

SELECT c.desccateg 
FROM categoria  c
where c.codcateg in (select f.codcateg from filme f);

-- questão 4

SELECT A.nomeart 
FROM artista A 
WHERE A.codart in (select p.codart 
                        from personagem p
                        where p.nomepers = 'Natalie');

-- questão 5

SELECT A.nomeart 
FROM artista A 
WHERE A.codart not in 
     (select p.codart 
      from personagem p);
	  
select a.nomeart, p.nomepers
from artista a left join personagem p on a.codart = p.codart
where p.codart is null; 

select * from personagem; 

SELECT A.nomeart 
FROM artista A 
WHERE not exists (select p.codart 
                        from personagem p 
                        where p.codart = a.codart
                        );
-- questão 6	

select a.nomeart
from artista a join personagem p on a.codart = p.codart
where p.cache > (select round(avg(cache),2) from personagem); 


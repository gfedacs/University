-- Tarefa 10

-- Questão 1

Select * from filme order by codfilme; 
select * from categoria order by codcateg; 
select * from estudio order by codest; 

-- drop function cria_filme; 

Create function cria_filme(tit filme.titulo%type, ano1 filme.ano%type, 
						   durac filme.duracao%type, 
						   nomecat varchar, nomeestudio varchar)
Returns void
as $$
Declare cod_cat categoria.codcateg%type; 
        cod_est estudio.codest%type; 
Begin
  Select codcateg into cod_cat from categoria 
         where desccateg = nomecat; 
  If not found then
     insert into categoria(desccateg) values (nomecat) returning codcateg into cod_cat;
  end if; 
  Select codest into cod_est from estudio
         where nomeest = nomeestudio; 
  If not found then
     insert into estudio(nomeest) values (nomeestudio) returning codest into cod_est;
  end if; 
  Insert into filme values(default,tit,ano1,durac,cod_cat,cod_est); 
End; 
$$ language plpgsql; 

Select * from filme order by codfilme; 
select * from categoria order by codcateg; 
select * from estudio order by codest; 

-- delete from estudio where codest > 3; 

select cria_filme('Openheimer',2023,145,'Aventura','Outro'); 
select cria_filme('Openheimer2',2021,130,'Categoria2','Outro'); 

-- Questão 2

-- drop function cria_filme2; 

Create function cria_filme2(tit filme.titulo%type, ano1 filme.ano%type, 
							durac filme.duracao%type, 
						   nomecat varchar, nomeestudio varchar)
Returns void
as $$
Declare cod_cat categoria.codcateg%type; 
        cod_est estudio.codest%type; 
		msg varchar; 
Begin
  Select codcateg into strict cod_cat from categoria 
         where desccateg = nomecat;   
  Select codest into strict cod_est from estudio
         where nomeest = nomeestudio; 
  Insert into filme values(default,tit,ano1,durac,cod_cat,cod_est); 
  msg = 'Tudo certo';
  raise notice 'Mensagem, %', msg; 
  Exception
         When No_data_found then
                msg = 'Nenhuma categoria/estudio foi encontrado';
				raise notice 'Mensagem, %',msg; 
        When others then
		  msg = 'Erro desconhecido';
				raise notice 'Mensagem, %',msg; 
End; 
$$ language plpgsql; 

-- drop function cria_filme2; 



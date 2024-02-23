-- Aula 7 - segurança de dados com SQL

-- Criação de usuário
-- Crie um usuário novo com suas iniciais

 
  CREATE ROLE dysf LOGIN
  PASSWORD 'bd2'
  SUPERUSER CREATEDB CREATEROLE ;
  
--

select * from cliente;
select * from pedido; 

-- conceder privilégios para usuários/roles com Grant

GRANT Select ON Produto TO dysf;
GRANT All privileges ON Cliente TO public;
GRANT all on pedido to dysf WITH GRANT OPTION;
GRANT update(valor) on produto to dysf;

-- Revogar privilégios de usuários com Revoke

Revoke select on produto from dysf;
Revoke select on cliente from public;
Revoke insert, update on pedido from dysf;

-- Criação do usuário bd2

Create role bd2
Login Password 'bd2';


-- Inserir 5 registros antes de criar a view

insert into pedido values (default,12,current_date,4,2);
insert into pedido values (default,12,current_date,4,5);
insert into pedido values (default,12,current_date,4,3);
insert into pedido values (default,12,current_date,4,4);
insert into pedido values (default,12,current_date,4,1);

create or replace view clientesVIP as 
   SELECT c.nome as "VIP"
   FROM cliente c join pedido p on c.codcli = p.codcli
   Group by c.nome
   Having count(*) > 2; 

select * from ClientesVIP;

Grant select on clientesVIP to dysf,bd2;


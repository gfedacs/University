-- Aula 03 - DDL e constraints
-- Vamos criar um esquema com algumas tabelas de um "sistema acadêmico"

CREATE TABLE Aluno(
	MatricAlu	serial NOT NULL,
	NomeAlu		VARCHAR(40),
	DataAniver	DATE default '01/01/1998',
	Sexo		CHAR(1),
	CONSTRAINT PKAluno PRIMARY KEY(MatricAlu));
	
select * from aluno; 

-- testes com alter table 

ALTER TABLE Aluno ADD telefone char(16);
ALTER TABLE Aluno ADD fone char(16) default 'não listado';

select * from aluno; 

ALTER TABLE Aluno DROP COLUMN telefone;
ALTER TABLE Aluno alter column fone type varchar(20);
ALTER TABLE Aluno RENAME TO Discente; 

select * from discente; 

ALTER TABLE Discente RENAME COLUMN fone TO telefone;
ALTER TABLE Discente RENAME TO Aluno; 

select * from aluno; 

-- 
CREATE TABLE Disciplina ( 
    CodDISC    serial  NOT NULL,
    NomeDISC   VARCHAR(30),
    CONSTRAINT PKDisciplina PRIMARY KEY(CodDISC));
	
	select * from disciplina; 

-- Nessa próxima tabela, vamos criar a constraint de PK usando o alter table

CREATE TABLE Professor ( 
      	 MatricProf      serial     NOT NULL,
    	 NomeProf        VARCHAR(40),
      	 DataAdmissao    DATE  	 );

ALTER TABLE Professor ADD CONSTRAINT PKProfessor PRIMARY KEY(MatricProf);

select * from professor; 

-- Vamos testar a integridade referencial

-- Teste 01: NO ACTION (default) 

ALTER TABLE professor add codDisc integer;
ALTER TABLE professor ADD CONSTRAINT FKprofdisc FOREIGN KEY(codDisc) REFERENCES Disciplina;

Insert into disciplina(nomeDisc) values ('BDII'); 
insert into disciplina(nomeDisc) values ('Sistemas Operacionais');

Select * from disciplina; 

Insert into professor(nomeProf, dataadmissao,coddisc) values('Crishane', null, 1);
Insert into professor(nomeProf, dataadmissao,coddisc) values('Damires', null, 1);
Insert into professor(nomeProf, dataadmissao,coddisc) values('Luciana', null, 2);

select * from professor; 

-- Testar a remoção da disciplina BDII

Delete from disciplina where codDisc = 1;

-- Teste 02: testando on delete set null 

Alter table professor drop constraint fkprofdisc;
ALTER TABLE professor ADD CONSTRAINT FK2_prof_disc FOREIGN KEY(codDisc) REFERENCES Disciplina on delete set null;

Select * from disciplina;
Select * from professor;

-- Testar agora a remoção de BDII com nova restrição

Delete from disciplina where codDisc = 1;

Select * from disciplina;
Select * from professor;

-- Teste 03: testando ON DELETE CASCADE
-- Atualize os dados novamente.

Insert into disciplina(nomeDisc) values ('BDII'); 
select * from disciplina; 
Update disciplina 
set coddisc = 1
where nomedisc = 'BDII'; 

select * from disciplina; 

select * from professor;

update professor
set coddisc = 1
where matricprof in (1,2);

select * from professor; 
 
Alter table professor drop constraint fk2_prof_disc;
ALTER TABLE professor ADD CONSTRAINT FK3_prof_disc FOREIGN KEY(coddisc) REFERENCES Disciplina ON DELETE CASCADE;

Select * from disciplina;
Select * from professor;

-- testar a remoção com delete cascade

Delete from disciplina where codDisc = 1;

Select * from disciplina;
Select * from professor;

-- Teste 04: testando ON UPDATE CASCADE

-- Inserir dados novamente 
Insert into disciplina(coddisc,nomeDisc) values (1,'BDII'); 
Insert into professor(nomeProf, dataadmissao,coddisc) values('Crishane', null, 1);
Insert into professor(nomeProf, dataadmissao,coddisc) values('Damires', null, 1);

select * from disciplina; 
select * from professor; 

Alter table professor drop constraint fk3_prof_disc;
ALTER TABLE professor ADD CONSTRAINT FK4_prof_disc FOREIGN KEY(coddisc) REFERENCES Disciplina ON UPDATE CASCADE;

-- Testar o update cascade

Update disciplina 
Set coddisc = 11 
where coddisc = 1;

Select * from disciplina;
Select * from professor;

-- Voltando disciplinas a seu valor correto de PK
Update disciplina
Set coddisc = 1
Where coddisc = 11;

Select * from disciplina;
Select * from professor;

-- regra de validação

CREATE TABLE nota_aluno 
    (Matricalu integer,
     NumNota integer,
     Nota numeric(3,1) CHECK (nota > 0),
     constraint pk_alu_nota primary key(Matricalu,Numnota),
     constraint FK_alu foreign Key(Matricalu) references Aluno);

Select * from aluno; 
Select * from nota_aluno; 

Insert into aluno values(1,'Jonas Melo','12/02/2000','M','8990-9999'); 

Insert into nota_aluno values(1,1,10);

Insert into nota_aluno values(1,2,0);

--

ALTER TABLE professor ADD salario numeric(15,2) CHECK (salario >= 4000.00 and salario <=  20000.00);




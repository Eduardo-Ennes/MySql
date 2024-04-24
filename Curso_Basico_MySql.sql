/* Curso banco de dados Gustavo Guanabara */ 

/* Criando o banco de dados */
CREATE DATABASE CADASTROS;

/* Criando o banco de uma forma mais robusta */
CREATE DATABASE CADASTRO
DEFAULT CHARACTER SET utf8    
DEFAULT COLLATE utf8_general_ci;  

/* Para acessar o banco de dados criado */
USE CADASTROS;

/* Criando a tabela */
CREATE TABLE PESSOAS(
Id INT NOT NULL AUTO_INCREMENT, /* Vai auto enumerar os usuarios que serão cadastrados. Cada um com o seu número de identificação */ 
Nome VARCHAR(30) NOT NULL, /* --> NOT NULL obriga o usuário a preencher o campo */ 
Nascimento DATE,
Sexo ENUM ('M', 'F'), /* --> ENUM (parametros) apenas os parametros dentro do parenteses que serão aceitos */ 
Peso DECIMAL(5,2),    /* DECIMAL (5,2) tem ao todo 5 casas e dois depois da virgula, exp: 100,50. Economiza memoria */ 
Altura DECIMAL(3,2),
Nacionalidade VARCHAR(20) DEFAULT 'Brasil',  /* Deauful 'Brasil', caso o usuario não digite nada, por padrão será Brasil. */ 
PRIMARY KEY(ID)		/* Serve para diferenciar cada usuario e para que eles não sejam cadastrados novamente no banco */
)DEFAULT CHARSET = utf8;



CREATE TABLE PESSOAS(
Id INT NOT NULL AUTO_INCREMENT,
Nome VARCHAR(30) NOT NULL, 
Nascimento DATE,
Sexo ENUM ('M', 'F'),
Peso DECIMAL(5,2), 
Altura DECIMAL(3,2),
Nacionalidade VARCHAR(20)DEFAULT 'Brasil',
PRIMARY KEY(ID)
)DEFAULT CHARSET = utf8;



/* Para mostrar os componentes da tabela criada */
DESC PESSOAS;

SHOW TABLES /* --> Mostra todas as tabelas existentes */ 
SHOE DATABSES --> Mostra todos os bancos de dados 

STATUS /* --> Mostra informações */ 

/* Comando para apagar um banco de dados e uma tabela */
DROP DATABASE NOMEDOBANCO;
DROP TABLE NOMEDATABELA; 




/* Forma de inserir diferças pessoas ao mesmo tempo */ 
INSERT INTO PESSOAS(Nome, Nascimento, Sexo, Peso, Altura, Nacionalidade) 
VALUES('Letiçia', '2001-10-06', 'F', '68.0', '1.68', 'Brasil'),
('Neil Price', '1956-10-15', 'M', '68.0', '1.65', 'FINLÂNDIA'), 
('Napoleon Hill', '1940-06-29', 'M', '70.0', '1.78', 'EUA'),
('Bruna', '1997-03-18', 'F', '63.0', '1.59', 'Brasil'),
('Marcela', '2001-05-09', 'F', '60.0', '1.66', 'Brasil');



/* Para adicionar uma coluna na tabela */ 
ALTER TABLE PESSOAS
ADD COLUMN Profissao VARCHAR(10); -->´para adicionar 
DROP COLUMN Profissao; --> para remover 



/* Para adicionar uma coluna no local desejado */ 
ALTER TABLE PESSOAS
ADD COLUMN Profissao Varchar(10) after Nome; 
FIRST --> Para colocar em primeiro 



/* Para modificar o type */ 
ALTER TABLE PESSOAS
MODIFY COLUMN Profissao Varchar(20)



/* Para alterar o nome da coluna */
ALTER TABLE PESSOAS
CHANGE COLUMN Profissao Prof VARCHAR(20);



/* Para mudar uma coluna de posição */
ALTER TABLE PESSOAS
MODIFY COLUMN Prof varchar(20)
AFTER sexo; 



/* Para trocar o nome da tabela */ 
ALTER TABLE PESSOAS
RENAME TO Nomenovodatabela;



/* Criando nova tabela */
create table if not exists Cursos(	--> if not exist (se não existir) uma tabela com esse nome, a tabela é cria.  
Nome varchar (30) not null unique,	 
Descricao text,	--> text é usado quando tiver grandes textos. 
Carga int unsigned,	--> unsigned (sem sinais) como não haverá números negativos usa-se esse metodo para economizar bits.
Totalaulas int,
Ano year default '2024'
) default charset='utf8'; --> "utf8" é usado para colocar no padrão da lingua portuguesa, então não teremos problemas com a gramática.



/* Para adicionar uma PRIMARY key */
ALTER TABLE PESSOAS
ADD PRIMARY KEY(ID);



/* Inserindo valores na tabela Cursos */
insert into cursos values
('1','HTML4','Curso de HTML5','40','37','2014'),
('2','Algoritmos','Lógica de Programação','20','15','2014'),
('3','Photoshop','Dicas de Photoshop CC','10','8','2014'),
('4','PGP','Curso de PHP para iniciantes','40','20','2010'),
('5','Jarva','Introdução à Linguagem Java','10','29','2000'),
('6','MySQL','Banco de Dados MySQL','30','15','2016'),
('7','Word','Curso completo de Word','40','30','2016'),
('8','Sapateado','Danças rítmicas','40','30','2018'),
('9','Cozinha Árabe','Aprenda a fazer kibe','40','30','2018'),
('10','YouTuber','Gerar polêmica e ganhar inscritos','5','2','2018');



/* Comando para alterar linhas */

/* Alterando HTML4 para HTML5 */
update cursos
set Nome = 'HTML5'
where id = '1';



/* Alterando PGP para PHP e o seu ANO */ 
update cursos
set Nome = 'PHP', ano = '2015'
where id = '4';



/* Alterando a linha 5 */
update cursos 
set Nome = 'Java', Carga = '40', Ano = '2015'
where id = '5'
limit 1;	--> é muito usado para assegurar que irá alterar apenas uma linha. 



/* Alterando linha (Cursos) id = 1 nome = HTML5*/
update Cursos
set nome = 'HT0ML0'
where idcurso = '1';



/* Comando para remover uma linha */
delete from cursos
where id = '8'; --> Apaga apenas uma tabela por que do tem um id de identificação na tabela, id = '8' é um valor especifico de cada linha 


delete from cursos
where Ano = '2018';	--> Irá apagar mais de uma linha por que não é uma PRIMARY key, ano = '2018' é um valor genérico


/* Para remover toda as linhas de uma tabela */ 
truncate cursos; 



/* Em ordem */ 
order by nome; --> Por ordem alfabeticas com os nomes 
order by nome desc --> ordem inversa



/* Aprofundamento no SELECTS */
select nome, sexo
from gafanhtos;


select nome, sexo, Nacionalidade 
from gafanhotos 
order by Nacionalidade;


 select nome, descricao, ano
 from cursos
 where ano = '2016'
 order by nome;
 
 
 select nome, descricao, carga
 from cursos
 where carga > 30;
 
 
select nome, sexo, Altura
from gafanhotos
where altura between 1.65 and 1.75;	--> entre esses números especificados 


select nome, sexo, Altura
from gafanhotos
where altura in ('1.66', '1.75');	--> so irá selecionar pessoas que atendem esses requisitos 


select nome, sexo, Peso, Nacionalidade
from gafanhotos
where Peso > 65.00 and nacionalidade = 'Portugal';


select * from gafanhotos
where nascimento >= 1997/01/01;


select * from cursos
where nome like 'p%';	--> Me mostra os nome que iniciam com a letra 'P'.


select * from cursos 
where nome like '%a';	--> Me mostra os nomes que terminam com 'a'.


select * from cursos 
where nome like '%a%';	--> Me motra todas as palavras tem 'a'.


select * from cursos 
where nome not like '%a%';	--> Me mostra todas as palavras que não tem 'a'.



select * from cursos 
where nome like 'ph%p';	--> Me mostra palavras que começam com 'ph' e terminam com 'p'.


'_' --> Obriga que tenha uma letra 
select * from cursos
where nome like 'p__';	--> Me mostra nomes que começam com 'p' e mais 2 duas letras, palavra de 3 letras.


select * from gafanhotos
where nome like 'silva';	--> Me mostra todos que tem 'silva' no nome



/* DISTINCT */ 
select DISTINCT nacionalidade from gafanhotos;	--> Me mostra as colunas desejadas sem repetições dos valores.


/* FUNÇÕES */
/* função COUNT */ --> contador  
select count(DISTINCT Nacionalidade) from gafanhotos;	--> Me mostra o número de nacionalidades.

select count(*) from gafanhotos where altura < 1.70;


/* MAX */ --> maximo 
select *, max(carga) from cursos where ano = '2016';

/* MIN */ --> Mininmo
select min(carga) from cursos
where ano = '2016';

/* sum */ --> somador 
select sum(carga) from cursos 
where ano = '2015'; 

/* AVG */ --> Média
select avg(carga) from cursos 
where ano = '2015';



/* Agrupamento */ 
GROUP by --> agrupado por 


select * from cursos;select carga, count(nome) from cursos
group by carga;


HAVING --> Mostrar apenas 

select carga, COUNT(nome) from cursos 
group by carga 
HAVING count(nome) > 3;


select carga, count(*) from cursos 
where ano > 2015
group by carga 
having carga > (select AVG(carga) from cursos); 


/* EXERCICOS */
select profissao, count(*) from gafanhotos
group by profissao; 


select sexo, count(*) from gafanhotos
where Nascimento > '2005/01/01'
group by sexo;


select nacionalidade, count(*) from gafanhotos 
where Nacionalidade != 'Brasil'
group by Nacionalidade
having count(*) >= 3;


(
select avg(altura) from gafanhotos;

select Altura, count(*) from gafanhotos
where peso > 100.00
group by Altura
having altura > (select avg(altura) from gafanhotos);
)




/* Modelo Relacional */


/* Adicionando chave estranjeira */
alter table gafanhotos
add FOREIGN KEY (cursoPref)
REFERENCES cursos(idcurso);


/* Junção de tabelas */ 
select gafanhotos.nome, gafanhotos.cursoPref, cursos.nome, cursos.ano
from gafanhotos join cursos
on cursos.idcurso = gafanhotos.cursoPref;


select gafanhotos.nome, gafanhotos.cursoPref, cursos.nome, cursos.ano
from gafanhotos left join cursos
on cursos.idcurso = gafanhotos.cursoPref;


select gafanhotos.nome, gafanhotos.cursoPref, cursos.nome, cursos.ano
from gafanhotos right join cursos
on cursos.idcurso = gafanhotos.cursoPref;


select gafanhotos.nome, gafanhotos.cursoPref, cursos.nome, cursos.ano
from gafanhotos inner join cursos
on cursos.idcurso = gafanhotos.cursoPref;


select g.nome, g.cursoPref, c.nome, c.ano
from gafanhotos as g join cursos as c
on c.idcurso = g.cursoPref;



/* Muitos para Muitos */ --> Criando tabela de modelo relacional muitos para muitos. 
create table gafanhot_assisti_curso(
id int not null AUTO_INCREMENT,
data date,
idfanhoto int,
idcurso int,
PRIMARY key(id),
FOREIGN key (idfanhoto) REFERENCES gafanhotos(id),
FOREIGN key(idcurso) REFERENCES cursos(idcurso)
)DEFAULT charset = utf8;


insert into assisti values (DEFAULT, '2020-08-19', '1', '2');


select * from gafanhotos as g
join assisti as a 
on g.id = a.idfanhoto
join cursos as c 
on c.idcurso = a.idcurso;
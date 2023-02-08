/* Modelagem Básica - 

ENTIDADE=TABELA
CAMPOS = ATRIBUTOS */

CLIENTE

NOME - CARACTER(30)
CPF - NUMERICO(11)
EMAIL - CARACTER(30)
TELEFONE - CARACTER(30)
ENDERECO - CARACTER(100)
SEXO - CARACTER(1)

/* PROCESSOS DE MODELAGEM  */

/* FASE 01 E FASE 02 - AD ADM DE DADOS */

MODELAGEM CONCEITUAL - RASCUNHO
MODELAGEM LÓGICA - QUALQUER PROGRAMA DE MODELAGEM

/* FASE 03 - DBA / AD */

MODELAGEM FÍSICA - SCRIPTS DE BANCO

/* INICIANDO A MODELAGEM FÍSICA */

/* CRIANDO O BANCO DE DADOS */

CREATE DATABASE EXEMPLO

CREATE DATABASE PROJETO;

/* CONECTANDO-SE AO BANCO */

USE PROJETO;

/* CRIANDO A TABELA DE CLIENTES */

CREATE TABLE CLIENTE(
	NOME VARCHAR(30),
	SEXO CHAR(1),
	EMAIL VARCHAR(30),
	CPF INT(11),
	TELEFONE VARCHAR(30),
	ENDERECO VARCHAR(100)

);

/* VERIFICANDO AS TABELAS DO BANCO */

SHOW TABLES;

USE EXEMPLO;
SHOW TABLES;

USE PROJETO;

/* DESCOBRINDO COMO É A ESTRUTURA DE UMA TABELA */

DESC CLIENTE;

-----

/*Tipos de dados */

/*
Todos os banos de dados possuem tipos que devem ser atribuidos aos dados de uma tabela.
Para caracteres literais, temos char e varchar, para números temos int e float, para
objetos como fotos e documentos, temos o blob, para textos extensos, temos o text. 
A disciplina de banco de dados é tão fantástica que ao entendermos o porque das coisas,
podemos iniciar já em modo avançado e um bom exemplo disso são os tipos. Há uma profissão
dentro da área que é a do analista de performance ou tuning, esse profissional é responsável
por analisar o banco de dados e deixá-lo mais rápido. Parece algo avançado, e é! Porém,
com alguas atitudes simples, podemos deixar o banco sem a necessidade de atuação desse profissional.

Cada caracter no banco de dados, vale 1 byte. Sendo assim, se eu entro com o dado JOÃO,
estou entrando com 4 bytes no meu banco. E o que isso tem a ver com a tiagem de tabelas?

O banco de dados funciona como um download de dados da internet. Se baixamos um arquivo de 1 giga,
temos um temo maior que o download de 50 megas, considerando a mesma velocidade de conexão.

Ao tiparmos uma tabela de modo errado ou displicente, vamos aumentar a quantidade de dados que 
será baixada do banco de dados, prolongando assim o tempo de resposta.

Uma comparacao bem didatica é o tipo char e varchar
A palavra var, vem de variant, em ingles, ou seja, que é dinâmica. Logo, vimos que 1 caracter
é igual a 1 byte. Vejamos então a tipagem

varchar(10)
char(10)

entrando a palavra joao

total de bytes varchar(10) = 4 bytes
toal de bytes cahr(10) = 10 bytes

isso ocorre pois o char não varia. Os caracteres restantes serao preenchidos com espaço. 
eles nao ficam vazios. Enquanto que no varchar, o tipo varia conforme o dado.
Entao utilizo sempre o varchar? Não. O charé ligeiramente mais performatico, por nao
ter que gastar tempo variando de tamanho. Entao a regra é utilizar sempre o char quando
sabemos que o numero de caracteres naquela coluna nao vai variar nunca. Por exemplo,
unidade federativa, com dois digitos, sexo com um digito e assim por diante. Vista a diferença
que podemos fazer com uma tipagem correta de tabelas, na próxima aula detalharemos os tipos do mysql
e nos modulos específicos de cada banco, você entenderá os tipos correspondentes no sql server
e no oracle, que mudam muito pouco. */

/*  Inserindo dados e valores nulos */

use projeto;

/* Mostrando as tabelas */
show tables

/* exibindo a estrutura de uma tabela */
desc cliente;

/* sintaxe basica de inserção - INSERT INTO TABELA... */

/* FORMA 01 - OMITINDO AS COLUNAS */

INSERT INTO CLIENTE VALUES('JOAO','M','JOAO@GMAIL.COM',988638273,'22923110','MAIA LACERDA - ESTACIO - RIO DE JANEIRO - RJ');

INSERT INTO CLIENTE VALUES('CELIA','F','CELIA@GMAIL.COM',541521456,'25078869','RIACHUELO - CENTRO - RIO DE JANEIRO - RJ');

INSERT INTO CLIENTE VALUES('JORGE','M',NULL,885755896,'58748895','OSCAR CURY - BOM RETIRO - PATOS DE MINAS - MG');

/* FORMA 02 - COLOCANDO AS COLUNAS */

INSERT INTO CLIENTE(NOME,SEXO,ENDERECO,TELEFONE,CPF) VALUES('LILIAN','F','SENADOR SOARES - TIJUCA - RIO DE JANEIRO - RJ','947785696',887774856);

/* FORMA 03 - INSERT COMPACTO - SOMENTE MYSQL */

INSERT INTO CLIENTE VALUES('ANA','F','ANA@GLOBO.COM',85548962,'548556985','PRES ANTONIO CARLOS - CENTRO - SAO PAULO - SP'),
                          ('CARLA','F','CARLA@TERATI.COM.BR',7745828,'66587458','SAMUEL SILVA - CENTRO - BELO HORIZONTE - MG');
						  
INSERT INTO CLIENTE(NOME,SEXO,ENDERECO,TELEFONE,CPF) VALUES('CLARA','F','SENADOR SOARES - TIJUCA - RIO DE JANEIRO - RJ','883665843',99999999999);

INSERT INTO CLIENTE(NOME,SEXO,ENDERECO,TELEFONE,CPF) VALUES('CLARA','F','SENADOR SOARES - TIJUCA - RIO DE JANEIRO - RJ','883665843',22222222222);
						  
/* O COMANDO SELECT 
selecao projecao e juncao
*/

SELECT NOW() as DATA_HORA, 'FELIPE MAFRA' AS PROFESSOR;

SELECT 'FELIPE MAFRA';

SELECT 'BANCO DE DADOS';

/* ALIAS DE COLUNAS */


SELECT NOME AS CLIENTE, SEXO, EMAIL FROM CLIENTE;

SELECT NOME, SEXO, EMAIL, ENDERECO FROM CLIENTE;

SELECT   EMAIL, SEXO, ENDERECO, NOME FROM CLIENTE;

SELECT   EMAIL, SEXO, ENDERECO, NOME, NOW() AS DATA_HORA FROM CLIENTE;

/* APENAS PARA FINS ACADEMICOS */

SELECT * FROM CLIENTE;

/*TABELA ERRADA - NAO DIGITE DIRETAMENTE NO BANCO */
CREATE TABLE CLIENTE(
	NOME VARCHAR(30),
	SEXO CHAR(1),
	EMAIL VARCHAR(30)
	CPF INT(11),
	TELEFONE VARCHAR(30),
	ENDERECO VARCHAR(100),

);

SELECT * FROM CLIENTE;


/* FILTRANDO DADOS COM WHERE E LIKE */

SELECT NOME, TELEFONE FROM CLIENTE;

/* FILTRANDO */

SELECT NOME, SEXO FROM CLIENTE
WHERE SEXO = 'M';

SELECT NOME, ENDERECO FROM CLIENTE
WHERE SEXO = 'F';

SELECT NOME, SEXO FROM CLIENTE
WHERE ENDERECO = 'RJ';

/* UTILIZANDO O LIKE */

SELECT NOME, SEXO FROM CLIENTE
WHERE ENDERECO LIKE 'RJ';

/* CARACTER CORINGA % -> QUALQUER COISA */

SELECT NOME, SEXO 
FROM CLIENTE
WHERE ENDERECO LIKE '%RJ';

SELECT NOME, SEXO, ENDERECO 
FROM CLIENTE
WHERE ENDERECO LIKE '%RJ';

SELECT NOME, SEXO, ENDERECO 
FROM CLIENTE
WHERE ENDERECO LIKE 'OSCAR CURY%';

SELECT NOME, SEXO, ENDERECO 
FROM CLIENTE
WHERE ENDERECO LIKE '%CENTRO%';

/* FILTRANDO VALORES NULOS */

SELECT NOME, SEXO, ENDERECO
FROM CLIENTE
WHERE sexo = 'F';

SELECT NOME, SEXO, ENDERECO
FROM CLIENTE
WHERE EMAIL = NULL;

SELECT NOME, SEXO, ENDERECO
FROM CLIENTE
WHERE EMAIL IS NULL;

SELECT NOME, SEXO, ENDERECO
FROM CLIENTE
WHERE EMAIL IS NOT NULL;

DROP DATABASE LIVRARIA;
CREATE DATABASE LIVRARIA;
USE LIVRARIA;

CREATE TABLE LIVROS(
    NOME_LIVRO VARCHAR(50),
    NOME_AUTOR VARCHAR(50),
    SEXO_AUTOR CHAR(1),
    NUMERO_PAGINAS INT(5),
    NOME_EDITORA VARCHAR(50),
    VALOR_LIVRO FLOAT(10, 2),
    UF CHAR(2),
    ANO_PUBLICACAO INT(4) 
);

INSERT INTO LIVROS VALUES('Cavaleiro Real', 'Ana Claudia', 'F', 465, 'Atlas', 49.9, 'RJ', 2009);
INSERT INTO LIVROS VALUES('SQL para leigos','João Nunes','M',450,'Addison',98,'SP',2018);
INSERT INTO LIVROS VALUES('Receitas Caseiras','Celia Tavares','F',210,'Atlas',45,'RJ',2008);
INSERT INTO LIVROS VALUES('Pessoas Efetivas','Eduardo Santos','M',390,'Beta',78,'RJ',2018);
INSERT INTO LIVROS VALUES('Habitos Saudáveis','Eduardo Santos','M',630,'Beta',150,'RJ',2019);
INSERT INTO LIVROS VALUES('A Casa Marrom','Hermes Macedo','M',250,'Bubba',60,'MG',2016);
INSERT INTO LIVROS VALUES('Estacio Querido','Geraldo Francisco','M',310,'Insignia',100,'ES',2015);
INSERT INTO LIVROS VALUES('Pra sempre amigas','Leda Silva','F',510,'Insignia',78,'ES',2011);
INSERT INTO LIVROS VALUES('Copas Inesqueciveis','Marco Alcantara','M',200,'Larson',130,'RS',2018);
INSERT INTO LIVROS VALUES('O poder da mente','Clara Mafra','F',120,'Continental',56,'SP',2017);

/* SELECIONAR TODOS OS LIVROS */
SELECT * FROM LIVROS;

/* TRAZER O NOME DO LIVRO E EDITORA */
SELECT NOME_LIVRO AS LIVRO, NOME_EDITORA AS EDITORA 
FROM LIVROS;

/*  TRAZER NOME DO LIVRO E UF DOS LIVROS PUBLICOS POR AUTORES DO SEXO MASCULINO */
SELECT NOME_LIVRO AS LIVRO, UF 
FROM LIVROS 
WHERE SEXO_AUTOR='M';

/* TRAZER O PREÇO DOS LIVROS DAS EDITORAS DE SÃO PAULO */
SELECT VALOR_LIVRO AS PRECO 
FROM LIVROS 
WHERE UF='SP';

/* TRAZER OS DADOS DOS AUTORES DO SEXO MASCULINO QUE TIVEREM LIVROS PUBLICADOS POR SÃO PAULO OU RIO DE JANEIRO */
SELECT NOME_AUTOR AS AUTOR, SEXO_AUTOR AS SEXO 
FROM LIVROS 
WHERE UF='SP' OR UF='RJ';

create database exercicio;

use exercicio;

create table funcionarios(
    idFuncionario integer,
    nome varchar(100),
    email varchar(200),
    sexo varchar(10),
    departamento varchar(100),
    admissao varchar(10),
    salario integer,
    cargo varchar(100),
    idRegiao int
);

SELECT departamento, COUNT(*)
FROM funcionarios
GROUP BY departamento;

SELECT sexo AS SEXO, COUNT(*)
FROM funcionarios
GROUP BY sexo;

/* EXERCICIO 1 */
SELECT nome AS NOME_FUNCIONARIO
FROM funcionarios
WHERE departamento='Roupas'
OR departamento='Filmes';

/* EXERCICIO 2 */
SELECT nome AS NOME_FUNCIONARIO
FROM funcionarios
WHERE 
(departamento='Lar' AND sexo='Feminino')
OR
(departamento='Filmes' AND sexo='Feminino');

/* EXERCICIO 3 */
SELECT nome AS NOME_FUNCIONARIO
FROM funcionarios
WHERE sexo='Masculino'
OR departamento='Jardim';

insert into funcionarios values (1,'Kelley','rkelley0@soundcloud.com','Feminino','Computadores','10/2/2009',67470,'Structural Engineer',2);
insert into funcionarios values (2,'Armstrong','sarmstrong1@infoseek.co.jp','Masculino','Esporte','3/31/2008',71869,'Financial Advisor',2);
insert into funcionarios values (3,'Carr','fcarr2@woothemes.com','Masculino','Automotivo','7/12/2009',101768,'Recruiting Manager',3);
insert into funcionarios values (4,'Murray','jmurray3@gov.uk','Feminino','Joalheria','12/25/2014',96897,'Desktop Support Technician',3);
insert into funcionarios values (5,'Ellis','jellis4@sciencedirect.com','Feminino','Alimentícios','9/19/2002',63702,'Software Engineer III',7);
insert into funcionarios values (6,'Phillips','bphillips5@time.com','Masculino','Ferramentas','8/21/2013',118497,'Executive Secretary',1);
insert into funcionarios values (7,'Williamson','rwilliamson6@ted.com','Masculino','Computadores','5/14/2006',65889,'Dental Hygienist',6);
insert into funcionarios values (8,'Harris','aharris7@ucoz.com','Feminino','Brinquedos','8/12/2003',84427,'Safety Technician I',4);
insert into funcionarios values (9,'James','rjames8@prnewswire.com','Masculino','Joalheria','9/7/2005',108657,'Sales Associate',2);
insert into funcionarios values (11,'Jacobs','jjacobsa@sbwire.com','Feminino','Joalheria','11/27/2003',121966,'Community Outreach Specialist',7);
insert into funcionarios values (12,'Black','mblackb@edublogs.org','Masculino','Roupas','2/4/2003',44179,'Data Coordiator',7);
insert into funcionarios values (13,'Schmidt','sschmidtc@state.gov','Masculino','Bebês','10/13/2002',85227,'Compensation Analyst',3);
insert into funcionarios values (14,'Webb','awebbd@baidu.com','Feminino','Computadores','10/22/2006',59763,'Software Test Engineer III',4);
insert into funcionarios values (15,'Jacobs','ajacobse@google.it','Feminino','Games','3/4/2007',141139,'Community Outreach Specialist',7);
insert into funcionarios values (16,'Medina','smedinaf@amazonaws.com','Feminino','Bebês','3/14/2008',106659,'Web Developer III',1);
insert into funcionarios values (17,'Morgan','dmorgang@123-reg.co.uk','Feminino','Crianças','5/4/2011',148952,'Programmer IV',6);
insert into funcionarios values (18,'Nguyen','jnguyenh@google.com','Masculino','Lar','11/3/2014',93804,'Geologist II',5);
insert into funcionarios values (19,'Day','rdayi@chronoengine.com','Masculino','Eletronicos','9/22/2004',109890,'VP Sales',3);
insert into funcionarios values (21,'Bryant','sbryantk@wunderground.com','Feminino','Industrial','8/12/2005',78052,'Software Consultant',3);
insert into funcionarios values (22,'Alexander','kalexanderl@marketwatch.com','Masculino','Automotivo','12/26/2011',144724,'Marketing Assistant',2);
insert into funcionarios values (23,'Chapman','jchapmanm@archive.org','Feminino','Joalheria','4/12/2001',126103,'Senior Developer',4);
insert into funcionarios values (24,'Kelly','ekellyn@weibo.com','Masculino','Jardim','6/29/2006',144965,'Nurse Practicioner',2);
insert into funcionarios values (25,'Stephens','jstephenso@ow.ly','Masculino','Brinquedos','6/4/2004',70613,'Business Systems Development Analyst',1);
insert into funcionarios values (26,'Porter','vporterp@yelp.com','Feminino','Lar','5/30/2011',90746,'Dental Hygienist',2);
insert into funcionarios values (27,'Owens','cowensq@shareasale.com','Feminino','Lar','5/26/2005',78698,'Executive Secretary',2);
insert into funcionarios values (28,'Scott','cscottr@sphinn.com','Feminino','Books','3/2/2008',63336,'Sales Representative',4);
insert into funcionarios values (29,'Price','cprices@Brasil.gov','Feminino','Roupas','7/5/2013',95436,'Quality Engineer',3);
insert into funcionarios values (30,'Weaver','dweavert@shinystat.com','Masculino','Beleza','2/17/2012',83144,'Account Representative III',2);
insert into funcionarios values (31,'Willis','hwillisu@army.mil','Feminino','Ferramentas','10/21/2012',113507,'Accountant I',7);
insert into funcionarios values (32,'Torres','ltorresv@amazon.de','Masculino','Games','4/7/2014',78245,'Nuclear Power Engineer',6);
insert into funcionarios values (35,'Smith','bsmithy@statcounter.com','Feminino','Books','6/13/2013',94884,'Librarian',7);
insert into funcionarios values (36,'Bradley','nbradleyz@goodreads.com','Masculino','Outdoors','12/28/2008',107222,'Payment Adjustment Coordinator',3);
insert into funcionarios values (37,'Cruz','rcruz10@blinklist.com','Feminino','Lar','5/20/2000',61739,'Quality Engineer',1);
insert into funcionarios values (38,'Williamson','dwilliamson11@rediff.com','Feminino','Jardim','1/25/2012',82026,'Nurse',2);
insert into funcionarios values (39,'Kennedy','skennedy12@rediff.com','Masculino','Bebês','7/2/2011',79339,'Civil Engineer',1);
insert into funcionarios values (40,'Hawkins','phawkins13@twitpic.com','Feminino','Roupas','8/20/2011',76809,'Quality Engineer',6);
insert into funcionarios values (41,'Allen','jallen14@ustream.tv','Feminino','Bebês','5/10/2001',89680,'Web Developer III',6);
insert into funcionarios values (42,'Watkins','mwatkins15@wiley.com','Masculino','Computadores','4/1/2008',125668,'Executive Secretary',7);
insert into funcionarios values (43,'Ferguson','mferguson16@qq.com','Masculino','Esporte','5/29/2009',82960,'Account Representative III',6);
insert into funcionarios values (45,'Nguyen','mnguyen18@biblegateway.com','Masculino','Automotivo','1/24/2002',108378,'Electrical Engineer',7);
insert into funcionarios values (46,'Lawrence','jlawrence19@linkedin.com','Masculino','Outdoors','12/11/2011',133424,'Junior Executive',7);
insert into funcionarios values (47,'Oliver','joliver1a@cnbc.com','Feminino','Roupas','8/30/2013',42797,'Software Engineer III',5);
insert into funcionarios values (48,'Johnson','jjohnson1b@usgs.gov','Masculino','Computadores','4/26/2004',134940,'Financial Advisor',4);
insert into funcionarios values (49,'Crawford','hcrawford1c@dell.com','Masculino','Lar','12/21/2008',119471,'Editor',6);
insert into funcionarios values (50,'Armstrong','parmstrong1d@hc360.com','Feminino','Automotivo','3/16/2010',89969,'Senior Editor',4);
insert into funcionarios values (51,'Dixon','jdixon1e@dot.gov','Masculino','Bebês','9/26/2006',106281,'Senior Developer',3);
insert into funcionarios values (52,'Snyder','ssnyder1f@ca.gov','Feminino','Crianças','9/26/2002',141678,'Design Engineer',3);
insert into funcionarios values (53,'Coleman','dcoleman1g@dedecms.com','Masculino','Computadores','6/14/2008',110839,'Automation Specialist I',1);
insert into funcionarios values (54,'Reed','sreed1h@intel.com','Feminino','Brinquedos','4/15/2001',84275,'VP Marketing',5);
insert into funcionarios values (55,'Ross','jross1i@infoseek.co.jp','Masculino','Automotivo','4/21/2004',71363,'Environmental Tech',3);
insert into funcionarios values (56,'Watkins','kwatkins1j@youtu.be','Masculino','Jardim','12/2/2002',93680,'VP Accounting',3);
insert into funcionarios values (57,'Allen','jallen1k@google.cn','Feminino','Outdoors','11/20/2000',73755,'Geologist II',3);
insert into funcionarios values (58,'Baker','jbaker1l@usnews.com','Masculino','Games','3/2/2007',68857,'Information Systems Manager',2);
insert into funcionarios values (59,'Garcia','vgarcia1m@deviantart.com','Feminino','Saúde','3/19/2002',48360,'Registered Nurse',6);
insert into funcionarios values (60,'Lane','elane1n@un.org','Masculino','Outdoors','7/15/2004',104896,'Financial Advisor',5);
insert into funcionarios values (61,'Watson','cwatson1o@paypal.com','Feminino','Ferramentas','8/10/2009',81870,'Occupational Therapist',7);
insert into funcionarios values (62,'Boyd','aboyd1p@artisteer.com','Masculino','Automotivo','5/29/2007',69936,'Senior Editor',7);
insert into funcionarios values (63,'Young','hyoung1q@cisco.com','Feminino','Alimentícios','12/11/2007',138844,'Mechanical Systems Engineer',6);
insert into funcionarios values (64,'Cooper','tcooper1r@umich.edu','Masculino','Jardim','11/12/2011',139796,'Office Assistant IV',1);
insert into funcionarios values (65,'Jordan','jjordan1s@about.me','Feminino','Automotivo','1/27/2000',86939,'Tax Accountant',3);
insert into funcionarios values (66,'Rodriguez','lrodriguez1t@narod.ru','Masculino','Beleza','9/27/2003',141949,'Product Engineer',4);
insert into funcionarios values (67,'Mills','jmills1u@printfriendly.com','Feminino','Alimentícios','8/8/2004',114200,'Senior Sales Associate',7);
insert into funcionarios values (68,'Coleman','kcoleman1v@360.cn','Masculino','Beleza','9/2/2012',121378,'Web Developer I',7);
insert into funcionarios values (69,'Stewart','dstewart1w@usnews.com','Masculino','Brinquedos','8/22/2000',148144,'Data Coordiator',4);
insert into funcionarios values (70,'Jordan','ajordan1x@moonfruit.com','Feminino','Games','11/13/2004',93839,'Database Administrator III',2);
insert into funcionarios values (71,'Vasquez','evasquez1y@behance.net','Masculino','Bebês','10/20/2002',77285,'Operator',6);
insert into funcionarios values (72,'Knight','tknight1z@weibo.com','Feminino','Música','10/13/2002',135688,'Statistician I',4);
insert into funcionarios values (73,'Palmer','ipalmer20@newsvine.com','Masculino','Esporte','4/3/2002',78828,'Director of Sales',2);
insert into funcionarios values (74,'Washington','jwashington21@squidoo.com','Feminino','Lar','7/11/2000',47206,'Programmer III',3);
insert into funcionarios values (75,'Sanchez','dsanchez22@blog.com','Feminino','Outdoors','10/6/2013',78157,'Senior Financial Analyst',1);
insert into funcionarios values (76,'Grant','egrant23@prlog.org','Feminino','Eletronicos','7/23/2000',49296,'Software Test Engineer II',6);
insert into funcionarios values (77,'Daniels','ndaniels24@google.ca','Masculino','Ferramentas','2/7/2013',139061,'Environmental Specialist',3);
insert into funcionarios values (78,'Medina','jmedina25@dot.gov','Feminino','Games','9/16/2005',114989,'Marketing Assistant',3);
insert into funcionarios values (79,'Cunningham','acunningham26@simplemachines.org','Masculino','Roupas','9/15/2002',88345,'Junior Executive',6);
insert into funcionarios values (80,'Little','klittle27@un.org','Masculino','Música','9/12/2001',114647,'Editor',5);
insert into funcionarios values (81,'Welch','jwelch28@1und1.de','Masculino','Outdoors','7/24/2004',118514,'Accounting Assistant III',5);
insert into funcionarios values (82,'Gilbert','hgilbert29@xrea.com','Feminino','Lar','5/11/2003',93712,'Junior Executive',7);
insert into funcionarios values (83,'George','ageorge2a@gmpg.org','Masculino','Industrial','5/2/2009',86373,'Compensation Analyst',7);
insert into funcionarios values (84,'Hughes','mhughes2b@youtube.com','Masculino','Crianças','1/28/2013',122110,'Structural Engineer',6);
insert into funcionarios values (85,'Williams','jwilliams2c@businesswire.com','Feminino','Games','3/26/2006',95542,'Nurse',2);
insert into funcionarios values (86,'Martinez','wmartinez2d@barnesandnoble.com','Feminino','Outdoors','5/25/2013',131392,'Systems Administrator II',2);
insert into funcionarios values (87,'Hamilton','hhamilton2e@google.de','Masculino','Música','10/23/2010',98401,'VP Quality Control',1);
insert into funcionarios values (88,'Gomez','jgomez2f@mtv.com','Feminino','Ferramentas','9/19/2004',103806,'Accounting Assistant I',3);
insert into funcionarios values (89,'Webb','awebb2g@springer.com','Masculino','Saúde','4/10/2014',73686,'Tax Accountant',2);
insert into funcionarios values (90,'Thomas','tthomas2h@webnode.com','Masculino','Games','11/3/2011',55002,'Research Assistant IV',6);
insert into funcionarios values (91,'Wallace','swallace2i@state.tx.us','Masculino','Bebês','3/7/2005',65216,'Registered Nurse',4);
insert into funcionarios values (92,'Ortiz','aortiz2j@jigsy.com','Feminino','Automotivo','6/22/2010',113231,'Senior Editor',7);
insert into funcionarios values (93,'Knight','nknight2k@cafepress.com','Feminino','Eletronicos','4/3/2014',125847,'Chemical Engineer',5);
insert into funcionarios values (94,'Hunt','thunt2l@twitpic.com','Feminino','Música','5/31/2000',140430,'Senior Cost Accountant',2);
insert into funcionarios values (96,'Mason','wmason2n@xrea.com','Masculino','Beleza','2/21/2004',96673,'Accounting Assistant I',1);
insert into funcionarios values (97,'Williams','wwilliams2o@berkeley.edu','Feminino','Games','3/14/2013',79267,'VP Quality Control',7);
insert into funcionarios values (98,'Freeman','lfreeman2p@tiny.cc','Feminino','Crianças','10/11/2007',109154,'Accountant I',4);
insert into funcionarios values (99,'Palmer','ipalmer2q@youku.com','Feminino','Books','4/24/2002',138815,'Physical Therapy Assistant',3);
insert into funcionarios values (100,'Bell','rbell2r@utexas.edu','Masculino','Esporte','8/3/2007',68210,'Registered Nurse',4);
insert into funcionarios values (101,'Rivera','jrivera2s@oakley.com','Masculino','Games','11/16/2002',137281,'VP Sales',3);
insert into funcionarios values (102,'Matthews','kmatthews2t@oaic.gov.au','Masculino','Saúde','8/9/2008',114970,'Statistician IV',2);
insert into funcionarios values (103,'Reed','dreed2u@arstechnica.com','Masculino','Automotivo','7/19/2003',126001,'Structural Engineer',6);
insert into funcionarios values (104,'Adams','eadams2v@yandex.ru','Masculino','Alimentícios','9/16/2003',78736,'Financial Analyst',6);
insert into funcionarios values (105,'Young','syoung2w@cmu.edu','Masculino','Calçados','9/16/2009',80830,'Quality Control Specialist',4);
insert into funcionarios values (106,'Gardner','rgardner2x@theguardian.com','Masculino','Crianças','8/6/2009',47879,'Product Engineer',5);
insert into funcionarios values (107,'Castillo','bcastillo2y@cornell.edu','Feminino','Computadores','3/31/2004',132634,'Civil Engineer',2);
insert into funcionarios values (108,'Perkins','jperkins2z@prlog.org','Masculino','Roupas','7/14/2005',68344,'Senior Cost Accountant',7);
insert into funcionarios values (109,'Freeman','bfreeman30@fda.gov','Feminino','Roupas','10/14/2007',147868,'General Manager',6);
insert into funcionarios values (110,'Howell','whowell31@free.fr','Masculino','Books','4/15/2011',67255,'Geologist III',4);
insert into funcionarios values (111,'Austin','naustin32@discuz.net','Feminino','Computadores','6/13/2012',47494,'Help Desk Operator',6);
insert into funcionarios values (113,'Moore','kmoore34@shareasale.com','Masculino','Bebês','3/1/2000',54413,'Operator',5);
insert into funcionarios values (114,'Sims','msims35@i2i.jp','Masculino','Alimentícios','12/6/2012',136790,'Nuclear Power Engineer',2);
insert into funcionarios values (115,'Nguyen','rnguyen36@bandcamp.com','Feminino','Roupas','6/30/2007',58420,'Graphic Designer',1);
insert into funcionarios values (116,'Wells','awells37@theatlantic.com','Masculino','Industrial','1/17/2002',73813,'Occupational Therapist',3);
insert into funcionarios values (118,'Fox','pfox39@discovery.com','Masculino','Automotivo','9/3/2009',87134,'Assistant Manager',3);
insert into funcionarios values (119,'Washington','wwashington3a@dot.gov','Feminino','Roupas','10/6/2008',148408,'Speech Pathologist',3);
insert into funcionarios values (120,'Evans','wevans3b@scientificamerican.com','Feminino','Brinquedos','1/23/2008',77335,'Chemical Engineer',4);
insert into funcionarios values (121,'Elliott','belliott3c@jiathis.com','Feminino','Esporte','8/5/2007',131409,'Technical Writer',7);
insert into funcionarios values (122,'Wagner','jwagner3d@fotki.com','Masculino','Bebês','2/26/2001',77530,'Librarian',1);
insert into funcionarios values (123,'Griffin','agriffin3e@mtv.com','Feminino','Jardim','4/26/2002',101875,'Business Systems Development Analyst',4);
insert into funcionarios values (124,'Chavez','mchavez3f@sohu.com','Feminino','Alimentícios','12/7/2005',144028,'Executive Secretary',6);
insert into funcionarios values (126,'Burton','bburton3h@360.cn','Masculino','Calçados','7/11/2013',79172,'Associate Professor',7);
insert into funcionarios values (127,'Harper','sharper3i@slideshare.net','Feminino','Outdoors','5/18/2000',144639,'VP Quality Control',7);
insert into funcionarios values (128,'Gibson','tgibson3j@ucoz.com','Masculino','Computadores','3/24/2003',109449,'Engineer II',7);
insert into funcionarios values (129,'Grant','lgrant3k@live.com','Feminino','Computadores','10/15/2006',108441,'Nurse',6);
insert into funcionarios values (130,'Nichols','bnichols3l@dropbox.com','Feminino','Games','7/3/2008',145692,'Recruiting Manager',5);
insert into funcionarios values (131,'Kelley','wkelley3m@domainmarket.com','Masculino','Calçados','2/24/2000',120377,'Research Nurse',4);
insert into funcionarios values (132,'Montgomery','rmontgomery3n@chicagotribune.com','Feminino','Lar','5/14/2003',63929,'Research Assistant IV',5);
insert into funcionarios values (133,'Martinez','dmartinez3o@deviantart.com','Masculino','Games','2/1/2001',124853,'Systems Administrator III',2);
insert into funcionarios values (134,'Harvey','jharvey3p@angelfire.com','Feminino','Outdoors','6/3/2010',99854,'VP Marketing',6);
insert into funcionarios values (135,'Hicks','ahicks3q@pcworld.com','Feminino','Crianças','8/11/2013',58675,'Technical Writer',3);
insert into funcionarios values (136,'Rose','lrose3r@slideshare.net','Feminino','Beleza','5/16/2007',50060,'Accountant IV',1);
insert into funcionarios values (137,'Simmons','jsimmons3s@imageshack.us','Feminino','Esporte','8/9/2014',72748,'Quality Control Specialist',3);
insert into funcionarios values (138,'Montgomery','wmontgomery3t@taobao.com','Masculino','Eletronicos','9/1/2005',71082,'Geologist III',7);
insert into funcionarios values (139,'Hart','rhart3u@wsj.com','Masculino','Joalheria','1/8/2012',119773,'Pharmacist',3);
insert into funcionarios values (140,'Wheeler','bwheeler3v@google.co.uk','Masculino','Computadores','1/22/2001',82358,'Information Systems Manager',4);
insert into funcionarios values (141,'Williamson','rwilliamson3w@amazon.co.jp','Masculino','Games','12/12/2005',145575,'VP Accounting',1);
insert into funcionarios values (142,'Burton','gburton3x@umich.edu','Masculino','Industrial','12/6/2009',105810,'Recruiter',5);
insert into funcionarios values (143,'Gutierrez','jgutierrez3y@tuttocitta.it','Masculino','Ferramentas','5/6/2014',58805,'Database Administrator I',1);
insert into funcionarios values (144,'Barnes','lbarnes3z@indiegogo.com','Feminino','Bebês','12/8/2008',112837,'Clinical Specialist',5);
insert into funcionarios values (145,'Day','lday40@upenn.edu','Feminino','Bebês','4/14/2013',125914,'Junior Executive',6);
insert into funcionarios values (147,'Hernandez','ahernandez42@pagesperso-orange.fr','Feminino','Música','10/6/2012',96169,'Civil Engineer',1);
insert into funcionarios values (149,'Meyer','jmeyer44@facebook.com','Feminino','Brinquedos','5/3/2008',76352,'Human Resources Assistant IV',4);
insert into funcionarios values (150,'Diaz','pdiaz45@who.int','Masculino','Saúde','10/15/2006',128748,'Web Developer III',1);
insert into funcionarios values (151,'Larson','blarson46@newsvine.com','Masculino','Books','8/9/2011',50066,'Operator',1);
insert into funcionarios values (152,'Roberts','droberts47@jimdo.com','Masculino','Música','7/22/2011',105319,'Compensation Analyst',4);
insert into funcionarios values (153,'Carroll','jcarroll48@cisco.com','Masculino','Lar','10/30/2003',110622,'Safety Technician IV',4);
insert into funcionarios values (154,'Russell','mrussell49@exblog.jp','Feminino','Eletronicos','10/16/2009',87422,'Help Desk Operator',7);
insert into funcionarios values (155,'Robinson','trobinson4a@amazon.com','Masculino','Books','9/6/2007',45456,'Chemical Engineer',1);
insert into funcionarios values (156,'Hayes','ahayes4b@guardian.co.uk','Masculino','Industrial','5/21/2004',52298,'Analyst Programmer',7);
insert into funcionarios values (157,'Henry','dhenry4c@yelp.com','Masculino','Calçados','5/14/2007',131252,'Account Representative III',1);
insert into funcionarios values (158,'Chavez','mchavez4d@baidu.com','Masculino','Jardim','2/23/2001',128766,'Desktop Support Technician',2);
insert into funcionarios values (159,'Harvey','eharvey4e@opera.com','Masculino','Ferramentas','9/12/2009',138179,'Analog Circuit Design manager',3);
insert into funcionarios values (160,'Gutierrez','cgutierrez4f@usnews.com','Feminino','Industrial','6/22/2003',85012,'Financial Analyst',1);
insert into funcionarios values (161,'Cruz','mcruz4g@dedecms.com','Masculino','Saúde','8/24/2001',131479,'Senior Cost Accountant',7);
insert into funcionarios values (162,'Sullivan','jsullivan4h@cloudflare.com','Feminino','Saúde','12/28/2005',103182,'Accounting Assistant I',2);
insert into funcionarios values (163,'Robertson','jrobertson4i@live.com','Masculino','Jardim','6/7/2000',96996,'Software Test Engineer I',4);
insert into funcionarios values (164,'Robertson','trobertson4j@youtu.be','Feminino','Computadores','8/30/2008',106607,'Automation Specialist I',2);
insert into funcionarios values (165,'Lawson','jlawson4k@prnewswire.com','Masculino','Automotivo','12/5/2012',130993,'Administrative Officer',2);
insert into funcionarios values (166,'Meyer','kmeyer4l@bloglovin.com','Masculino','Industrial','3/5/2006',87097,'Safety Technician IV',7);
insert into funcionarios values (167,'Lopez','rlopez4m@foxnews.com','Masculino','Outdoors','1/25/2013',131961,'Legal Assistant',4);
insert into funcionarios values (168,'Burns','pburns4n@networksolutions.com','Feminino','Joalheria','6/9/2014',88093,'Editor',7);
insert into funcionarios values (170,'Martinez','cmartinez4p@facebook.com','Masculino','Eletronicos','6/28/2004',52808,'Human Resources Assistant I',2);
insert into funcionarios values (172,'Fields','rfields4r@amazon.co.uk','Masculino','Books','9/5/2009',101520,'Project Manager',1);
insert into funcionarios values (173,'Fox','ffox4s@geocities.com','Feminino','Books','11/21/2005',55633,'Systems Administrator IV',1);
insert into funcionarios values (174,'Reynolds','dreynolds4t@biglobe.ne.jp','Feminino','Books','10/8/2010',91561,'VP Product Management',7);
insert into funcionarios values (175,'Daniels','cdaniels4u@rambler.ru','Masculino','Alimentícios','11/7/2013',77307,'Biostatistician IV',7);
insert into funcionarios values (176,'Fisher','rfisher4v@jigsy.com','Masculino','Roupas','10/14/2012',67942,'Financial Advisor',6);
insert into funcionarios values (177,'Ferguson','nferguson4w@networksolutions.com','Feminino','Roupas','9/18/2008',80397,'Compensation Analyst',1);
insert into funcionarios values (178,'Butler','cbutler4x@amazon.de','Feminino','Esporte','2/17/2003',78157,'Librarian',1);
insert into funcionarios values (179,'Reynolds','rreynolds4y@miitbeian.gov.cn','Feminino','Jardim','1/29/2004',121836,'VP Accounting',7);
insert into funcionarios values (180,'Williamson','nwilliamson4z@dropbox.com','Masculino','Outdoors','11/8/2008',76063,'Administrative Assistant II',6);
insert into funcionarios values (181,'Shaw','sshaw50@instagram.com','Feminino','Jardim','5/2/2001',56923,'Social Worker',2);
insert into funcionarios values (182,'Gomez','rgomez51@baidu.com','Feminino','Industrial','4/4/2009',76932,'Legal Assistant',5);
insert into funcionarios values (183,'Harrison','jharrison52@scientificamerican.com','Feminino','Games','8/3/2002',64410,'Senior Developer',2);
insert into funcionarios values (184,'Watson','ewatson53@latimes.com','Feminino','Books','2/2/2008',111873,'Payment Adjustment Coordinator',2);
insert into funcionarios values (185,'Watson','rwatson54@webeden.co.uk','Feminino','Roupas','9/22/2001',74648,'Saúde Coach III',2);
insert into funcionarios values (186,'Larson','dlarson55@technorati.com','Feminino','Brinquedos','9/17/2011',144991,'Technical Writer',7);
insert into funcionarios values (187,'Gordon','kgordon56@techcrunch.com','Feminino','Outdoors','11/4/2005',107407,'Systems Administrator II',3);
insert into funcionarios values (188,'Rose','erose57@guardian.co.uk','Masculino','Alimentícios','3/17/2012',120225,'Editor',7);
insert into funcionarios values (189,'Anderson','banderson58@wsj.com','Masculino','Lar','12/2/2014',122272,'Environmental Specialist',2);
insert into funcionarios values (190,'Powell','hpowell59@geocities.com','Feminino','Saúde','11/13/2002',120577,'Web Designer III',1);
insert into funcionarios values (191,'Woods','dwoods5a@businesswire.com','Feminino','Eletronicos','4/29/2008',148986,'Structural Analysis Engineer',1);
insert into funcionarios values (192,'Morales','jmorales5b@joomla.org','Masculino','Games','2/10/2000',101855,'Engineer IV',4);
insert into funcionarios values (193,'Stanley','dstanley5c@is.gd','Feminino','Industrial','2/17/2006',140850,'Financial Analyst',4);
insert into funcionarios values (194,'Wagner','ewagner5d@cornell.edu','Masculino','Brinquedos','2/1/2006',142516,'Professor',1);
insert into funcionarios values (195,'Meyer','nmeyer5e@about.me','Masculino','Calçados','11/9/2012',48829,'Accountant I',1);
insert into funcionarios values (196,'Jacobs','rjacobs5f@oracle.com','Masculino','Outdoors','9/16/2006',81270,'Geological Engineer',1);
insert into funcionarios values (197,'Hayes','jhayes5g@jiathis.com','Feminino','Beleza','1/3/2011',130097,'Office Assistant IV',5);
insert into funcionarios values (198,'Sanders','esanders5h@ihg.com','Feminino','Industrial','1/24/2000',117905,'Dental Hygienist',4);
insert into funcionarios values (199,'Reed','sreed5i@bloglovin.com','Feminino','Calçados','11/12/2010',142483,'Social Worker',3);
insert into funcionarios values (201,'Andrews','jandrews5k@free.fr','Masculino','Lar','3/18/2009',48684,'Nurse Practicioner',6);
insert into funcionarios values (202,'Morris','lmorris5l@patch.com','Feminino','Automotivo','1/23/2004',91932,'Analyst Programmer',1);
insert into funcionarios values (203,'Moreno','jmoreno5m@xing.com','Feminino','Alimentícios','10/7/2005',112004,'Internal Auditor',7);
insert into funcionarios values (204,'Powell','cpowell5n@cocolog-nifty.com','Feminino','Beleza','9/25/2000',116013,'Tax Accountant',4);
insert into funcionarios values (205,'Graham','jgraham5o@printfriendly.com','Feminino','Games','9/10/2008',109058,'Chemical Engineer',7);
insert into funcionarios values (206,'Riley','hriley5p@dailymotion.com','Masculino','Brinquedos','5/6/2012',61992,'Sales Representative',4);
insert into funcionarios values (208,'Gilbert','rgilbert5r@domainmarket.com','Feminino','Alimentícios','12/15/2001',67746,'Director of Sales',2);
insert into funcionarios values (209,'Peterson','jpeterson5s@t-online.de','Masculino','Books','3/14/2010',104530,'VP Marketing',2);
insert into funcionarios values (210,'Foster','jfoster5t@icq.com','Feminino','Música','1/17/2008',42759,'Social Worker',4);
insert into funcionarios values (211,'Fowler','afowler5u@parallels.com','Feminino','Crianças','2/25/2011',43097,'Associate Professor',2);
insert into funcionarios values (212,'Matthews','fmatthews5v@theatlantic.com','Feminino','Outdoors','11/22/2005',123936,'Internal Auditor',1);
insert into funcionarios values (213,'Thomas','gthomas5w@slate.com','Masculino','Ferramentas','11/28/2006',128239,'Teacher',6);
insert into funcionarios values (214,'West','gwest5x@hao123.com','Masculino','Computadores','10/31/2003',66084,'Electrical Engineer',6);
insert into funcionarios values (215,'Stevens','estevens5y@salon.com','Masculino','Games','3/14/2009',106729,'Occupational Therapist',5);
insert into funcionarios values (216,'Howard','dhoward5z@soundcloud.com','Masculino','Joalheria','3/15/2009',87269,'General Manager',4);
insert into funcionarios values (217,'Boyd','mboyd60@jimdo.com','Masculino','Lar','12/1/2004',128765,'Senior Financial Analyst',2);
insert into funcionarios values (218,'Ross','iross61@jimdo.com','Masculino','Games','5/25/2003',104671,'VP Marketing',7);
insert into funcionarios values (219,'Harrison','vharrison62@networkadvertising.org','Masculino','Calçados','5/1/2011',55073,'Assistant Professor',4);
insert into funcionarios values (220,'Ellis','lellis63@ucla.edu','Feminino','Outdoors','11/21/2007',146256,'Paralegal',1);
insert into funcionarios values (221,'Diaz','sdiaz64@disqus.com','Feminino','Lar','1/15/2005',55077,'Registered Nurse',7);
insert into funcionarios values (222,'Snyder','asnyder65@soundcloud.com','Feminino','Alimentícios','4/11/2011',124215,'Recruiting Manager',2);
insert into funcionarios values (223,'Gibson','bgibson66@lulu.com','Masculino','Computadores','4/28/2008',105444,'Human Resources Assistant II',6);
insert into funcionarios values (224,'Hanson','dhanson67@cmu.edu','Feminino','Esporte','5/1/2010',141513,'funcionarios Accountant I',1);
insert into funcionarios values (225,'Peterson','mpeterson68@Lar.pl','Feminino','Calçados','3/13/2008',97623,'Technical Writer',1);
insert into funcionarios values (226,'Gonzalez','tgonzalez69@umich.edu','Masculino','Saúde','11/12/2005',106833,'Registered Nurse',7);
insert into funcionarios values (227,'Rivera','crivera6a@amazon.co.jp','Feminino','Beleza','4/18/2006',69045,'Accounting Assistant IV',2);
insert into funcionarios values (228,'Washington','cwashington6b@cargocollective.com','Masculino','Outdoors','7/4/2008',113311,'Programmer III',2);
insert into funcionarios values (229,'Ruiz','lruiz6c@thetimes.co.uk','Feminino','Outdoors','11/2/2013',116301,'Design Engineer',3);
insert into funcionarios values (230,'Ford','sford6d@flavors.me','Feminino','Industrial','1/5/2006',138459,'Geological Engineer',1);
insert into funcionarios values (231,'Day','lday6e@usgs.gov','Feminino','Roupas','7/3/2005',87800,'Sales Associate',7);
insert into funcionarios values (232,'Peterson','apeterson6f@sina.com.cn','Feminino','Crianças','5/27/2000',52572,'Compensation Analyst',7);
insert into funcionarios values (233,'Gonzalez','rgonzalez6g@europa.eu','Masculino','Eletronicos','4/24/2009',44917,'Biostatistician IV',5);
insert into funcionarios values (234,'Walker','jwalker6h@google.es','Feminino','Calçados','2/2/2010',110896,'Accountant II',2);
insert into funcionarios values (235,'Griffin','sgriffin6i@123-reg.co.uk','Masculino','Books','12/22/2001',108970,'Senior Cost Accountant',2);
insert into funcionarios values (236,'Tucker','jtucker6j@dailymail.co.uk','Masculino','Joalheria','4/27/2009',83543,'Programmer II',5);
insert into funcionarios values (237,'Armstrong','aarmstrong6k@redcross.org','Feminino','Música','7/14/2013',63598,'Budget/Accounting Analyst II',1);
insert into funcionarios values (238,'Gonzales','cgonzales6l@berkeley.edu','Masculino','Filmes','4/6/2014',131274,'Clinical Specialist',2);
insert into funcionarios values (239,'Williamson','jwilliamson6m@arizona.edu','Feminino','Computadores','2/16/2005',149085,'Software Engineer III',7);
insert into funcionarios values (240,'Spencer','wspencer6n@marriott.com','Masculino','Games','9/21/2013',143223,'funcionarios Accountant IV',6);
insert into funcionarios values (241,'Rose','jrose6o@dion.ne.jp','Feminino','Roupas','12/22/2010',107207,'Web Developer II',3);
insert into funcionarios values (242,'Robinson','probinson6p@ucla.edu','Masculino','Saúde','11/30/2003',137594,'Operator',6);
insert into funcionarios values (243,'Gutierrez','kgutierrez6q@bravesites.com','Masculino','Lar','1/26/2006',139845,'Director of Sales',4);
insert into funcionarios values (244,'Alvarez','jalvarez6r@geocities.com','Feminino','Esporte','9/7/2012',65563,'Help Desk Technician',4);
insert into funcionarios values (245,'Webb','swebb6s@people.com.cn','Feminino','Crianças','1/2/2014',142988,'Marketing Manager',6);
insert into funcionarios values (246,'Ellis','tellis6t@squarespace.com','Feminino','Industrial','1/22/2000',134074,'Product Engineer',6);
insert into funcionarios values (247,'Romero','jromero6u@cafepress.com','Masculino','Brinquedos','1/21/2010',80654,'Geological Engineer',2);
insert into funcionarios values (248,'White','jwhite6v@tripadvisor.com','Masculino','Jardim','12/13/2005',118834,'Financial Analyst',6);
insert into funcionarios values (249,'Miller','jmiller6w@businesswire.com','Masculino','Crianças','3/3/2013',85559,'Pharmacist',2);
insert into funcionarios values (250,'Fowler','mfowler6x@geocities.jp','Masculino','Books','9/15/2001',84049,'Information Systems Manager',5);
insert into funcionarios values (251,'Duncan','pduncan6y@sina.com.cn','Feminino','Joalheria','1/16/2011',47439,'Tax Accountant',7);
insert into funcionarios values (252,'Johnston','jjohnston6z@irs.gov','Masculino','Ferramentas','12/16/2000',87072,'Structural Engineer',7);
insert into funcionarios values (253,'Marshall','mmarshall70@hibu.com','Feminino','Computadores','5/12/2003',123401,'Computer Systems Analyst I',4);
insert into funcionarios values (254,'Lawrence','alawrence71@unicef.org','Feminino','Alimentícios','4/2/2001',131681,'Account Executive',7);
insert into funcionarios values (255,'Lynch','rlynch72@sitemeter.com','Feminino','Crianças','8/29/2014',96118,'Social Worker',5);
insert into funcionarios values (256,'Stone','gstone73@google.es','Feminino','Books','12/1/2006',87816,'Administrative Assistant I',2);
insert into funcionarios values (257,'Freeman','gfreeman74@bloomberg.com','Feminino','Lar','6/5/2012',83804,'Operator',1);
insert into funcionarios values (258,'Schmidt','dschmidt75@sitemeter.com','Masculino','Automotivo','10/26/2007',133612,'VP Product Management',4);
insert into funcionarios values (259,'Wallace','gwallace76@technorati.com','Feminino','Computadores','4/14/2010',47007,'Internal Auditor',3);
insert into funcionarios values (260,'Fuller','ffuller77@ustream.tv','Masculino','Saúde','12/13/2005',142967,'GIS Technical Architect',5);
insert into funcionarios values (261,'Bennett','jbennett78@surveymonkey.com','Feminino','Crianças','12/6/2011',71433,'Food Chemist',4);
insert into funcionarios values (262,'Lewis','dlewis79@parallels.com','Feminino','Beleza','3/8/2000',74191,'Business Systems Development Analyst',1);
insert into funcionarios values (263,'Snyder','dsnyder7a@digg.com','Masculino','Filmes','1/29/2005',109004,'Account Coordinator',5);
insert into funcionarios values (264,'Sanders','ksanders7b@pinterest.com','Masculino','Industrial','4/20/2014',102211,'Senior Cost Accountant',3);
insert into funcionarios values (265,'Fox','wfox7c@yelp.com','Masculino','Computadores','8/3/2000',75862,'Electrical Engineer',5);
insert into funcionarios values (266,'Burke','cburke7d@ameblo.jp','Masculino','Joalheria','3/5/2000',61446,'Environmental Specialist',2);
insert into funcionarios values (267,'Murphy','dmurphy7e@patch.com','Masculino','Lar','6/2/2011',146432,'VP Quality Control',2);
insert into funcionarios values (268,'Bowman','hbowman7f@reddit.com','Feminino','Alimentícios','2/18/2002',50623,'Biostatistician III',7);
insert into funcionarios values (269,'Cunningham','kcunningham7g@squidoo.com','Masculino','Outdoors','12/11/2014',108248,'Safety Technician I',3);
insert into funcionarios values (270,'Torres','ttorres7h@telegraph.co.uk','Feminino','Automotivo','8/6/2005',120875,'Software Consultant',1);
insert into funcionarios values (271,'Jordan','pjordan7i@squidoo.com','Feminino','Esporte','8/7/2001',123843,'Senior Sales Associate',7);
insert into funcionarios values (272,'Banks','jbanks7j@dion.ne.jp','Masculino','Música','5/16/2014',43940,'Saúde Coach I',2);
insert into funcionarios values (273,'Gordon','egordon7k@yellowbook.com','Feminino','Filmes','1/6/2013',142840,'Account Coordinator',1);
insert into funcionarios values (274,'Bennett','abennett7l@guardian.co.uk','Masculino','Jardim','8/1/2006',125713,'Account Representative III',3);
insert into funcionarios values (275,'Rivera','arivera7m@comcast.net','Feminino','Books','4/26/2010',122219,'Engineer I',6);
insert into funcionarios values (276,'Ellis','dellis7n@seesaa.net','Feminino','Eletronicos','5/21/2000',46259,'Help Desk Technician',6);
insert into funcionarios values (277,'Richardson','lrichardson7o@fc2.com','Feminino','Roupas','7/14/2003',142403,'Engineer III',3);
insert into funcionarios values (278,'Ortiz','wortiz7p@reddit.com','Masculino','Jardim','1/26/2000',88165,'Librarian',4);
insert into funcionarios values (279,'Clark','mclark7q@privacy.gov.au','Masculino','Jardim','6/26/2007',86291,'Dental Hygienist',7);
insert into funcionarios values (280,'Chavez','rchavez7r@youtu.be','Masculino','Crianças','6/4/2008',139163,'Legal Assistant',5);
insert into funcionarios values (281,'Holmes','aholmes7s@last.fm','Masculino','Música','11/5/2006',48892,'Accounting Assistant I',1);
insert into funcionarios values (282,'Fowler','rfowler7t@ameblo.jp','Feminino','Outdoors','12/24/2014',120540,'Junior Executive',6);
insert into funcionarios values (283,'George','ageorge7u@1und1.de','Feminino','Saúde','3/13/2000',47450,'Automation Specialist I',1);
insert into funcionarios values (284,'Murray','kmurray7v@ca.gov','Feminino','Saúde','8/25/2008',142255,'Quality Engineer',4);
insert into funcionarios values (285,'Hunter','rhunter7w@buzzfeed.com','Masculino','Jardim','8/16/2000',62441,'Environmental Specialist',3);
insert into funcionarios values (286,'Long','elong7x@nymag.com','Feminino','Games','3/11/2007',142529,'Librarian',2);
insert into funcionarios values (287,'Andrews','tandrews7y@ycombinator.com','Feminino','Beleza','3/19/2010',142103,'Associate Professor',4);
insert into funcionarios values (288,'Moore','bmoore7z@twitpic.com','Masculino','Eletronicos','8/11/2002',102395,'Account Coordinator',6);
insert into funcionarios values (289,'Sanders','csanders80@blog.com','Masculino','Lar','10/9/2009',44593,'Engineer III',2);
insert into funcionarios values (290,'Carter','scarter81@cargocollective.com','Masculino','Alimentícios','2/9/2007',120800,'Accountant III',5);
insert into funcionarios values (291,'Moreno','rmoreno82@alibaba.com','Feminino','Books','11/26/2003',121238,'Senior Developer',4);
insert into funcionarios values (292,'Ortiz','dortiz83@themeforest.net','Feminino','Automotivo','12/8/2011',91296,'Environmental Tech',6);
insert into funcionarios values (293,'Castillo','pcastillo84@1688.com','Feminino','Saúde','8/24/2011',86070,'Clinical Specialist',3);
insert into funcionarios values (294,'Cooper','icooper85@w3.org','Feminino','Filmes','1/31/2009',61519,'Human Resources Assistant III',7);
insert into funcionarios values (295,'Harris','lharris86@ibm.com','Feminino','Books','9/20/2005',47131,'Developer IV',6);
insert into funcionarios values (296,'Edwards','aedwards87@webeden.co.uk','Masculino','Crianças','4/7/2008',93962,'funcionarios Scientist',3);
insert into funcionarios values (297,'Harrison','nharrison88@imageshack.us','Masculino','Calçados','11/12/2014',133845,'Executive Secretary',4);
insert into funcionarios values (298,'Berry','lberry89@gov.uk','Masculino','Roupas','6/17/2010',43067,'Research Assistant I',7);
insert into funcionarios values (299,'Stephens','cstephens8a@imdb.com','Feminino','Beleza','9/1/2001',88972,'Paralegal',7);
insert into funcionarios values (300,'Arnold','barnold8b@thetimes.co.uk','Masculino','Roupas','11/15/2005',77635,'VP Product Management',3);
insert into funcionarios values (301,'Myers','amyers8c@ibm.com','Masculino','Alimentícios','5/16/2011',148993,'Speech Pathologist',1);
insert into funcionarios values (302,'Jenkins','rjenkins8d@wufoo.com','Feminino','Ferramentas','8/15/2002',113599,'Geological Engineer',2);
insert into funcionarios values (303,'West','jwest8e@berkeley.edu','Masculino','Eletronicos','3/15/2012',76943,'General Manager',7);
insert into funcionarios values (304,'Mccoy','mmccoy8f@wisc.edu','Feminino','Books','5/26/2007',77486,'Community Outreach Specialist',4);
insert into funcionarios values (305,'Johnson','fjohnson8g@wikipedia.org','Masculino','Eletronicos','11/20/2013',135001,'Recruiting Manager',4);
insert into funcionarios values (306,'Sanders','ssanders8h@mtv.com','Masculino','Bebês','11/10/2008',52171,'Data Coordiator',2);
insert into funcionarios values (307,'Cunningham','acunningham8i@wikimedia.org','Feminino','Jardim','6/22/2006',139302,'Engineer IV',5);
insert into funcionarios values (308,'Lynch','slynch8j@123-reg.co.uk','Feminino','Saúde','8/9/2000',126683,'Librarian',4);
insert into funcionarios values (309,'Riley','driley8k@dell.com','Masculino','Esporte','7/4/2006',143781,'Product Engineer',4);
insert into funcionarios values (310,'Ray','aray8l@cbc.ca','Masculino','Books','3/5/2008',51761,'Cost Accountant',5);
insert into funcionarios values (311,'Lane','plane8m@pbs.org','Masculino','Calçados','5/26/2011',45463,'Marketing Manager',5);
insert into funcionarios values (312,'Jordan','pjordan8n@adobe.com','Feminino','Roupas','11/15/2003',133498,'Nuclear Power Engineer',7);
insert into funcionarios values (313,'Gibson','bgibson8o@pen.io','Feminino','Lar','3/21/2011',81273,'Saúde Coach II',4);
insert into funcionarios values (314,'Elliott','telliott8p@mozilla.org','Masculino','Computadores','2/27/2008',77921,'Environmental Specialist',7);
insert into funcionarios values (315,'Smith','bsmith8q@mysql.com','Masculino','Games','7/25/2012',59580,'General Manager',2);
insert into funcionarios values (316,'Peters','cpeters8r@epa.gov','Masculino','Esporte','9/16/2010',40418,'VP Marketing',2);
insert into funcionarios values (317,'Tucker','htucker8s@photobucket.com','Masculino','Alimentícios','8/5/2004',104844,'Structural Analysis Engineer',3);
insert into funcionarios values (318,'Moore','jmoore8t@umich.edu','Masculino','Computadores','4/27/2003',139304,'Help Desk Technician',3);
insert into funcionarios values (319,'Crawford','mcrawford8u@parallels.com','Feminino','Lar','12/20/2011',140996,'Software Engineer IV',3);
insert into funcionarios values (320,'Gilbert','egilbert8v@nydailynews.com','Masculino','Jardim','4/12/2010',52430,'Assistant Media Planner',5);
insert into funcionarios values (321,'Wheeler','jwheeler8w@whitehouse.gov','Feminino','Books','8/24/2001',145284,'Information Systems Manager',7);
insert into funcionarios values (322,'Marshall','jmarshall8x@va.gov','Masculino','Computadores','11/7/2013',66063,'Web Designer III',2);
insert into funcionarios values (323,'Robinson','rrobinson8y@businessinsider.com','Masculino','Eletronicos','4/10/2008',134422,'Occupational Therapist',4);
insert into funcionarios values (324,'Stevens','astevens8z@si.edu','Feminino','Computadores','5/19/2012',106229,'Research Associate',4);
insert into funcionarios values (325,'Wright','kwright90@buzzfeed.com','Feminino','Roupas','5/13/2012',107727,'Computer Systems Analyst I',2);
insert into funcionarios values (326,'Castillo','bcastillo91@hc360.com','Feminino','Joalheria','12/12/2007',130188,'Social Worker',3);
insert into funcionarios values (327,'Edwards','medwards92@mail.ru','Masculino','Automotivo','10/4/2002',140194,'Programmer IV',5);
insert into funcionarios values (328,'Hanson','bhanson93@blinklist.com','Feminino','Computadores','1/6/2005',58719,'Media Manager I',4);
insert into funcionarios values (329,'Mccoy','hmccoy94@miitbeian.gov.cn','Feminino','Calçados','7/27/2004',86803,'Administrative Assistant III',4);
insert into funcionarios values (330,'Dunn','cdunn95@ft.com','Masculino','Industrial','6/23/2010',68334,'Administrative Officer',7);
insert into funcionarios values (331,'Hudson','jhudson96@thetimes.co.uk','Feminino','Esporte','12/23/2008',91906,'Food Chemist',4);
insert into funcionarios values (332,'Garza','lgarza97@bing.com','Feminino','Games','12/20/2006',48064,'Office Assistant II',5);
insert into funcionarios values (333,'Garza','pgarza98@go.com','Masculino','Industrial','6/30/2004',75281,'Data Coordiator',7);
insert into funcionarios values (334,'Mills','fmills99@ameblo.jp','Masculino','Industrial','3/24/2009',91659,'VP Accounting',4);
insert into funcionarios values (335,'Gilbert','pgilbert9a@wiley.com','Feminino','Esporte','10/3/2001',52792,'Pharmacist',2);
insert into funcionarios values (336,'Campbell','pcampbell9b@istockphoto.com','Feminino','Lar','8/30/2001',40415,'Food Chemist',4);
insert into funcionarios values (337,'Spencer','dspencer9c@ed.gov','Masculino','Filmes','6/16/2008',83256,'Senior Editor',5);
insert into funcionarios values (338,'Garrett','kgarrett9d@wordpress.com','Feminino','Eletronicos','12/30/2012',145181,'Programmer Analyst III',1);
insert into funcionarios values (339,'Hudson','rhudson9e@geocities.com','Feminino','Joalheria','7/23/2004',78294,'Software Consultant',4);
insert into funcionarios values (340,'Williams','jwilliams9f@canalblog.com','Masculino','Eletronicos','7/3/2007',90120,'Biostatistician I',2);
insert into funcionarios values (341,'Ellis','cellis9g@ibm.com','Masculino','Lar','9/24/2008',80284,'VP Accounting',3);
insert into funcionarios values (342,'Carroll','scarroll9h@yellowbook.com','Feminino','Calçados','7/26/2009',85511,'Business Systems Development Analyst',5);
insert into funcionarios values (343,'Long','along9i@ocn.ne.jp','Feminino','Brinquedos','6/13/2008',40138,'Payment Adjustment Coordinator',6);
insert into funcionarios values (344,'Owens','eowens9j@skyrock.com','Masculino','Books','6/17/2010',42714,'Electrical Engineer',7);
insert into funcionarios values (345,'Perez','jperez9k@bloglines.com','Masculino','Música','6/21/2005',65767,'Programmer Analyst I',4);
insert into funcionarios values (346,'Freeman','lfreeman9l@cpanel.net','Feminino','Crianças','2/13/2013',149351,'Design Engineer',7);
insert into funcionarios values (347,'Frazier','dfrazier9m@amazon.co.uk','Feminino','Ferramentas','1/3/2012',88470,'Associate Professor',1);
insert into funcionarios values (348,'Thomas','athomas9n@answers.com','Feminino','Eletronicos','11/26/2009',90317,'Saúde Coach I',4);
insert into funcionarios values (349,'Crawford','acrawford9o@cpanel.net','Masculino','Jardim','10/10/2012',142149,'Compensation Analyst',2);
insert into funcionarios values (350,'Hawkins','ahawkins9p@hud.gov','Masculino','Eletronicos','5/21/2000',144073,'Programmer I',1);
insert into funcionarios values (351,'Fuller','jfuller9q@merriam-webster.com','Feminino','Books','8/17/2001',54410,'Programmer Analyst II',7);
insert into funcionarios values (352,'Moreno','smoreno9r@slate.com','Masculino','Lar','6/28/2000',107907,'Financial Advisor',5);
insert into funcionarios values (353,'Gonzales','jgonzales9s@sourceforge.net','Feminino','Lar','7/10/2010',91249,'Mechanical Systems Engineer',2);
insert into funcionarios values (354,'Hudson','shudson9t@shareasale.com','Masculino','Outdoors','12/20/2005',78478,'Compensation Analyst',5);
insert into funcionarios values (355,'Murray','cmurray9u@reverbnation.com','Masculino','Esporte','7/7/2005',48812,'Human Resources Assistant III',7);
insert into funcionarios values (356,'Stephens','estephens9v@bbc.co.uk','Feminino','Alimentícios','4/27/2000',147440,'Sales Associate',2);
insert into funcionarios values (357,'Reynolds','dreynolds9w@angelfire.com','Masculino','Outdoors','5/18/2003',87978,'Senior Financial Analyst',1);
insert into funcionarios values (358,'Gutierrez','jgutierrez9x@telegraph.co.uk','Masculino','Automotivo','6/17/2002',67800,'Desktop Support Technician',2);
insert into funcionarios values (359,'Tucker','gtucker9y@instagram.com','Masculino','Bebês','5/14/2010',42944,'Tax Accountant',3);
insert into funcionarios values (360,'Jenkins','jjenkins9z@w3.org','Feminino','Automotivo','7/18/2004',84356,'Marketing Assistant',2);
insert into funcionarios values (361,'Rice','dricea0@hubpages.com','Feminino','Jardim','12/6/2006',144724,'Senior Quality Engineer',7);
insert into funcionarios values (362,'Burke','jburkea1@mayoclinic.com','Masculino','Alimentícios','9/8/2003',147290,'Analyst Programmer',6);
insert into funcionarios values (363,'Hall','jhalla2@prweb.com','Masculino','Automotivo','12/28/2001',83177,'Community Outreach Specialist',3);
insert into funcionarios values (364,'Ryan','rryana3@twitter.com','Masculino','Saúde','5/31/2014',83252,'Civil Engineer',3);
insert into funcionarios values (365,'Gonzales','jgonzalesa4@cpanel.net','Masculino','Roupas','8/30/2000',127393,'Help Desk Technician',7);
insert into funcionarios values (366,'Jacobs','bjacobsa5@domainmarket.com','Masculino','Industrial','1/29/2006',67186,'Research Nurse',1);
insert into funcionarios values (367,'Ramos','jramosa6@cdbaby.com','Feminino','Beleza','3/5/2002',102361,'Computer Systems Analyst III',5);
insert into funcionarios values (368,'Rivera','driveraa7@typepad.com','Feminino','Crianças','8/15/2001',60688,'Paralegal',1);
insert into funcionarios values (369,'Lawrence','llawrencea8@mozilla.com','Feminino','Eletronicos','4/24/2013',44704,'Data Coordiator',2);
insert into funcionarios values (370,'Austin','eaustina9@answers.com','Masculino','Lar','1/9/2002',110627,'Teacher',7);
insert into funcionarios values (371,'Sims','bsimsaa@privacy.gov.au','Masculino','Esporte','6/4/2000',127223,'Operator',5);
insert into funcionarios values (372,'Harper','rharperab@china.com.cn','Feminino','Crianças','8/31/2001',96163,'Safety Technician IV',3);
insert into funcionarios values (374,'Mcdonald','jmcdonaldad@sbwire.com','Feminino','Bebês','9/19/2005',141464,'Programmer IV',4);
insert into funcionarios values (375,'Hudson','mhudsonae@ihg.com','Feminino','Industrial','8/27/2014',88029,'Help Desk Operator',4);
insert into funcionarios values (376,'Harper','charperaf@google.pl','Masculino','Lar','3/21/2007',47281,'VP Quality Control',6);
insert into funcionarios values (377,'Alexander','valexanderag@amazon.co.uk','Feminino','Eletronicos','1/15/2002',93245,'funcionarios Scientist',1);
insert into funcionarios values (378,'Nichols','bnicholsah@networkadvertising.org','Masculino','Automotivo','7/30/2012',110589,'Cost Accountant',7);
insert into funcionarios values (380,'Turner','bturneraj@samsung.com','Feminino','Industrial','11/23/2013',91182,'Compensation Analyst',5);
insert into funcionarios values (381,'Welch','dwelchak@printfriendly.com','Masculino','Música','9/9/2012',133007,'Software Test Engineer I',7);
insert into funcionarios values (382,'Payne','jpayneal@comsenz.com','Feminino','Lar','8/10/2012',92879,'Nurse',2);
insert into funcionarios values (383,'Young','pyoungam@theguardian.com','Masculino','Roupas','12/10/2002',104079,'Systems Administrator IV',4);
insert into funcionarios values (384,'Butler','dbutleran@eventbrite.com','Feminino','Beleza','11/1/2005',63918,'Structural Engineer',4);
insert into funcionarios values (385,'Carroll','ecarrollao@newsvine.com','Feminino','Automotivo','5/2/2011',128885,'Office Assistant III',5);
insert into funcionarios values (386,'Griffin','tgriffinap@reddit.com','Masculino','Games','2/27/2011',140567,'Research Associate',2);
insert into funcionarios values (387,'Burke','mburkeaq@360.cn','Feminino','Jardim','8/9/2003',95726,'Registered Nurse',4);
insert into funcionarios values (388,'Kelley','akelleyar@list-manage.com','Feminino','Música','1/24/2008',84261,'Senior Editor',5);
insert into funcionarios values (389,'Ortiz','gortizas@w3.org','Masculino','Bebês','6/22/2013',42924,'Marketing Assistant',2);
insert into funcionarios values (390,'Olson','aolsonat@cpanel.net','Masculino','Computadores','9/14/2008',86670,'Web Designer II',2);
insert into funcionarios values (391,'White','cwhiteau@amazon.de','Feminino','Roupas','11/4/2003',147702,'VP Quality Control',4);
insert into funcionarios values (392,'Peters','apetersav@loc.gov','Feminino','Beleza','2/2/2013',132470,'Database Administrator II',6);
insert into funcionarios values (393,'Sullivan','ksullivanaw@slideshare.net','Feminino','Música','9/11/2000',63341,'Research Associate',7);
insert into funcionarios values (394,'Washington','rwashingtonax@gmpg.org','Feminino','Beleza','10/23/2002',91651,'funcionarios Accountant III',4);
insert into funcionarios values (395,'Ward','jwarday@quantcast.com','Masculino','Bebês','9/11/2013',48927,'Sales Representative',6);
insert into funcionarios values (396,'Kelly','bkellyaz@bandcamp.com','Feminino','Crianças','11/17/2013',143433,'Web Developer II',1);
insert into funcionarios values (397,'Martin','hmartinb0@homestead.com','Masculino','Brinquedos','10/2/2006',81998,'Product Engineer',5);
insert into funcionarios values (398,'Cooper','scooperb1@cmu.edu','Feminino','Lar','5/8/2001',68584,'Quality Engineer',2);
insert into funcionarios values (399,'Holmes','jholmesb2@uol.com.br','Feminino','Computadores','7/4/2009',88216,'Accountant III',3);
insert into funcionarios values (400,'Harrison','jharrisonb3@google.de','Masculino','Saúde','12/24/2011',86046,'Nuclear Power Engineer',5);
insert into funcionarios values (401,'Parker','jparkerb4@mit.edu','Feminino','Outdoors','3/5/2008',148906,'Project Manager',5);
insert into funcionarios values (402,'Marshall','emarshallb5@yahoo.co.jp','Feminino','Roupas','11/10/2007',93266,'Recruiter',7);
insert into funcionarios values (403,'Chapman','schapmanb6@nhs.uk','Feminino','Lar','3/9/2002',69702,'Food Chemist',1);
insert into funcionarios values (404,'Harvey','aharveyb7@who.int','Feminino','Outdoors','12/28/2010',43366,'Administrative Assistant IV',4);
insert into funcionarios values (405,'Morgan','dmorganb8@moonfruit.com','Masculino','Industrial','5/19/2005',101945,'Web Developer I',2);
insert into funcionarios values (406,'Foster','pfosterb9@intel.com','Masculino','Brinquedos','2/1/2003',54007,'Geological Engineer',5);
insert into funcionarios values (407,'Vasquez','jvasquezba@dion.ne.jp','Masculino','Bebês','4/9/2013',54704,'Analog Circuit Design manager',3);
insert into funcionarios values (408,'Moore','jmoorebb@liveinternet.ru','Feminino','Computadores','11/13/2007',93954,'Project Manager',5);
insert into funcionarios values (409,'Williams','swilliamsbc@bing.com','Feminino','Lar','4/22/2007',58235,'Analog Circuit Design manager',6);
insert into funcionarios values (410,'Harris','lharrisbd@ow.ly','Feminino','Ferramentas','1/7/2012',148940,'Senior Financial Analyst',6);
insert into funcionarios values (411,'Hayes','chayesbe@usnews.com','Masculino','Crianças','4/9/2003',110615,'Paralegal',6);
insert into funcionarios values (413,'Brooks','lbrooksbg@storify.com','Feminino','Saúde','9/19/2008',94502,'Executive Secretary',1);
insert into funcionarios values (414,'Peterson','epetersonbh@reverbnation.com','Masculino','Games','8/10/2011',72505,'Registered Nurse',3);
insert into funcionarios values (415,'Holmes','dholmesbi@jugem.jp','Masculino','Brinquedos','6/18/2001',147150,'Analog Circuit Design manager',6);
insert into funcionarios values (416,'Butler','dbutlerbj@wix.com','Feminino','Beleza','2/9/2002',66313,'Food Chemist',5);
insert into funcionarios values (417,'Hanson','shansonbk@ted.com','Masculino','Eletronicos','11/4/2002',97372,'Systems Administrator I',6);
insert into funcionarios values (418,'Morales','dmoralesbl@mit.edu','Feminino','Lar','10/2/2013',149598,'VP Product Management',3);
insert into funcionarios values (419,'Dixon','jdixonbm@indiatimes.com','Masculino','Saúde','2/22/2008',104224,'Clinical Specialist',5);
insert into funcionarios values (420,'Henry','hhenrybn@privacy.gov.au','Feminino','Ferramentas','9/24/2007',95583,'Civil Engineer',2);
insert into funcionarios values (421,'Harper','rharperbo@webeden.co.uk','Feminino','Música','1/5/2001',92043,'Assistant Manager',3);
insert into funcionarios values (422,'Torres','ctorresbp@yahoo.com','Feminino','Computadores','9/17/2009',118307,'funcionarios Accountant II',1);
insert into funcionarios values (423,'Walker','awalkerbq@wsj.com','Feminino','Joalheria','5/11/2011',145281,'VP Accounting',4);
insert into funcionarios values (424,'Berry','jberrybr@discuz.net','Feminino','Lar','8/20/2013',148640,'Internal Auditor',4);
insert into funcionarios values (425,'Carpenter','lcarpenterbs@xrea.com','Feminino','Computadores','9/7/2000',125523,'Financial Advisor',7);
insert into funcionarios values (426,'Graham','tgrahambt@mediafire.com','Masculino','Crianças','1/12/2009',49503,'Occupational Therapist',5);
insert into funcionarios values (427,'Clark','aclarkbu@npr.org','Feminino','Esporte','9/10/2000',146611,'Systems Administrator III',7);
insert into funcionarios values (428,'Schmidt','rschmidtbv@tumblr.com','Feminino','Esporte','2/8/2012',125465,'Teacher',1);
insert into funcionarios values (429,'Ortiz','jortizbw@t.co','Feminino','Roupas','1/23/2003',75024,'Structural Analysis Engineer',6);
insert into funcionarios values (430,'Hall','ehallbx@google.com.br','Masculino','Esporte','10/25/2011',60793,'Registered Nurse',7);
insert into funcionarios values (431,'Bishop','kbishopby@loc.gov','Feminino','Ferramentas','6/6/2010',110744,'Accountant I',2);
insert into funcionarios values (432,'Murphy','nmurphybz@jiathis.com','Feminino','Joalheria','8/21/2006',46653,'Registered Nurse',4);
insert into funcionarios values (433,'Parker','dparkerc0@webeden.co.uk','Masculino','Games','5/4/2014',114919,'Database Administrator III',7);
insert into funcionarios values (434,'Lee','rleec1@ibm.com','Feminino','Computadores','7/24/2000',98733,'Payment Adjustment Coordinator',4);
insert into funcionarios values (435,'Ellis','kellisc2@cafepress.com','Feminino','Saúde','8/23/2008',139775,'Chemical Engineer',1);
insert into funcionarios values (436,'Bishop','abishopc3@e-recht24.de','Feminino','Joalheria','5/10/2005',69559,'Programmer Analyst III',3);
insert into funcionarios values (437,'Roberts','arobertsc4@businessweek.com','Masculino','Filmes','7/10/2007',48934,'Electrical Engineer',6);
insert into funcionarios values (438,'Moreno','bmorenoc5@addtoany.com','Masculino','Alimentícios','4/25/2014',79980,'Recruiter',5);
insert into funcionarios values (439,'Boyd','eboydc6@unc.edu','Masculino','Roupas','4/1/2002',108854,'Senior Editor',4);
insert into funcionarios values (440,'Murphy','amurphyc7@wikia.com','Masculino','Books','1/23/2007',128105,'Help Desk Technician',7);
insert into funcionarios values (441,'Bailey','jbaileyc8@newsvine.com','Masculino','Books','6/10/2008',71676,'GIS Technical Architect',4);
insert into funcionarios values (442,'Bryant','jbryantc9@zdnet.com','Feminino','Música','9/11/2007',139347,'Data Coordiator',1);
insert into funcionarios values (443,'Powell','cpowellca@samsung.com','Feminino','Industrial','2/28/2002',80491,'GIS Technical Architect',7);
insert into funcionarios values (444,'Ferguson','jfergusoncb@sphinn.com','Feminino','Ferramentas','12/30/2010',119385,'Assistant Media Planner',4);
insert into funcionarios values (445,'Greene','dgreenecc@reuters.com','Masculino','Brinquedos','3/23/2002',149835,'Geologist III',1);
insert into funcionarios values (446,'Kennedy','pkennedycd@google.cn','Feminino','Saúde','12/2/2008',80137,'Business Systems Development Analyst',2);
insert into funcionarios values (447,'Brooks','cbrooksce@washingtonpost.com','Masculino','Lar','8/25/2000',79724,'Developer IV',7);
insert into funcionarios values (448,'Brooks','jbrookscf@ucla.edu','Masculino','Books','6/25/2009',102458,'Occupational Therapist',1);
insert into funcionarios values (449,'Gray','tgraycg@fotki.com','Feminino','Roupas','4/20/2014',134205,'Biostatistician I',4);
insert into funcionarios values (450,'Morgan','kmorganch@reddit.com','Feminino','Beleza','5/21/2004',76052,'Technical Writer',5);
insert into funcionarios values (451,'Robinson','arobinsonci@mapy.cz','Feminino','Música','11/17/2004',144608,'Research Associate',4);
insert into funcionarios values (452,'Kennedy','ckennedycj@boston.com','Feminino','Brinquedos','5/10/2000',111072,'Senior Quality Engineer',4);
insert into funcionarios values (453,'Anderson','aandersonck@whitehouse.gov','Masculino','Automotivo','1/24/2010',126485,'Computer Systems Analyst I',6);
insert into funcionarios values (454,'Price','jpricecl@liveinternet.ru','Feminino','Bebês','9/22/2006',96388,'Graphic Designer',6);
insert into funcionarios values (455,'Hawkins','jhawkinscm@furl.net','Feminino','Automotivo','6/13/2002',115506,'Product Engineer',2);
insert into funcionarios values (456,'Watson','swatsoncn@wufoo.com','Feminino','Industrial','3/10/2012',115679,'Editor',2);
insert into funcionarios values (457,'Cole','bcoleco@parallels.com','Feminino','Joalheria','12/11/2001',133040,'Research Associate',6);
insert into funcionarios values (458,'Little','dlittlecp@usatoday.com','Feminino','Filmes','5/14/2000',91660,'Research Assistant I',5);
insert into funcionarios values (459,'Robertson','erobertsoncq@prweb.com','Feminino','Computadores','9/20/2009',136406,'Chemical Engineer',7);
insert into funcionarios values (460,'Sanchez','lsanchezcr@rediff.com','Masculino','Automotivo','4/28/2005',146167,'Assistant Professor',5);
insert into funcionarios values (461,'Lane','llanecs@free.fr','Feminino','Books','4/4/2003',94299,'Media Manager III',4);
insert into funcionarios values (462,'Perry','rperryct@answers.com','Masculino','Industrial','7/31/2004',56382,'Executive Secretary',3);
insert into funcionarios values (463,'Mason','dmasoncu@about.com','Masculino','Ferramentas','12/21/2010',120160,'Database Administrator II',3);
insert into funcionarios values (464,'Brooks','dbrookscv@biblegateway.com','Feminino','Calçados','4/23/2008',77060,'Marketing Manager',3);
insert into funcionarios values (465,'White','dwhitecw@exblog.jp','Masculino','Computadores','10/17/2007',122540,'Administrative Officer',2);
insert into funcionarios values (466,'Carroll','fcarrollcx@ucoz.ru','Feminino','Games','5/29/2008',128562,'Senior Developer',7);
insert into funcionarios values (467,'Ford','efordcy@elpais.com','Feminino','Esporte','3/15/2002',60674,'Software Engineer I',3);
insert into funcionarios values (469,'Hicks','rhicksd0@histats.com','Feminino','Crianças','8/8/2010',97913,'Occupational Therapist',3);
insert into funcionarios values (470,'Rice','triced1@examiner.com','Feminino','Alimentícios','8/13/2005',108380,'Data Coordiator',5);
insert into funcionarios values (471,'Lewis','plewisd2@businessinsider.com','Feminino','Bebês','11/16/2007',50448,'Database Administrator III',4);
insert into funcionarios values (472,'Arnold','larnoldd3@webeden.co.uk','Feminino','Books','2/25/2012',133781,'Office Assistant I',4);
insert into funcionarios values (473,'Jordan','djordand4@trellian.com','Feminino','Books','11/14/2009',90409,'Research Assistant II',3);
insert into funcionarios values (474,'Reed','creedd5@bloglines.com','Masculino','Jardim','1/7/2004',144953,'Registered Nurse',7);
insert into funcionarios values (475,'Jenkins','sjenkinsd6@bloglovin.com','Masculino','Outdoors','12/22/2001',46072,'Nurse',2);
insert into funcionarios values (476,'Matthews','jmatthewsd7@economist.com','Masculino','Books','2/1/2012',119602,'Actuary',5);
insert into funcionarios values (477,'Gonzalez','lgonzalezd8@fastcompany.com','Masculino','Computadores','10/17/2010',122231,'Director of Sales',5);
insert into funcionarios values (478,'Mason','jmasond9@networkadvertising.org','Masculino','Esporte','4/16/2003',147166,'Systems Administrator I',6);
insert into funcionarios values (479,'Nelson','lnelsonda@example.com','Masculino','Alimentícios','9/8/2009',56465,'Programmer IV',6);
insert into funcionarios values (480,'Miller','amillerdb@reddit.com','Masculino','Eletronicos','2/7/2001',78158,'Programmer Analyst I',5);
insert into funcionarios values (482,'Harris','rharrisdd@paypal.com','Masculino','Brinquedos','6/10/2007',126468,'Budget/Accounting Analyst III',4);
insert into funcionarios values (483,'Brown','mbrownde@bizjournals.com','Feminino','Beleza','5/10/2012',79419,'Senior Developer',3);
insert into funcionarios values (484,'Little','glittledf@xrea.com','Masculino','Computadores','3/23/2009',83093,'Registered Nurse',1);
insert into funcionarios values (485,'Austin','caustindg@pen.io','Feminino','Crianças','11/3/2014',90797,'Help Desk Operator',1);
insert into funcionarios values (486,'Young','fyoungdh@npr.org','Feminino','Crianças','7/6/2008',78755,'Desktop Support Technician',5);
insert into funcionarios values (487,'Fox','hfoxdi@acquirethisname.com','Feminino','Crianças','4/18/2003',128726,'Business Systems Development Analyst',3);
insert into funcionarios values (488,'Brooks','ebrooksdj@berkeley.edu','Masculino','Música','12/15/2011',69026,'Nuclear Power Engineer',6);
insert into funcionarios values (489,'Parker','lparkerdk@salon.com','Feminino','Jardim','1/16/2014',78109,'Research Nurse',5);
insert into funcionarios values (490,'Griffin','bgriffindl@pbs.org','Masculino','Filmes','4/8/2000',116480,'Nurse Practicioner',5);
insert into funcionarios values (491,'Stevens','bstevensdm@aol.com','Feminino','Brinquedos','6/13/2004',108444,'Environmental Tech',7);
insert into funcionarios values (492,'Evans','levansdn@house.gov','Masculino','Computadores','2/8/2010',106535,'funcionarios Scientist',1);
insert into funcionarios values (493,'Banks','bbanksdo@bravesites.com','Masculino','Computadores','6/24/2008',137025,'Research Nurse',5);
insert into funcionarios values (494,'Sullivan','ksullivandp@ucoz.com','Masculino','Industrial','3/3/2005',71663,'Analog Circuit Design manager',3);
insert into funcionarios values (495,'Black','eblackdq@ihg.com','Feminino','Books','10/8/2004',80073,'Senior Developer',3);
insert into funcionarios values (496,'Andrews','dandrewsdr@patch.com','Masculino','Beleza','3/14/2008',40254,'Quality Control Specialist',5);
insert into funcionarios values (497,'Jenkins','bjenkinsds@kickstarter.com','Feminino','Alimentícios','3/10/2011',80027,'VP Sales',3);
insert into funcionarios values (498,'Gutierrez','jgutierrezdt@woothemes.com','Feminino','Jardim','8/22/2001',106994,'Technical Writer',3);
insert into funcionarios values (499,'Hansen','jhansendu@timesonline.co.uk','Masculino','Brinquedos','4/29/2001',145559,'Office Assistant III',2);
insert into funcionarios values (500,'Rodriguez','drodriguezdv@histats.com','Masculino','Industrial','3/21/2001',91994,'Actuary',5);
insert into funcionarios values (501,'Bailey','hbaileydw@networksolutions.com','Masculino','Música','8/5/2001',138540,'Geologist IV',7);
insert into funcionarios values (502,'Banks','gbanksdx@berkeley.edu','Feminino','Computadores','10/17/2010',136034,'Product Engineer',4);
insert into funcionarios values (503,'Rose','jrosedy@squarespace.com','Feminino','Bebês','1/19/2004',127291,'Accounting Assistant III',7);
insert into funcionarios values (504,'Weaver','mweaverdz@ft.com','Masculino','Industrial','3/19/2000',131283,'funcionarios Scientist',4);
insert into funcionarios values (505,'Walker','jwalkere0@oakley.com','Masculino','Computadores','6/20/2005',122108,'Analog Circuit Design manager',7);
insert into funcionarios values (506,'Cox','ncoxe1@1und1.de','Feminino','Lar','1/1/2008',49048,'Sales Associate',1);
insert into funcionarios values (507,'Reed','preede2@who.int','Feminino','Bebês','11/1/2012',97427,'Occupational Therapist',6);
insert into funcionarios values (508,'Marshall','dmarshalle3@about.me','Masculino','Computadores','5/14/2007',90960,'Software Test Engineer II',7);
insert into funcionarios values (509,'Gonzalez','rgonzaleze4@furl.net','Masculino','Saúde','12/30/2011',43986,'Geologist IV',3);
insert into funcionarios values (510,'Lawrence','rlawrencee5@hhs.gov','Masculino','Outdoors','11/21/2014',108748,'Senior Editor',4);
insert into funcionarios values (511,'Medina','tmedinae6@g.co','Feminino','Industrial','12/3/2006',102149,'Sales Representative',5);
insert into funcionarios values (512,'Carpenter','rcarpentere7@blog.com','Masculino','Outdoors','6/13/2008',133360,'Research Nurse',7);
insert into funcionarios values (513,'Carter','mcartere8@twitpic.com','Feminino','Jardim','7/9/2004',70814,'Account Representative I',4);
insert into funcionarios values (514,'Peters','gpeterse9@people.com.cn','Masculino','Alimentícios','12/18/2010',132037,'Web Developer IV',6);
insert into funcionarios values (515,'Gomez','kgomezea@bloglovin.com','Masculino','Roupas','5/1/2002',55747,'Human Resources Assistant I',1);
insert into funcionarios values (516,'Stanley','rstanleyeb@alibaba.com','Feminino','Brinquedos','6/9/2006',89324,'Systems Administrator IV',3);
insert into funcionarios values (517,'Carpenter','lcarpenterec@technorati.com','Masculino','Computadores','2/8/2011',124418,'Chief Design Engineer',7);
insert into funcionarios values (518,'Peters','cpetersed@goo.ne.jp','Feminino','Alimentícios','12/25/2005',138093,'Human Resources Assistant I',3);
insert into funcionarios values (519,'Hamilton','chamiltonee@google.es','Masculino','Eletronicos','8/26/2003',141340,'Budget/Accounting Analyst III',4);
insert into funcionarios values (520,'Owens','sowensef@ted.com','Masculino','Industrial','6/2/2006',54672,'Structural Engineer',4);
insert into funcionarios values (521,'Williamson','dwilliamsoneg@creativecommons.org','Masculino','Roupas','10/6/2003',118602,'Director of Sales',5);
insert into funcionarios values (523,'Johnston','ajohnstonei@php.net','Feminino','Saúde','6/10/2012',143855,'Internal Auditor',5);
insert into funcionarios values (524,'Edwards','pedwardsej@businessinsider.com','Feminino','Saúde','6/15/2009',43431,'Physical Therapy Assistant',6);
insert into funcionarios values (525,'Payne','tpayneek@newyorker.com','Feminino','Ferramentas','3/1/2002',94016,'VP Quality Control',2);
insert into funcionarios values (526,'Allen','lallenel@nyu.edu','Feminino','Bebês','9/9/2011',66847,'Assistant Media Planner',2);
insert into funcionarios values (527,'Richards','jrichardsem@1688.com','Masculino','Roupas','4/20/2005',69705,'Senior Developer',3);
insert into funcionarios values (528,'Cole','fcoleen@msn.com','Masculino','Esporte','2/8/2012',96739,'Product Engineer',2);
insert into funcionarios values (529,'Meyer','lmeyereo@storify.com','Feminino','Jardim','9/1/2006',52956,'Senior Developer',3);
insert into funcionarios values (530,'Reyes','lreyesep@foxnews.com','Feminino','Computadores','12/14/2012',71559,'Librarian',1);
insert into funcionarios values (531,'Hudson','rhudsoneq@fotki.com','Masculino','Lar','11/17/2010',143226,'Food Chemist',7);
insert into funcionarios values (532,'Rice','rriceer@wired.com','Masculino','Books','2/14/2011',145747,'Financial Advisor',3);
insert into funcionarios values (533,'Castillo','dcastilloes@cocolog-nifty.com','Feminino','Industrial','10/15/2013',72001,'Automation Specialist IV',2);
insert into funcionarios values (534,'Harrison','jharrisonet@mapquest.com','Feminino','Música','9/20/2000',50308,'Compensation Analyst',6);
insert into funcionarios values (535,'Morris','rmorriseu@yahoo.com','Feminino','Lar','7/25/2007',131662,'Help Desk Operator',3);
insert into funcionarios values (536,'Castillo','acastilloev@cnet.com','Feminino','Crianças','5/19/2011',55730,'Speech Pathologist',7);
insert into funcionarios values (537,'Webb','rwebbew@twitter.com','Feminino','Games','2/12/2005',63836,'Occupational Therapist',1);
insert into funcionarios values (538,'Freeman','gfreemanex@nps.gov','Masculino','Calçados','10/24/2005',121296,'Civil Engineer',2);
insert into funcionarios values (539,'Kelley','rkelleyey@feedburner.com','Masculino','Filmes','3/20/2012',110660,'Senior Financial Analyst',4);
insert into funcionarios values (540,'Matthews','lmatthewsez@edublogs.org','Masculino','Games','12/19/2001',89114,'GIS Technical Architect',5);
insert into funcionarios values (541,'Mendoza','tmendozaf0@google.nl','Feminino','Música','8/28/2007',48769,'Nurse',5);
insert into funcionarios values (542,'Rice','ericef1@cpanel.net','Masculino','Música','2/1/2008',90069,'Assistant Professor',5);
insert into funcionarios values (543,'Walker','kwalkerf2@vinaora.com','Feminino','Lar','9/7/2013',120085,'Human Resources Assistant III',6);
insert into funcionarios values (544,'Moore','mmooref3@oakley.com','Feminino','Eletronicos','11/15/2007',41697,'Automation Specialist I',7);
insert into funcionarios values (545,'Lynch','jlynchf4@jimdo.com','Masculino','Crianças','5/4/2009',44093,'Saúde Coach IV',5);
insert into funcionarios values (546,'Fox','mfoxf5@jimdo.com','Feminino','Joalheria','11/1/2006',59294,'Senior Editor',6);
insert into funcionarios values (547,'Moreno','bmorenof6@vkontakte.ru','Masculino','Industrial','8/21/2013',140858,'Cost Accountant',7);
insert into funcionarios values (548,'Simpson','dsimpsonf7@engadget.com','Feminino','Brinquedos','1/10/2009',46444,'Desktop Support Technician',6);
insert into funcionarios values (549,'Reynolds','kreynoldsf8@vistaprint.com','Feminino','Books','9/26/2012',85855,'Financial Advisor',4);
insert into funcionarios values (550,'Watson','lwatsonf9@alexa.com','Masculino','Calçados','5/1/2000',72334,'Developer IV',3);
insert into funcionarios values (551,'Cruz','bcruzfa@nbcnews.com','Masculino','Música','10/4/2011',69246,'Web Developer III',6);
insert into funcionarios values (552,'Gomez','cgomezfb@reddit.com','Masculino','Beleza','3/18/2011',107389,'Community Outreach Specialist',2);
insert into funcionarios values (553,'George','rgeorgefc@youtube.com','Masculino','Automotivo','12/16/2009',141505,'Associate Professor',6);
insert into funcionarios values (554,'Frazier','mfrazierfd@tripod.com','Masculino','Brinquedos','1/6/2008',60318,'Engineer I',5);
insert into funcionarios values (555,'Bryant','cbryantfe@phpbb.com','Feminino','Outdoors','6/12/2014',148260,'Executive Secretary',7);
insert into funcionarios values (556,'Ferguson','mfergusonff@trellian.com','Feminino','Eletronicos','12/20/2006',73199,'Payment Adjustment Coordinator',2);
insert into funcionarios values (557,'Frazier','dfrazierfg@twitter.com','Masculino','Crianças','8/26/2002',111244,'Environmental Specialist',6);
insert into funcionarios values (558,'Hudson','jhudsonfh@soundcloud.com','Masculino','Bebês','3/21/2012',103845,'Nurse Practicioner',1);
insert into funcionarios values (559,'Murphy','jmurphyfi@naver.com','Feminino','Computadores','10/19/2008',88666,'Senior Editor',7);
insert into funcionarios values (560,'Kim','jkimfj@dropbox.com','Masculino','Roupas','1/22/2014',67845,'Administrative Officer',7);
insert into funcionarios values (561,'Rodriguez','jrodriguezfk@cafepress.com','Masculino','Esporte','4/8/2004',62527,'Recruiter',1);
insert into funcionarios values (562,'Perez','jperezfl@seesaa.net','Masculino','Ferramentas','5/17/2003',73412,'Librarian',5);
insert into funcionarios values (563,'Graham','bgrahamfm@usatoday.com','Masculino','Beleza','4/21/2011',123391,'Financial Advisor',7);
insert into funcionarios values (564,'Martinez','amartinezfn@people.com.cn','Feminino','Saúde','2/23/2005',99508,'VP Quality Control',5);
insert into funcionarios values (565,'Pierce','jpiercefo@cnet.com','Feminino','Joalheria','4/17/2014',55726,'Geologist III',7);
insert into funcionarios values (566,'Lynch','mlynchfp@reverbnation.com','Masculino','Eletronicos','12/10/2011',67140,'Systems Administrator III',3);
insert into funcionarios values (567,'Myers','dmyersfq@amazon.com','Feminino','Lar','5/27/2010',139060,'Assistant Professor',7);
insert into funcionarios values (568,'Day','kdayfr@wix.com','Masculino','Lar','7/20/2004',135993,'Geologist IV',4);
insert into funcionarios values (569,'Little','jlittlefs@bravesites.com','Feminino','Books','11/12/2010',80788,'Programmer I',4);
insert into funcionarios values (570,'James','rjamesft@jiathis.com','Feminino','Roupas','3/21/2001',136377,'Software Engineer I',7);
insert into funcionarios values (571,'Ortiz','eortizfu@java.com','Feminino','Eletronicos','6/19/2009',46247,'VP Accounting',3);
insert into funcionarios values (572,'Duncan','jduncanfv@etsy.com','Masculino','Automotivo','3/17/2014',45774,'Electrical Engineer',2);
insert into funcionarios values (573,'Kennedy','jkennedyfw@nasa.gov','Feminino','Esporte','4/23/2010',100741,'Senior Cost Accountant',1);
insert into funcionarios values (574,'Pierce','dpiercefx@marketwatch.com','Masculino','Alimentícios','9/20/2005',45534,'Senior Sales Associate',1);
insert into funcionarios values (575,'Bowman','abowmanfy@devhub.com','Masculino','Games','4/26/2002',75399,'VP Quality Control',7);
insert into funcionarios values (576,'Taylor','staylorfz@issuu.com','Masculino','Roupas','7/13/2006',50235,'Assistant Media Planner',1);
insert into funcionarios values (577,'Jones','jjonesg0@g.co','Masculino','Bebês','1/27/2011',128048,'Programmer III',5);
insert into funcionarios values (578,'Lynch','hlynchg1@washingtonpost.com','Masculino','Roupas','5/2/2006',111318,'Technical Writer',3);
insert into funcionarios values (579,'Barnes','jbarnesg2@hubpages.com','Feminino','Jardim','12/23/2000',100763,'Database Administrator I',7);
insert into funcionarios values (580,'Weaver','kweaverg3@wikia.com','Masculino','Computadores','5/23/2012',54231,'Accounting Assistant II',3);
insert into funcionarios values (581,'Cunningham','pcunninghamg4@example.com','Feminino','Esporte','3/25/2010',92334,'GIS Technical Architect',3);
insert into funcionarios values (583,'Hunter','ehunterg6@ucsd.edu','Feminino','Calçados','12/12/2000',112048,'Software Engineer II',5);
insert into funcionarios values (584,'Cook','ccookg7@blog.com','Feminino','Música','5/13/2008',109404,'Chief Design Engineer',6);
insert into funcionarios values (585,'Lopez','nlopezg8@fema.gov','Masculino','Jardim','7/19/2007',138776,'Senior Editor',2);
insert into funcionarios values (586,'Olson','folsong9@acquirethisname.com','Feminino','Lar','7/1/2003',110411,'Compensation Analyst',3);
insert into funcionarios values (587,'Martin','pmartinga@webnode.com','Feminino','Brinquedos','9/7/2002',74973,'General Manager',7);
insert into funcionarios values (588,'Day','edaygb@google.nl','Feminino','Ferramentas','10/15/2002',129890,'Software Consultant',4);
insert into funcionarios values (589,'Arnold','sarnoldgc@parallels.com','Masculino','Filmes','1/27/2005',135786,'Account Representative I',7);
insert into funcionarios values (590,'Allen','rallengd@cnet.com','Feminino','Alimentícios','6/15/2007',132998,'Business Systems Development Analyst',3);
insert into funcionarios values (591,'Sims','wsimsge@vinaora.com','Feminino','Bebês','2/28/2014',84318,'Software Test Engineer I',2);
insert into funcionarios values (592,'Duncan','aduncangf@behance.net','Masculino','Calçados','4/11/2004',110407,'Sales Associate',5);
insert into funcionarios values (593,'Evans','aevansgg@wordpress.org','Feminino','Lar','6/15/2000',94980,'Financial Advisor',4);
insert into funcionarios values (594,'Chapman','schapmangh@arstechnica.com','Feminino','Industrial','3/7/2004',125843,'Web Designer II',4);
insert into funcionarios values (595,'Price','rpricegi@flavors.me','Feminino','Alimentícios','1/27/2000',66180,'funcionarios Scientist',5);
insert into funcionarios values (596,'Ford','jfordgj@nyu.edu','Feminino','Joalheria','11/27/2014',88854,'Account Representative I',4);
insert into funcionarios values (597,'Lynch','alynchgk@tumblr.com','Feminino','Beleza','2/10/2004',71448,'Electrical Engineer',1);
insert into funcionarios values (598,'Diaz','jdiazgl@hhs.gov','Feminino','Esporte','11/2/2002',60547,'Community Outreach Specialist',2);
insert into funcionarios values (599,'Watkins','rwatkinsgm@independent.co.uk','Feminino','Outdoors','11/21/2010',128805,'Occupational Therapist',5);
insert into funcionarios values (600,'Ruiz','sruizgn@reddit.com','Feminino','Outdoors','5/11/2006',96782,'Database Administrator II',5);
insert into funcionarios values (601,'Lopez','blopezgo@sourceforge.net','Masculino','Saúde','3/12/2001',125944,'Office Assistant II',2);
insert into funcionarios values (602,'Henderson','chendersongp@sina.com.cn','Masculino','Ferramentas','9/17/2011',101937,'Teacher',7);
insert into funcionarios values (603,'Webb','lwebbgq@last.fm','Masculino','Joalheria','12/6/2000',127569,'Analyst Programmer',7);
insert into funcionarios values (604,'Greene','agreenegr@cmu.edu','Masculino','Roupas','6/30/2004',104517,'Research Assistant III',2);
insert into funcionarios values (605,'Stephens','estephensgs@phoca.cz','Feminino','Alimentícios','12/11/2010',110366,'Research Nurse',6);
insert into funcionarios values (606,'Parker','rparkergt@1688.com','Feminino','Industrial','2/8/2003',136917,'Assistant Professor',4);
insert into funcionarios values (607,'Reyes','hreyesgu@gnu.org','Masculino','Esporte','7/21/2007',130563,'Nuclear Power Engineer',7);
insert into funcionarios values (608,'Garza','hgarzagv@webmd.com','Masculino','Saúde','11/13/2004',73553,'Accountant IV',6);
insert into funcionarios values (609,'Fisher','dfishergw@myspace.com','Masculino','Eletronicos','1/21/2007',93995,'Teacher',2);
insert into funcionarios values (610,'Hicks','hhicksgx@ifeng.com','Masculino','Saúde','8/23/2009',45270,'VP Marketing',7);
insert into funcionarios values (611,'Ford','jfordgy@earthlink.net','Feminino','Calçados','10/29/2009',147739,'Safety Technician I',5);
insert into funcionarios values (612,'Fowler','cfowlergz@joomla.org','Feminino','Saúde','9/10/2003',142211,'Software Test Engineer IV',4);
insert into funcionarios values (613,'Coleman','hcolemanh0@feedburner.com','Feminino','Beleza','9/26/2006',48791,'Teacher',1);
insert into funcionarios values (614,'Ramirez','jramirezh1@php.net','Feminino','Eletronicos','11/2/2008',112929,'Account Coordinator',5);
insert into funcionarios values (615,'Alexander','falexanderh2@irs.gov','Feminino','Roupas','12/25/2009',72854,'Marketing Assistant',7);
insert into funcionarios values (616,'Marshall','hmarshallh3@com.com','Feminino','Automotivo','10/10/2006',47281,'VP Sales',6);
insert into funcionarios values (617,'Mills','hmillsh4@lulu.com','Feminino','Saúde','6/12/2013',49410,'Account Representative II',1);
insert into funcionarios values (618,'Phillips','wphillipsh5@economist.com','Masculino','Roupas','6/7/2001',128205,'Sales Representative',6);
insert into funcionarios values (619,'Cole','jcoleh6@php.net','Masculino','Ferramentas','6/2/2014',133190,'Research Nurse',7);
insert into funcionarios values (620,'Olson','aolsonh7@psu.edu','Feminino','Books','8/14/2009',59644,'Systems Administrator III',1);
insert into funcionarios values (621,'Reynolds','nreynoldsh8@redcross.org','Masculino','Crianças','10/31/2004',111427,'Programmer I',4);
insert into funcionarios values (622,'Wright','rwrighth9@jimdo.com','Masculino','Eletronicos','3/15/2002',98339,'Assistant Manager',3);
insert into funcionarios values (623,'Ford','mfordha@youku.com','Masculino','Beleza','2/27/2006',72948,'Teacher',6);
insert into funcionarios values (624,'Garza','mgarzahb@elegantthemes.com','Masculino','Books','11/26/2008',60203,'Product Engineer',2);
insert into funcionarios values (625,'Andrews','handrewshc@salon.com','Feminino','Outdoors','12/2/2007',147003,'Chemical Engineer',1);
insert into funcionarios values (626,'Ruiz','sruizhd@slashdot.org','Feminino','Jardim','1/12/2009',83706,'Assistant Media Planner',2);
insert into funcionarios values (627,'Watkins','swatkinshe@wunderground.com','Feminino','Alimentícios','1/21/2000',80245,'VP Product Management',6);
insert into funcionarios values (630,'Pierce','spiercehh@google.nl','Masculino','Outdoors','2/9/2002',96107,'Actuary',5);
insert into funcionarios values (631,'Perez','wperezhi@yahoo.co.jp','Feminino','Ferramentas','6/14/2014',44788,'Project Manager',2);
insert into funcionarios values (632,'Lopez','clopezhj@mediafire.com','Feminino','Jardim','1/1/2004',86207,'Accountant II',4);
insert into funcionarios values (633,'Freeman','mfreemanhk@walmart.com','Masculino','Calçados','10/25/2000',79845,'Teacher',1);
insert into funcionarios values (634,'Fowler','wfowlerhl@people.com.cn','Feminino','Outdoors','4/6/2011',104264,'funcionarios Scientist',6);
insert into funcionarios values (635,'Rodriguez','mrodriguezhm@wiley.com','Feminino','Ferramentas','12/27/2010',77005,'Systems Administrator IV',1);
insert into funcionarios values (636,'Wheeler','lwheelerhn@skyrock.com','Feminino','Industrial','9/25/2011',69564,'Senior Editor',6);
insert into funcionarios values (637,'Knight','dknightho@buzzfeed.com','Feminino','Calçados','7/25/2007',84549,'Senior Cost Accountant',5);
insert into funcionarios values (638,'Walker','bwalkerhp@dropbox.com','Masculino','Games','6/9/2006',134488,'Software Consultant',1);
insert into funcionarios values (639,'Porter','eporterhq@amazon.com','Masculino','Calçados','2/13/2007',140243,'Financial Advisor',5);
insert into funcionarios values (640,'Washington','hwashingtonhr@bbc.co.uk','Masculino','Joalheria','2/22/2003',44096,'Geologist IV',4);
insert into funcionarios values (641,'Hayes','rhayeshs@loc.gov','Feminino','Saúde','4/7/2010',69454,'Web Designer II',1);
insert into funcionarios values (642,'Warren','awarrenht@addthis.com','Feminino','Filmes','5/15/2009',126201,'Electrical Engineer',2);
insert into funcionarios values (644,'Carroll','jcarrollhv@over-blog.com','Masculino','Alimentícios','4/6/2002',52956,'Compensation Analyst',7);
insert into funcionarios values (645,'Webb','twebbhw@google.com.br','Masculino','Ferramentas','6/1/2007',143595,'Geological Engineer',6);
insert into funcionarios values (646,'Harvey','lharveyhx@plala.or.jp','Masculino','Beleza','8/14/2014',124707,'Registered Nurse',6);
insert into funcionarios values (647,'Washington','mwashingtonhy@icio.us','Masculino','Eletronicos','10/15/2009',57092,'Internal Auditor',2);
insert into funcionarios values (648,'Long','rlonghz@list-manage.com','Masculino','Beleza','2/12/2007',149099,'Executive Secretary',3);
insert into funcionarios values (649,'Russell','krusselli0@posterous.com','Masculino','Calçados','11/18/2007',99352,'Recruiting Manager',1);
insert into funcionarios values (650,'Frazier','rfrazieri1@github.com','Masculino','Alimentícios','1/22/2013',44919,'Quality Engineer',7);
insert into funcionarios values (651,'Freeman','tfreemani2@soundcloud.com','Feminino','Saúde','8/28/2006',55034,'Administrative Officer',4);
insert into funcionarios values (652,'Rivera','criverai3@github.io','Masculino','Joalheria','6/16/2006',60396,'Senior Quality Engineer',7);
insert into funcionarios values (653,'Ramirez','vramirezi4@yellowpages.com','Masculino','Brinquedos','7/6/2013',147862,'Chemical Engineer',5);
insert into funcionarios values (654,'Mcdonald','hmcdonaldi5@4shared.com','Masculino','Automotivo','11/3/2002',69594,'Recruiting Manager',3);
insert into funcionarios values (655,'Meyer','emeyeri6@friendfeed.com','Feminino','Esporte','6/8/2014',145363,'GIS Technical Architect',3);
insert into funcionarios values (656,'Campbell','kcampbelli7@prnewswire.com','Masculino','Books','4/3/2008',70804,'Quality Engineer',2);
insert into funcionarios values (657,'Reid','areidi8@wunderground.com','Feminino','Roupas','6/29/2013',65154,'Sales Representative',5);
insert into funcionarios values (658,'Gilbert','agilberti9@parallels.com','Masculino','Eletronicos','10/8/2013',61332,'Marketing Assistant',3);
insert into funcionarios values (659,'Ramos','kramosia@ed.gov','Feminino','Outdoors','9/7/2003',72319,'Quality Control Specialist',1);
insert into funcionarios values (660,'Nelson','mnelsonib@ibm.com','Masculino','Calçados','12/8/2001',139564,'Pharmacist',7);
insert into funcionarios values (661,'Foster','pfosteric@smugmug.com','Feminino','Automotivo','9/21/2004',63364,'Community Outreach Specialist',4);
insert into funcionarios values (662,'Scott','bscottid@mashable.com','Masculino','Bebês','1/18/2000',86497,'Administrative Officer',6);
insert into funcionarios values (663,'Lynch','tlynchie@bloglovin.com','Feminino','Outdoors','1/25/2003',117248,'funcionarios Accountant III',1);
insert into funcionarios values (664,'Watkins','ewatkinsif@ask.com','Feminino','Esporte','2/9/2013',133507,'Budget/Accounting Analyst II',1);
insert into funcionarios values (665,'Garcia','pgarciaig@macromedia.com','Feminino','Saúde','11/4/2008',135132,'Research Assistant III',7);
insert into funcionarios values (666,'Arnold','jarnoldih@tripod.com','Feminino','Calçados','4/22/2013',52041,'Database Administrator I',2);
insert into funcionarios values (667,'Willis','nwillisii@sohu.com','Feminino','Música','3/12/2012',73425,'Human Resources Manager',3);
insert into funcionarios values (668,'Burton','jburtonij@webmd.com','Feminino','Computadores','3/17/2001',46960,'Financial Advisor',4);
insert into funcionarios values (669,'Owens','sowensik@prlog.org','Masculino','Brinquedos','5/6/2001',104373,'Graphic Designer',6);
insert into funcionarios values (670,'Moreno','rmorenoil@gizmodo.com','Feminino','Calçados','9/17/2014',102493,'Senior Quality Engineer',5);
insert into funcionarios values (671,'Fuller','jfullerim@theguardian.com','Masculino','Calçados','12/11/2007',55568,'Senior Cost Accountant',7);
insert into funcionarios values (672,'Fowler','cfowlerin@yelp.com','Masculino','Esporte','5/5/2006',75159,'Biostatistician III',2);
insert into funcionarios values (673,'Thomas','lthomasio@pagesperso-orange.fr','Masculino','Saúde','10/27/2014',51782,'Operator',6);
insert into funcionarios values (674,'Adams','jadamsip@cisco.com','Masculino','Brinquedos','8/28/2009',41855,'Payment Adjustment Coordinator',7);
insert into funcionarios values (675,'Snyder','ssnyderiq@vkontakte.ru','Masculino','Games','6/22/2005',143846,'Web Developer III',3);
insert into funcionarios values (676,'Sullivan','rsullivanir@xinhuanet.com','Masculino','Música','9/29/2013',101756,'Programmer IV',5);
insert into funcionarios values (677,'Robertson','lrobertsonis@forbes.com','Masculino','Computadores','8/4/2014',136492,'Compensation Analyst',4);
insert into funcionarios values (678,'Mills','jmillsit@webs.com','Masculino','Música','4/17/2011',82979,'Senior Quality Engineer',6);
insert into funcionarios values (679,'Stone','pstoneiu@narod.ru','Masculino','Eletronicos','5/15/2014',40218,'Paralegal',2);
insert into funcionarios values (680,'Simmons','gsimmonsiv@cocolog-nifty.com','Feminino','Games','12/9/2001',60695,'Chemical Engineer',2);
insert into funcionarios values (681,'Butler','dbutleriw@discuz.net','Masculino','Lar','11/30/2008',47994,'Senior Quality Engineer',4);
insert into funcionarios values (682,'Scott','kscottix@ycombinator.com','Masculino','Jardim','9/3/2004',50057,'Account Executive',2);
insert into funcionarios values (683,'Torres','jtorresiy@4shared.com','Feminino','Games','3/11/2006',135886,'Assistant Media Planner',3);
insert into funcionarios values (684,'Hall','lhalliz@smh.com.au','Masculino','Joalheria','7/15/2009',77924,'Senior Sales Associate',7);
insert into funcionarios values (685,'White','jwhitej0@usnews.com','Feminino','Beleza','12/7/2008',136356,'Office Assistant IV',1);
insert into funcionarios values (686,'Watkins','mwatkinsj1@myspace.com','Masculino','Brinquedos','3/24/2004',104444,'Business Systems Development Analyst',2);
insert into funcionarios values (687,'Gardner','agardnerj2@blogs.com','Feminino','Computadores','12/3/2000',49693,'Chemical Engineer',2);
insert into funcionarios values (688,'Cruz','kcruzj3@shinystat.com','Masculino','Lar','6/29/2012',90829,'Recruiter',6);
insert into funcionarios values (689,'Austin','aaustinj4@walmart.com','Feminino','Eletronicos','10/31/2007',62293,'Administrative Officer',4);
insert into funcionarios values (690,'Perkins','rperkinsj5@ehow.com','Masculino','Música','5/9/2000',57988,'Web Developer I',4);
insert into funcionarios values (691,'Hansen','chansenj6@uiuc.edu','Feminino','Beleza','2/4/2010',113893,'Clinical Specialist',7);
insert into funcionarios values (692,'Owens','dowensj7@hibu.com','Masculino','Calçados','3/11/2013',58265,'Nurse Practicioner',3);
insert into funcionarios values (693,'Carr','hcarrj8@latimes.com','Masculino','Jardim','1/17/2005',143570,'Actuary',4);
insert into funcionarios values (694,'Chavez','rchavezj9@uiuc.edu','Feminino','Alimentícios','4/19/2007',116894,'Chief Design Engineer',6);
insert into funcionarios values (695,'Morales','rmoralesja@vinaora.com','Feminino','Automotivo','1/24/2006',82244,'Administrative Assistant III',2);
insert into funcionarios values (696,'Anderson','dandersonjb@linkedin.com','Masculino','Games','10/7/2012',92640,'Executive Secretary',7);
insert into funcionarios values (697,'Woods','twoodsjc@ucoz.ru','Masculino','Beleza','6/23/2000',123995,'Assistant Media Planner',5);
insert into funcionarios values (698,'Cook','tcookjd@blinklist.com','Masculino','Jardim','12/12/2005',97351,'Saúde Coach I',4);
insert into funcionarios values (699,'Price','bpriceje@icio.us','Feminino','Roupas','1/25/2003',133091,'VP Accounting',7);
insert into funcionarios values (700,'Stone','tstonejf@com.com','Masculino','Jardim','7/15/2004',100746,'VP Quality Control',6);
insert into funcionarios values (701,'Williams','jwilliamsjg@rediff.com','Masculino','Joalheria','10/13/2002',101599,'Developer II',7);
insert into funcionarios values (702,'Wells','dwellsjh@is.gd','Masculino','Esporte','6/2/2014',77293,'Structural Analysis Engineer',5);
insert into funcionarios values (703,'Hernandez','ahernandezji@ucoz.ru','Feminino','Games','3/4/2014',119787,'Speech Pathologist',1);
insert into funcionarios values (704,'Burke','eburkejj@godaddy.com','Masculino','Computadores','6/12/2013',114690,'funcionarios Scientist',2);
insert into funcionarios values (705,'Clark','pclarkjk@joomla.org','Masculino','Filmes','10/25/2009',97150,'VP Accounting',6);
insert into funcionarios values (706,'Mendoza','rmendozajl@g.co','Feminino','Lar','12/5/2011',91655,'Cost Accountant',5);
insert into funcionarios values (707,'Perry','jperryjm@Lar.pl','Masculino','Industrial','11/8/2006',124296,'Developer III',1);
insert into funcionarios values (708,'Rose','crosejn@cnbc.com','Feminino','Automotivo','12/24/2011',66063,'Software Test Engineer I',7);
insert into funcionarios values (709,'Payne','cpaynejo@tinyurl.com','Feminino','Books','1/12/2007',138137,'Developer IV',2);
insert into funcionarios values (710,'Mills','jmillsjp@yahoo.com','Feminino','Música','1/22/2005',49326,'Chemical Engineer',7);
insert into funcionarios values (711,'Roberts','jrobertsjq@ed.gov','Masculino','Roupas','8/21/2009',80743,'Geological Engineer',4);
insert into funcionarios values (712,'Torres','dtorresjr@state.tx.us','Masculino','Joalheria','12/23/2007',105686,'Senior Developer',6);
insert into funcionarios values (713,'Hicks','ahicksjs@arstechnica.com','Feminino','Esporte','12/23/2013',65650,'Project Manager',1);
insert into funcionarios values (714,'Cooper','kcooperjt@salon.com','Masculino','Games','9/26/2003',86446,'Statistician II',4);
insert into funcionarios values (715,'Henry','rhenryju@answers.com','Feminino','Games','6/26/2010',132421,'Human Resources Manager',1);
insert into funcionarios values (716,'Jacobs','bjacobsjv@thetimes.co.uk','Masculino','Eletronicos','6/18/2004',69855,'Payment Adjustment Coordinator',4);
insert into funcionarios values (717,'Greene','rgreenejw@so-net.ne.jp','Feminino','Outdoors','7/8/2007',80999,'funcionarios Accountant II',6);
insert into funcionarios values (718,'Armstrong','darmstrongjx@cafepress.com','Masculino','Saúde','1/3/2003',66447,'Account Coordinator',2);
insert into funcionarios values (719,'Wagner','ewagnerjy@jalbum.net','Masculino','Beleza','1/4/2013',135445,'Operator',2);
insert into funcionarios values (720,'Rice','hricejz@blinklist.com','Feminino','Joalheria','11/8/2010',57781,'Dental Hygienist',4);
insert into funcionarios values (721,'Smith','hsmithk0@4shared.com','Feminino','Saúde','9/21/2005',83802,'Research Assistant II',7);
insert into funcionarios values (722,'Hill','khillk1@about.me','Feminino','Roupas','8/31/2002',73262,'Information Systems Manager',5);
insert into funcionarios values (723,'Howard','rhowardk2@cnet.com','Feminino','Bebês','3/3/2002',89035,'Senior Editor',5);
insert into funcionarios values (724,'Elliott','delliottk3@who.int','Masculino','Industrial','5/20/2001',125115,'Senior Quality Engineer',3);
insert into funcionarios values (725,'Richards','krichardsk4@bloglines.com','Masculino','Bebês','10/2/2003',80939,'Analyst Programmer',1);
insert into funcionarios values (726,'Welch','dwelchk5@mapquest.com','Masculino','Lar','9/11/2008',49463,'Research Nurse',1);
insert into funcionarios values (727,'Johnson','mjohnsonk6@sciencedaily.com','Masculino','Filmes','5/21/2012',83165,'Account Representative I',5);
insert into funcionarios values (728,'Larson','slarsonk7@sakura.ne.jp','Feminino','Outdoors','4/21/2006',125574,'Research Associate',1);
insert into funcionarios values (729,'Banks','hbanksk8@nifty.com','Masculino','Joalheria','11/15/2013',119747,'Graphic Designer',5);
insert into funcionarios values (730,'Johnston','ejohnstonk9@liveinternet.ru','Feminino','Esporte','11/24/2008',57651,'Help Desk Operator',6);
insert into funcionarios values (731,'Ferguson','gfergusonka@geocities.jp','Feminino','Lar','6/28/2009',70524,'VP Accounting',2);
insert into funcionarios values (732,'Murray','amurraykb@blinklist.com','Masculino','Roupas','8/15/2004',50511,'Senior Cost Accountant',3);
insert into funcionarios values (733,'Diaz','jdiazkc@china.com.cn','Masculino','Lar','11/20/2000',58847,'Community Outreach Specialist',4);
insert into funcionarios values (734,'Simmons','tsimmonskd@chicagotribune.com','Feminino','Automotivo','2/20/2005',58555,'Biostatistician I',2);
insert into funcionarios values (735,'Richards','jrichardske@hatena.ne.jp','Masculino','Roupas','11/14/2014',116333,'Legal Assistant',5);
insert into funcionarios values (736,'Morgan','emorgankf@businessinsider.com','Masculino','Bebês','8/27/2009',80813,'Senior Quality Engineer',6);
insert into funcionarios values (737,'Price','bpricekg@xinhuanet.com','Masculino','Saúde','7/26/2004',142794,'Recruiting Manager',1);
insert into funcionarios values (738,'Hudson','chudsonkh@google.co.uk','Feminino','Computadores','1/4/2003',65083,'Marketing Assistant',6);
insert into funcionarios values (739,'Carroll','lcarrollki@example.com','Feminino','Bebês','3/13/2014',125398,'Assistant Professor',2);
insert into funcionarios values (740,'Long','jlongkj@dailymail.co.uk','Feminino','Crianças','1/13/2008',98502,'Structural Analysis Engineer',7);
insert into funcionarios values (741,'Parker','cparkerkk@foxnews.com','Feminino','Calçados','12/31/2002',90086,'Research Associate',4);
insert into funcionarios values (742,'Nguyen','lnguyenkl@goodreads.com','Masculino','Esporte','12/3/2007',77382,'Design Engineer',6);
insert into funcionarios values (743,'Garza','agarzakm@miitbeian.gov.cn','Feminino','Eletronicos','12/23/2014',113278,'Statistician IV',2);
insert into funcionarios values (744,'Gordon','pgordonkn@mac.com','Masculino','Automotivo','9/18/2001',129324,'Developer I',4);
insert into funcionarios values (745,'Reed','lreedko@wikipedia.org','Feminino','Outdoors','11/21/2005',108504,'Pharmacist',1);
insert into funcionarios values (746,'Baker','bbakerkp@list-manage.com','Masculino','Industrial','10/4/2001',145283,'Payment Adjustment Coordinator',1);
insert into funcionarios values (747,'Carroll','mcarrollkq@whitehouse.gov','Masculino','Crianças','7/30/2006',82674,'Junior Executive',4);
insert into funcionarios values (748,'Elliott','delliottkr@dot.gov','Masculino','Roupas','12/9/2009',119097,'Administrative Assistant I',2);
insert into funcionarios values (749,'Parker','aparkerks@godaddy.com','Feminino','Joalheria','9/5/2012',60498,'Accountant I',4);
insert into funcionarios values (750,'Ward','kwardkt@wikipedia.org','Masculino','Música','7/16/2014',108228,'VP Sales',3);
insert into funcionarios values (751,'Kelley','ckelleyku@gravatar.com','Masculino','Eletronicos','5/7/2005',106602,'Occupational Therapist',2);
insert into funcionarios values (752,'Gonzales','rgonzaleskv@meetup.com','Feminino','Lar','1/24/2011',95810,'Food Chemist',4);
insert into funcionarios values (753,'King','bkingkw@friendfeed.com','Feminino','Eletronicos','2/5/2005',149597,'Structural Analysis Engineer',1);
insert into funcionarios values (754,'Mendoza','smendozakx@java.com','Feminino','Eletronicos','3/17/2000',57331,'Occupational Therapist',3);
insert into funcionarios values (755,'Tucker','ctuckerky@1688.com','Masculino','Industrial','8/17/2011',49113,'Business Systems Development Analyst',7);
insert into funcionarios values (756,'Fox','dfoxkz@foxnews.com','Feminino','Alimentícios','7/17/2005',80417,'Assistant Media Planner',7);
insert into funcionarios values (757,'Evans','aevansl0@nba.com','Masculino','Games','4/5/2012',122595,'Automation Specialist I',6);
insert into funcionarios values (758,'Ray','nrayl1@mail.ru','Masculino','Brinquedos','10/23/2013',126661,'Systems Administrator I',2);
insert into funcionarios values (759,'Vasquez','jvasquezl2@edublogs.org','Masculino','Jardim','4/2/2000',127695,'Systems Administrator I',7);
insert into funcionarios values (760,'Bell','sbelll3@goo.gl','Masculino','Bebês','7/24/2008',66608,'General Manager',1);
insert into funcionarios values (761,'Burke','eburkel4@newsvine.com','Feminino','Lar','12/14/2014',106033,'Quality Control Specialist',1);
insert into funcionarios values (762,'Stanley','cstanleyl5@springer.com','Masculino','Eletronicos','8/9/2013',103237,'Account Executive',7);
insert into funcionarios values (763,'Bell','dbelll6@wisc.edu','Masculino','Computadores','4/22/2002',122843,'Accountant IV',2);
insert into funcionarios values (764,'Jacobs','mjacobsl7@ibm.com','Feminino','Música','7/6/2004',51771,'Accountant III',3);
insert into funcionarios values (765,'Williams','dwilliamsl8@google.com.br','Masculino','Ferramentas','11/7/2009',107709,'Nuclear Power Engineer',1);
insert into funcionarios values (766,'Elliott','kelliottl9@hhs.gov','Masculino','Books','12/18/2009',104149,'Food Chemist',2);
insert into funcionarios values (767,'Hall','jhallla@hao123.com','Masculino','Books','8/2/2004',91501,'Editor',7);
insert into funcionarios values (768,'Meyer','jmeyerlb@yandex.ru','Feminino','Automotivo','7/24/2014',42602,'Programmer IV',2);
insert into funcionarios values (769,'Kelly','jkellylc@linkedin.com','Feminino','Crianças','11/24/2013',132676,'Dental Hygienist',4);
insert into funcionarios values (770,'Burton','jburtonld@delicious.com','Feminino','Games','5/4/2006',140688,'Programmer Analyst III',3);
insert into funcionarios values (771,'Clark','rclarkle@ted.com','Feminino','Jardim','9/9/2014',51792,'Software Consultant',4);
insert into funcionarios values (772,'Elliott','delliottlf@fda.gov','Masculino','Filmes','10/13/2004',100570,'Senior Financial Analyst',5);
insert into funcionarios values (773,'Dixon','rdixonlg@parallels.com','Masculino','Ferramentas','7/2/2007',60383,'VP Product Management',1);
insert into funcionarios values (774,'Richards','vrichardslh@forbes.com','Masculino','Calçados','3/21/2006',68761,'Graphic Designer',1);
insert into funcionarios values (775,'Gonzalez','egonzalezli@naver.com','Feminino','Ferramentas','10/14/2009',131830,'GIS Technical Architect',2);
insert into funcionarios values (776,'Olson','kolsonlj@friendfeed.com','Feminino','Roupas','9/27/2013',107535,'Office Assistant III',7);
insert into funcionarios values (777,'Sims','jsimslk@angelfire.com','Masculino','Industrial','11/15/2001',95548,'Sales Associate',3);
insert into funcionarios values (778,'Thomas','ethomasll@aol.com','Masculino','Automotivo','5/16/2013',116487,'Graphic Designer',1);
insert into funcionarios values (779,'Gonzalez','mgonzalezlm@illinois.edu','Masculino','Alimentícios','2/3/2005',148106,'Sales Representative',2);
insert into funcionarios values (780,'Cox','dcoxln@studiopress.com','Masculino','Games','4/4/2007',135719,'Database Administrator I',5);
insert into funcionarios values (781,'Schmidt','rschmidtlo@harvard.edu','Feminino','Automotivo','4/4/2010',121300,'Human Resources Assistant II',5);
insert into funcionarios values (782,'Weaver','jweaverlp@unblog.fr','Masculino','Filmes','11/9/2011',120226,'Software Engineer II',4);
insert into funcionarios values (783,'Burns','kburnslq@163.com','Masculino','Automotivo','8/13/2004',44377,'Technical Writer',4);
insert into funcionarios values (784,'Burns','aburnslr@squidoo.com','Masculino','Eletronicos','2/15/2008',102001,'Developer III',4);
insert into funcionarios values (785,'Miller','nmillerls@behance.net','Masculino','Música','3/10/2009',99151,'Information Systems Manager',1);
insert into funcionarios values (786,'Willis','jwillislt@instagram.com','Masculino','Jardim','10/8/2000',123427,'General Manager',4);
insert into funcionarios values (787,'Williamson','twilliamsonlu@ow.ly','Feminino','Ferramentas','3/9/2003',135695,'Budget/Accounting Analyst III',6);
insert into funcionarios values (788,'Phillips','dphillipslv@domainmarket.com','Feminino','Brinquedos','4/29/2004',102793,'Editor',4);
insert into funcionarios values (789,'James','kjameslw@yellowbook.com','Masculino','Roupas','3/20/2005',130188,'Structural Analysis Engineer',1);
insert into funcionarios values (790,'Murray','cmurraylx@icio.us','Feminino','Lar','4/25/2013',97607,'Accountant IV',3);
insert into funcionarios values (791,'Phillips','tphillipsly@globo.com','Feminino','Esporte','12/11/2013',93534,'Saúde Coach IV',1);
insert into funcionarios values (792,'Mccoy','jmccoylz@samsung.com','Masculino','Industrial','9/20/2007',95787,'Engineer IV',2);
insert into funcionarios values (793,'Kelly','akellym0@unblog.fr','Feminino','Games','4/16/2011',120086,'Professor',6);
insert into funcionarios values (794,'Larson','mlarsonm1@blinklist.com','Feminino','Outdoors','1/1/2009',119414,'Research Assistant II',1);
insert into funcionarios values (795,'Hansen','dhansenm2@thetimes.co.uk','Feminino','Jardim','9/12/2008',79952,'Compensation Analyst',4);
insert into funcionarios values (796,'Owens','jowensm3@mail.ru','Masculino','Beleza','8/17/2004',138682,'Analyst Programmer',7);
insert into funcionarios values (797,'Ramos','aramosm4@issuu.com','Feminino','Saúde','5/20/2003',49667,'Help Desk Technician',6);
insert into funcionarios values (798,'Kim','akimm5@vimeo.com','Masculino','Jardim','7/13/2008',83798,'Technical Writer',5);
insert into funcionarios values (799,'Sims','asimsm6@lycos.com','Feminino','Roupas','3/9/2013',146024,'Actuary',7);
insert into funcionarios values (800,'Peterson','apetersonm7@eepurl.com','Masculino','Outdoors','9/8/2000',144841,'Web Developer I',4);
insert into funcionarios values (801,'Gomez','tgomezm8@ucoz.ru','Feminino','Filmes','9/20/2012',101582,'Biostatistician II',7);
insert into funcionarios values (802,'Knight','dknightm9@quantcast.com','Feminino','Filmes','5/30/2006',100716,'Help Desk Operator',3);
insert into funcionarios values (803,'Hunt','ahuntma@g.co','Feminino','Beleza','3/16/2011',72016,'Computer Systems Analyst I',4);
insert into funcionarios values (804,'Hunter','hhuntermb@reverbnation.com','Feminino','Books','7/31/2005',123156,'Social Worker',1);
insert into funcionarios values (805,'Gordon','pgordonmc@creativecommons.org','Masculino','Bebês','8/13/2014',110058,'Business Systems Development Analyst',1);
insert into funcionarios values (806,'Hill','shillmd@ca.gov','Masculino','Calçados','12/15/2011',117092,'VP Product Management',5);
insert into funcionarios values (807,'Gibson','hgibsonme@ox.ac.uk','Masculino','Industrial','12/15/2005',148816,'Operator',4);
insert into funcionarios values (808,'Mills','jmillsmf@seesaa.net','Feminino','Games','4/14/2009',79031,'Electrical Engineer',3);
insert into funcionarios values (809,'Butler','rbutlermg@netvibes.com','Masculino','Automotivo','8/9/2006',128448,'Technical Writer',3);
insert into funcionarios values (810,'Foster','lfostermh@blog.com','Feminino','Saúde','1/7/2013',138478,'Software Test Engineer IV',4);
insert into funcionarios values (811,'Harrison','eharrisonmi@cdbaby.com','Masculino','Joalheria','10/8/2010',41026,'Professor',1);
insert into funcionarios values (812,'Harvey','jharveymj@yandex.ru','Masculino','Beleza','9/25/2006',131816,'Sales Representative',1);
insert into funcionarios values (813,'Collins','dcollinsmk@salon.com','Feminino','Alimentícios','11/11/2013',85647,'Speech Pathologist',6);
insert into funcionarios values (814,'Hayes','shayesml@usda.gov','Masculino','Joalheria','2/28/2000',49457,'Compensation Analyst',4);
insert into funcionarios values (815,'Burton','rburtonmm@ow.ly','Feminino','Jardim','10/1/2014',80763,'Community Outreach Specialist',3);
insert into funcionarios values (816,'Jackson','pjacksonmn@dailymotion.com','Feminino','Beleza','12/29/2013',107093,'Electrical Engineer',3);
insert into funcionarios values (817,'Dixon','sdixonmo@marriott.com','Masculino','Bebês','1/15/2008',138970,'Structural Analysis Engineer',7);
insert into funcionarios values (818,'Rice','jricemp@columbia.edu','Feminino','Filmes','4/5/2002',82077,'Data Coordiator',4);
insert into funcionarios values (819,'Murray','jmurraymq@spiegel.de','Masculino','Industrial','12/6/2014',83237,'Editor',4);
insert into funcionarios values (820,'Baker','jbakermr@cafepress.com','Masculino','Brinquedos','1/20/2002',107749,'Graphic Designer',2);
insert into funcionarios values (821,'Riley','rrileyms@uiuc.edu','Masculino','Joalheria','6/19/2012',149114,'Business Systems Development Analyst',7);
insert into funcionarios values (822,'Gonzalez','jgonzalezmt@nsw.gov.au','Masculino','Saúde','8/9/2007',107240,'Financial Analyst',4);
insert into funcionarios values (823,'Harrison','mharrisonmu@guardian.co.uk','Feminino','Bebês','5/30/2008',134334,'Accountant II',7);
insert into funcionarios values (824,'Morris','mmorrismv@tumblr.com','Masculino','Alimentícios','9/26/2002',72008,'GIS Technical Architect',2);
insert into funcionarios values (825,'Turner','jturnermw@mapy.cz','Masculino','Books','4/3/2000',89285,'Community Outreach Specialist',5);
insert into funcionarios values (826,'Garcia','cgarciamx@vistaprint.com','Feminino','Alimentícios','8/10/2003',131075,'Help Desk Operator',2);
insert into funcionarios values (827,'Fowler','hfowlermy@nps.gov','Masculino','Bebês','5/7/2009',110383,'Chief Design Engineer',4);
insert into funcionarios values (828,'Allen','wallenmz@gnu.org','Feminino','Ferramentas','7/18/2005',149586,'Account Coordinator',1);
insert into funcionarios values (829,'Parker','bparkern0@weibo.com','Masculino','Saúde','11/27/2002',89503,'Research Associate',2);
insert into funcionarios values (830,'Stewart','cstewartn1@hugedomains.com','Feminino','Computadores','3/14/2010',149336,'Senior Sales Associate',1);
insert into funcionarios values (831,'Rodriguez','drodriguezn2@guardian.co.uk','Feminino','Outdoors','8/30/2006',140276,'Electrical Engineer',5);
insert into funcionarios values (832,'Turner','hturnern3@tumblr.com','Feminino','Games','4/8/2001',127875,'Accountant III',7);
insert into funcionarios values (833,'Chavez','rchavezn4@tamu.edu','Feminino','Música','5/29/2009',137704,'Help Desk Technician',4);
insert into funcionarios values (834,'Cox','kcoxn5@dyndns.org','Feminino','Games','1/17/2013',149221,'Senior Financial Analyst',2);
insert into funcionarios values (835,'Tucker','btuckern6@ovh.net','Masculino','Bebês','6/4/2014',148573,'Nurse Practicioner',4);
insert into funcionarios values (836,'Vasquez','svasquezn7@1und1.de','Feminino','Games','9/20/2002',125378,'Senior Developer',4);
insert into funcionarios values (837,'Cole','wcolen8@php.net','Feminino','Joalheria','9/12/2006',66420,'Clinical Specialist',7);
insert into funcionarios values (838,'Black','rblackn9@sun.com','Masculino','Brinquedos','9/28/2008',117171,'Electrical Engineer',4);
insert into funcionarios values (839,'Richardson','trichardsonna@cbsnews.com','Feminino','Saúde','10/23/2008',145962,'Cost Accountant',3);
insert into funcionarios values (840,'Hamilton','phamiltonnb@earthlink.net','Masculino','Books','10/19/2001',73778,'Sales Representative',2);
insert into funcionarios values (841,'Sullivan','ssullivannc@clickbank.net','Masculino','Crianças','3/4/2008',76731,'Accounting Assistant II',2);
insert into funcionarios values (842,'Carpenter','acarpenternd@prlog.org','Feminino','Beleza','7/13/2008',101653,'Web Designer II',6);
insert into funcionarios values (843,'Ross','rrossne@salon.com','Masculino','Jardim','1/11/2001',62534,'Senior Editor',3);
insert into funcionarios values (844,'Hall','jhallnf@1und1.de','Masculino','Outdoors','4/30/2013',100428,'Web Designer I',3);
insert into funcionarios values (845,'Washington','iwashingtonng@freewebs.com','Masculino','Crianças','12/2/2001',109828,'VP Quality Control',6);
insert into funcionarios values (846,'Moreno','dmorenonh@webs.com','Feminino','Joalheria','3/21/2001',63133,'Clinical Specialist',5);
insert into funcionarios values (847,'Knight','dknightni@unc.edu','Feminino','Roupas','3/22/2008',91532,'Operator',4);
insert into funcionarios values (848,'Austin','jaustinnj@gov.uk','Feminino','Calçados','1/26/2005',101646,'Environmental Tech',1);
insert into funcionarios values (849,'Rice','kricenk@cyberchimps.com','Masculino','Alimentícios','8/2/2002',68034,'Senior Financial Analyst',4);
insert into funcionarios values (850,'Kelley','pkelleynl@biglobe.ne.jp','Masculino','Crianças','4/4/2012',55214,'Senior Quality Engineer',2);
insert into funcionarios values (851,'Gordon','bgordonnm@imdb.com','Feminino','Automotivo','12/29/2002',136448,'Media Manager II',4);
insert into funcionarios values (852,'Rose','srosenn@flavors.me','Masculino','Calçados','5/1/2010',76086,'Statistician I',7);
insert into funcionarios values (853,'Mendoza','emendozano@edublogs.org','Masculino','Beleza','8/3/2013',128947,'Help Desk Operator',5);
insert into funcionarios values (854,'Hanson','ghansonnp@free.fr','Masculino','Ferramentas','10/14/2006',113354,'VP Quality Control',4);
insert into funcionarios values (855,'Perry','eperrynq@imdb.com','Masculino','Jardim','5/21/2012',75125,'VP Marketing',7);
insert into funcionarios values (856,'Roberts','trobertsnr@over-blog.com','Feminino','Roupas','2/21/2004',139714,'Help Desk Operator',2);
insert into funcionarios values (857,'Nichols','dnicholsns@ifeng.com','Masculino','Brinquedos','10/20/2003',43537,'Help Desk Operator',4);
insert into funcionarios values (858,'Wright','lwrightnt@house.gov','Feminino','Automotivo','11/23/2001',127521,'Nurse',4);
insert into funcionarios values (859,'Clark','mclarknu@bigcartel.com','Masculino','Saúde','2/19/2007',112510,'Information Systems Manager',4);
insert into funcionarios values (860,'Anderson','landersonnv@sakura.ne.jp','Masculino','Esporte','12/26/2004',115009,'Structural Engineer',4);
insert into funcionarios values (861,'Foster','kfosternw@a8.net','Feminino','Eletronicos','5/1/2013',64381,'Professor',7);
insert into funcionarios values (862,'Stanley','bstanleynx@phoca.cz','Feminino','Alimentícios','2/10/2001',149929,'Director of Sales',6);
insert into funcionarios values (863,'Gonzales','fgonzalesny@squarespace.com','Feminino','Automotivo','9/7/2001',101006,'Sales Associate',2);
insert into funcionarios values (864,'Jones','sjonesnz@chron.com','Feminino','Beleza','9/1/2013',47716,'Quality Engineer',2);
insert into funcionarios values (865,'Dixon','mdixono0@cbc.ca','Feminino','Esporte','12/29/2008',126420,'Structural Analysis Engineer',6);
insert into funcionarios values (866,'Kelly','jkellyo1@ameblo.jp','Feminino','Esporte','9/1/2011',55265,'Paralegal',1);
insert into funcionarios values (867,'Johnson','bjohnsono2@toplist.cz','Feminino','Books','3/18/2012',95679,'Associate Professor',3);
insert into funcionarios values (868,'Price','jpriceo3@google.it','Masculino','Filmes','1/24/2003',52612,'Analyst Programmer',7);
insert into funcionarios values (869,'Turner','pturnero4@tamu.edu','Feminino','Calçados','12/10/2010',130849,'Desktop Support Technician',5);
insert into funcionarios values (870,'Howard','ghowardo5@ow.ly','Masculino','Outdoors','8/21/2006',141753,'Assistant Professor',3);
insert into funcionarios values (871,'Hanson','thansono6@paginegialle.it','Masculino','Saúde','8/27/2007',133492,'Accountant II',3);
insert into funcionarios values (872,'Hall','thallo7@hud.gov','Masculino','Crianças','12/28/2004',112126,'Information Systems Manager',3);
insert into funcionarios values (873,'Alexander','aalexandero8@histats.com','Feminino','Brinquedos','7/5/2006',140078,'Environmental Specialist',3);
insert into funcionarios values (874,'Spencer','kspencero9@eventbrite.com','Masculino','Books','9/29/2012',119769,'Director of Sales',2);
insert into funcionarios values (875,'Jenkins','rjenkinsoa@answers.com','Feminino','Saúde','2/15/2007',115911,'Civil Engineer',7);
insert into funcionarios values (876,'Montgomery','amontgomeryob@dmoz.org','Masculino','Calçados','12/22/2003',75676,'Recruiting Manager',3);
insert into funcionarios values (877,'Webb','rwebboc@a8.net','Masculino','Outdoors','4/13/2005',144932,'Marketing Assistant',4);
insert into funcionarios values (878,'Williamson','pwilliamsonod@utexas.edu','Masculino','Industrial','10/25/2010',80102,'Graphic Designer',2);
insert into funcionarios values (879,'Hill','shilloe@ft.com','Masculino','Ferramentas','10/3/2011',144661,'Registered Nurse',3);
insert into funcionarios values (880,'Grant','kgrantof@phoca.cz','Feminino','Música','9/26/2001',60268,'Registered Nurse',3);
insert into funcionarios values (881,'Wright','cwrightog@trellian.com','Feminino','Ferramentas','9/10/2014',94072,'Social Worker',3);
insert into funcionarios values (882,'George','wgeorgeoh@mail.ru','Masculino','Calçados','2/23/2006',85249,'Engineer I',2);
insert into funcionarios values (883,'George','lgeorgeoi@jigsy.com','Masculino','Alimentícios','10/12/2007',66059,'Software Test Engineer IV',5);
insert into funcionarios values (884,'Ford','bfordoj@spiegel.de','Feminino','Eletronicos','11/26/2005',80931,'Cost Accountant',1);
insert into funcionarios values (885,'Wallace','mwallaceok@abc.net.au','Feminino','Brinquedos','9/17/2011',118793,'Research Assistant III',3);
insert into funcionarios values (886,'Murphy','fmurphyol@tumblr.com','Feminino','Bebês','9/26/2014',62114,'Analyst Programmer',7);
insert into funcionarios values (887,'Vasquez','jvasquezom@networksolutions.com','Masculino','Beleza','5/3/2014',131811,'Social Worker',4);
insert into funcionarios values (888,'Collins','bcollinson@google.pl','Feminino','Outdoors','9/30/2007',143034,'Budget/Accounting Analyst III',3);
insert into funcionarios values (889,'Jackson','ajacksonoo@slate.com','Masculino','Games','5/7/2013',41516,'Nurse',1);
insert into funcionarios values (890,'Howell','ehowellop@dailymotion.com','Feminino','Bebês','11/26/2012',72534,'Account Executive',4);
insert into funcionarios values (891,'Richards','arichardsoq@so-net.ne.jp','Masculino','Bebês','6/9/2011',140004,'Design Engineer',7);
insert into funcionarios values (892,'Crawford','pcrawfordor@gnu.org','Masculino','Beleza','6/23/2004',114436,'Account Representative IV',5);
insert into funcionarios values (893,'Dixon','jdixonos@msu.edu','Masculino','Alimentícios','3/31/2009',68684,'funcionarios Scientist',3);
insert into funcionarios values (894,'Owens','jowensot@gmpg.org','Masculino','Automotivo','9/18/2000',135326,'Graphic Designer',1);
insert into funcionarios values (895,'Moore','kmooreou@slate.com','Masculino','Industrial','2/23/2014',40194,'Environmental Specialist',5);
insert into funcionarios values (896,'Carpenter','rcarpenterov@pagesperso-orange.fr','Feminino','Lar','10/28/2010',134813,'Saúde Coach I',7);
insert into funcionarios values (897,'Reid','sreidow@smugmug.com','Masculino','Beleza','3/9/2002',79718,'Marketing Manager',4);
insert into funcionarios values (898,'Lee','kleeox@nature.com','Feminino','Industrial','12/9/2010',115085,'Senior Quality Engineer',7);
insert into funcionarios values (899,'Burton','kburtonoy@army.mil','Feminino','Calçados','3/5/2005',67758,'Chemical Engineer',2);
insert into funcionarios values (900,'Jordan','tjordanoz@instagram.com','Masculino','Brinquedos','2/23/2012',115776,'Database Administrator I',2);
insert into funcionarios values (901,'Perry','kperryp0@chron.com','Masculino','Books','12/15/2013',146701,'Research Assistant II',7);
insert into funcionarios values (902,'Wright','bwrightp1@deviantart.com','Masculino','Calçados','12/16/2011',109233,'Mechanical Systems Engineer',4);
insert into funcionarios values (903,'Burns','eburnsp2@discuz.net','Feminino','Outdoors','1/7/2007',113654,'Saúde Coach IV',1);
insert into funcionarios values (904,'Roberts','drobertsp3@ed.gov','Feminino','Ferramentas','8/25/2004',90937,'Cost Accountant',6);
insert into funcionarios values (905,'Webb','dwebbp4@about.com','Masculino','Automotivo','10/10/2007',111689,'GIS Technical Architect',5);
insert into funcionarios values (906,'Spencer','sspencerp5@mtv.com','Masculino','Eletronicos','4/18/2014',110881,'Electrical Engineer',1);
insert into funcionarios values (907,'Frazier','kfrazierp6@dailymail.co.uk','Feminino','Ferramentas','9/22/2009',104326,'Assistant Manager',5);
insert into funcionarios values (908,'Hanson','jhansonp7@1688.com','Feminino','Eletronicos','11/27/2003',144767,'Executive Secretary',5);
insert into funcionarios values (909,'Mcdonald','hmcdonaldp8@facebook.com','Masculino','Automotivo','12/26/2009',111041,'Research Assistant II',6);
insert into funcionarios values (910,'Reyes','freyesp9@ft.com','Feminino','Jardim','12/21/2005',148860,'Product Engineer',4);
insert into funcionarios values (911,'Peterson','jpetersonpa@unblog.fr','Masculino','Automotivo','1/20/2002',53964,'Pharmacist',1);
insert into funcionarios values (912,'Fisher','sfisherpb@answers.com','Feminino','Beleza','3/1/2007',131152,'Database Administrator IV',2);
insert into funcionarios values (913,'Kelley','mkelleypc@sourceforge.net','Feminino','Roupas','2/20/2012',116266,'Marketing Assistant',6);
insert into funcionarios values (914,'Armstrong','carmstrongpd@4shared.com','Feminino','Beleza','6/7/2006',143853,'Design Engineer',2);
insert into funcionarios values (915,'Bell','cbellpe@npr.org','Masculino','Ferramentas','5/26/2010',92561,'Senior Sales Associate',1);
insert into funcionarios values (916,'Payne','bpaynepf@cbsnews.com','Feminino','Alimentícios','8/10/2006',45486,'GIS Technical Architect',1);
insert into funcionarios values (917,'Gutierrez','sgutierrezpg@bloglovin.com','Masculino','Beleza','12/11/2004',95424,'VP Product Management',2);
insert into funcionarios values (918,'Miller','amillerph@skype.com','Feminino','Bebês','9/30/2004',73905,'Design Engineer',7);
insert into funcionarios values (919,'Bishop','kbishoppi@ovh.net','Feminino','Filmes','12/18/2010',53798,'Mechanical Systems Engineer',1);
insert into funcionarios values (920,'Cole','scolepj@odnoklassniki.ru','Feminino','Ferramentas','5/2/2010',116766,'Account Representative IV',4);
insert into funcionarios values (921,'Moore','jmoorepk@Lar.pl','Feminino','Beleza','6/23/2013',142101,'Paralegal',2);
insert into funcionarios values (922,'Watkins','swatkinspl@google.fr','Feminino','Beleza','4/19/2000',41299,'Computer Systems Analyst IV',5);
insert into funcionarios values (923,'White','jwhitepm@elpais.com','Masculino','Alimentícios','1/7/2003',122130,'Project Manager',1);
insert into funcionarios values (924,'Wilson','bwilsonpn@chron.com','Masculino','Beleza','3/6/2003',122446,'Systems Administrator II',6);
insert into funcionarios values (925,'Phillips','dphillipspo@adobe.com','Feminino','Jardim','10/3/2011',127367,'Recruiting Manager',4);
insert into funcionarios values (926,'Austin','raustinpp@house.gov','Masculino','Brinquedos','4/1/2014',50161,'Account Executive',3);
insert into funcionarios values (927,'Howard','dhowardpq@ocn.ne.jp','Masculino','Música','11/10/2003',82080,'Analog Circuit Design manager',2);
insert into funcionarios values (928,'Young','lyoungpr@psu.edu','Feminino','Crianças','12/21/2009',62799,'Operator',1);
insert into funcionarios values (929,'Rice','ericeps@reference.com','Feminino','Roupas','8/8/2003',66357,'Cost Accountant',3);
insert into funcionarios values (930,'Hansen','jhansenpt@slate.com','Feminino','Jardim','4/26/2013',129746,'Geological Engineer',1);
insert into funcionarios values (931,'Burton','jburtonpu@wufoo.com','Feminino','Brinquedos','8/24/2004',63682,'Recruiting Manager',5);
insert into funcionarios values (932,'Reyes','lreyespv@tuttocitta.it','Feminino','Jardim','5/27/2009',134114,'Accounting Assistant IV',2);
insert into funcionarios values (933,'Williams','gwilliamspw@columbia.edu','Masculino','Bebês','3/23/2014',131273,'Web Developer IV',6);
insert into funcionarios values (934,'Morrison','tmorrisonpx@free.fr','Masculino','Brinquedos','9/22/2005',93714,'Social Worker',5);
insert into funcionarios values (935,'Hudson','mhudsonpy@altervista.org','Masculino','Books','12/8/2001',146745,'Assistant Media Planner',1);
insert into funcionarios values (936,'Weaver','mweaverpz@delicious.com','Feminino','Computadores','12/20/2010',126307,'Professor',4);
insert into funcionarios values (937,'Hawkins','chawkinsq0@bravesites.com','Masculino','Esporte','9/25/2011',134931,'Tax Accountant',1);
insert into funcionarios values (938,'Jones','djonesq1@tamu.edu','Feminino','Lar','2/10/2002',73668,'Environmental Specialist',2);
insert into funcionarios values (939,'Austin','kaustinq2@soup.io','Masculino','Industrial','1/19/2012',48840,'Product Engineer',1);
insert into funcionarios values (940,'Turner','lturnerq3@ycombinator.com','Masculino','Alimentícios','3/9/2014',146952,'Dental Hygienist',2);
insert into funcionarios values (941,'Cunningham','gcunninghamq4@webmd.com','Feminino','Jardim','5/7/2006',73565,'Mechanical Systems Engineer',7);
insert into funcionarios values (942,'Lopez','llopezq5@usgs.gov','Masculino','Calçados','6/7/2010',64443,'Senior Sales Associate',6);
insert into funcionarios values (943,'Phillips','kphillipsq6@soup.io','Feminino','Eletronicos','1/5/2008',127171,'Cost Accountant',4);
insert into funcionarios values (944,'Adams','jadamsq7@aol.com','Feminino','Automotivo','2/11/2002',79045,'VP Product Management',3);
insert into funcionarios values (945,'Lee','pleeq8@noaa.gov','Feminino','Joalheria','3/16/2006',117147,'funcionarios Accountant III',1);
insert into funcionarios values (946,'Phillips','dphillipsq9@stanford.edu','Feminino','Outdoors','1/6/2014',69807,'Account Representative IV',3);
insert into funcionarios values (947,'Kelly','ckellyqa@boston.com','Feminino','Calçados','1/9/2004',128646,'Senior Editor',1);
insert into funcionarios values (948,'James','bjamesqb@hubpages.com','Masculino','Ferramentas','2/13/2008',47271,'Programmer Analyst IV',1);
insert into funcionarios values (949,'Woods','jwoodsqc@patch.com','Masculino','Calçados','12/25/2005',59363,'Programmer Analyst IV',1);
insert into funcionarios values (950,'Kennedy','jkennedyqd@nba.com','Feminino','Calçados','7/22/2008',68364,'Professor',5);
insert into funcionarios values (951,'Lewis','jlewisqe@etsy.com','Feminino','Brinquedos','12/17/2012',115975,'Social Worker',7);
insert into funcionarios values (952,'Cole','acoleqf@unblog.fr','Feminino','Calçados','10/21/2008',53905,'Editor',7);
insert into funcionarios values (953,'Edwards','pedwardsqg@cnbc.com','Masculino','Alimentícios','9/3/2003',115360,'Social Worker',6);
insert into funcionarios values (954,'Cooper','ncooperqh@wp.com','Feminino','Eletronicos','7/19/2011',120108,'Computer Systems Analyst II',5);
insert into funcionarios values (955,'Marshall','wmarshallqi@fastcompany.com','Masculino','Roupas','4/18/2005',59234,'VP Product Management',7);
insert into funcionarios values (956,'Austin','saustinqj@vimeo.com','Feminino','Alimentícios','1/28/2007',76812,'Biostatistician III',7);
insert into funcionarios values (957,'Franklin','cfranklinqk@dyndns.org','Feminino','Games','5/8/2012',42347,'VP Product Management',3);
insert into funcionarios values (958,'Wood','bwoodql@epa.gov','Masculino','Ferramentas','12/5/2003',82164,'Compensation Analyst',1);
insert into funcionarios values (959,'Young','jyoungqm@xing.com','Masculino','Música','11/29/2000',114695,'Statistician IV',1);
insert into funcionarios values (960,'Lane','glaneqn@google.fr','Masculino','Computadores','12/31/2002',47541,'Payment Adjustment Coordinator',2);
insert into funcionarios values (961,'Bowman','rbowmanqo@auda.org.au','Feminino','Bebês','11/14/2011',116355,'Structural Engineer',5);
insert into funcionarios values (962,'Hayes','ahayesqp@npr.org','Feminino','Saúde','10/13/2000',48339,'Engineer III',5);
insert into funcionarios values (963,'Burton','cburtonqq@github.io','Feminino','Roupas','6/20/2012',58697,'Teacher',4);
insert into funcionarios values (964,'Ramos','mramosqr@is.gd','Masculino','Jardim','3/2/2002',127268,'Nurse Practicioner',4);
insert into funcionarios values (965,'Butler','sbutlerqs@ow.ly','Masculino','Games','4/2/2014',115541,'Pharmacist',6);
insert into funcionarios values (966,'Kelly','ckellyqt@canalblog.com','Feminino','Industrial','2/13/2008',54876,'Research Associate',2);
insert into funcionarios values (967,'Lawson','clawsonqu@cargocollective.com','Feminino','Beleza','8/13/2012',55081,'Mechanical Systems Engineer',5);
insert into funcionarios values (968,'Moreno','nmorenoqv@chronoengine.com','Masculino','Beleza','9/26/2009',123017,'Speech Pathologist',6);
insert into funcionarios values (969,'Richards','jrichardsqw@blog.com','Masculino','Roupas','7/5/2014',85294,'Media Manager I',4);
insert into funcionarios values (970,'James','pjamesqx@nymag.com','Masculino','Crianças','8/5/2004',54470,'Accounting Assistant IV',2);
insert into funcionarios values (971,'Dunn','mdunnqy@chronoengine.com','Feminino','Outdoors','6/11/2011',148889,'Help Desk Operator',4);
insert into funcionarios values (972,'Bailey','mbaileyqz@howstuffworks.com','Feminino','Bebês','1/10/2008',94049,'Senior Financial Analyst',7);
insert into funcionarios values (973,'Walker','swalkerr0@sina.com.cn','Feminino','Filmes','5/11/2009',51132,'Assistant Manager',4);
insert into funcionarios values (974,'Welch','rwelchr1@eventbrite.com','Masculino','Brinquedos','6/14/2002',87422,'Research Nurse',3);
insert into funcionarios values (975,'Fowler','kfowlerr2@wp.com','Feminino','Jardim','9/15/2014',88439,'Media Manager III',2);
insert into funcionarios values (976,'Chapman','achapmanr3@list-manage.com','Masculino','Beleza','2/25/2005',110749,'Legal Assistant',7);
insert into funcionarios values (977,'Collins','acollinsr4@jiathis.com','Masculino','Beleza','10/26/2006',137911,'Accountant IV',4);
insert into funcionarios values (978,'Hunt','ghuntr5@moonfruit.com','Masculino','Eletronicos','6/18/2009',93665,'Saúde Coach I',3);
insert into funcionarios values (979,'Medina','bmedinar6@1688.com','Masculino','Bebês','12/31/2009',90068,'Quality Control Specialist',6);
insert into funcionarios values (980,'Sanchez','tsanchezr7@lycos.com','Feminino','Lar','12/19/2014',83704,'Editor',5);
insert into funcionarios values (981,'Simmons','dsimmonsr8@craigslist.org','Masculino','Beleza','6/27/2011',116767,'Environmental Tech',3);
insert into funcionarios values (982,'Mendoza','bmendozar9@reference.com','Feminino','Brinquedos','8/26/2000',54599,'Assistant Media Planner',3);
insert into funcionarios values (983,'Lopez','llopezra@blogger.com','Feminino','Esporte','2/17/2014',94685,'Research Nurse',4);
insert into funcionarios values (984,'Williams','hwilliamsrb@webnode.com','Masculino','Joalheria','10/20/2004',91608,'funcionarios Scientist',5);
insert into funcionarios values (985,'Stevens','hstevensrc@hugedomains.com','Masculino','Eletronicos','2/28/2006',118791,'Safety Technician IV',1);
insert into funcionarios values (986,'Ryan','hryanrd@networkadvertising.org','Masculino','Beleza','11/27/2002',115888,'Librarian',6);
insert into funcionarios values (987,'Lawrence','slawrencere@cdbaby.com','Feminino','Ferramentas','12/17/2000',60743,'Civil Engineer',5);
insert into funcionarios values (988,'Cole','ecolerf@scientificamerican.com','Feminino','Beleza','4/17/2005',117962,'Accountant III',7);
insert into funcionarios values (989,'Fields','dfieldsrg@examiner.com','Feminino','Música','3/7/2004',67817,'Registered Nurse',7);
insert into funcionarios values (990,'Thomas','lthomasrh@elegantthemes.com','Masculino','Crianças','8/6/2003',76229,'Business Systems Development Analyst',4);
insert into funcionarios values (991,'Turner','rturnerri@a8.net','Feminino','Eletronicos','12/13/2009',62286,'Senior Sales Associate',2);
insert into funcionarios values (992,'Edwards','nedwardsrj@wikimedia.org','Masculino','Outdoors','10/30/2006',121713,'Director of Sales',5);
insert into funcionarios values (993,'Anderson','sandersonrk@businesswire.com','Feminino','Books','3/7/2009',139486,'Product Engineer',7);
insert into funcionarios values (994,'Hamilton','rhamiltonrl@skype.com','Feminino','Saúde','10/29/2002',141375,'Desktop Support Technician',7);
insert into funcionarios values (995,'Wood','kwoodrm@indiegogo.com','Feminino','Joalheria','4/5/2010',83404,'Pharmacist',2);
insert into funcionarios values (996,'James','tjamesrn@soundcloud.com','Feminino','Games','11/17/2013',78433,'Accountant II',7);
insert into funcionarios values (997,'Reynolds','dreynoldsro@blogtalkradio.com','Feminino','Computadores','4/16/2007',120138,'Statistician IV',1);
insert into funcionarios values (998,'Walker','kwalkerrp@unicef.org','Feminino','Games','2/13/2010',60363,'Account Coordinator',1);
insert into funcionarios values (999,'Kennedy','lkennedyrq@edublogs.org','Masculino','Industrial','9/22/2004',48050,'Graphic Designer',2);
insert into funcionarios values (1000,'Howard','showardrr@addtoany.com','Masculino','Bebês','11/7/2003',148687,'General Manager',3);


/* PRIMEIRA FORMA NORMAL */

/* 
1 - TODO CAMPO VETORIZADO SE TORNARÁ OUTRA TABELA 
EXEMPLO -> [9345678, 98364834, 99933434] -> VETOR DE TELEFONE
POIS PERTENCE A MESMA FAMÍLIA

2 - TODO CAMPO MULTIVALORADA SE TORNARÁ OUTRA TABELA
EXEMPLO -> TODO CAMPO QUE PODE SER DIVISÍVEL, COMO O ENDEREÇO
POIS PODEMOS SEPARAR EM: ESTADO, CIDADE, BAIRRO E RUA

3 - TODA TABELA NECESSEIDA DE PELO MENOS UM CAMPO QUE IDENTIFIQUE CADA REGISTRO SENDO COMO ÚNICO
ISSO É O QUE CHAMAMOS DE CHAVE PRIMÁRIA
*/

DROP DATABASE COMERCIO;
CREATE DATABASE COMERCIO;
USE COMERCIO;

CREATE TABLE CLIENTE(
	IDCLIENTE INT PRIMARY KEY AUTO_INCREMENT,
	NOME VARCHAR(30) NOT NULL,
	SEXO ENUM('M','F') NOT NULL,
	EMAIL VARCHAR(50) UNIQUE,
	CPF CHAR(14) UNIQUE
);

CREATE TABLE ENDERECO(
	IDENDERECO INT PRIMARY KEY AUTO_INCREMENT, 
	RUA VARCHAR(30) NOT NULL,
	BAIRRO VARCHAR(30) NOT NULL,
	CIDADE VARCHAR(30) NOT NULL,
	ESTADO CHAR(2) NOT NULL,
	ID_CLIENTE INT UNIQUE,

	FOREIGN KEY(ID_CLIENTE)
	REFERENCES CLIENTE(IDCLIENTE)
);

CREATE TABLE TELEFONE(
	IDTELEFONE INT PRIMARY KEY AUTO_INCREMENT, 
	TIPO ENUM('RES','COM','CEL') NOT NULL,
	NUMERO VARCHAR(14) NOT NULL,
	ID_CLIENTE INT,

	FOREIGN KEY(ID_CLIENTE)
	REFERENCES CLIENTE(IDCLIENTE)
);

INSERT INTO CLIENTE VALUES(NULL,'JOAO','M','JOAOA@IG.COM','76567587887');
INSERT INTO CLIENTE VALUES(NULL,'CARLOS','M','CARLOSA@IG.COM','5464553466');
INSERT INTO CLIENTE VALUES(NULL,'ANA','F','ANA@IG.COM','456545678');
INSERT INTO CLIENTE VALUES(NULL,'CLARA','F',NULL,'5687766856');
INSERT INTO CLIENTE VALUES(NULL,'JORGE','M','JORGE@IG.COM','8756547688');
INSERT INTO CLIENTE VALUES(NULL,'CELIA','F','JCELIA@IG.COM','5767876889');

INSERT INTO ENDERECO VALUES(NULL,'RUA ANTONIO SA','CENTRO','B. HORIZONTE','MG',4);
INSERT INTO ENDERECO VALUES(NULL,'RUA CAPITAO HERMES','CENTRO','RIO DE JANEIRO','RJ',1);
INSERT INTO ENDERECO VALUES(NULL,'RUA PRES VARGAS','JARDINS','SAO PAULO','SP',3);
INSERT INTO ENDERECO VALUES(NULL,'RUA ALFANDEGA','ESTACIO','RIO DE JANEIRO','RJ',2);
INSERT INTO ENDERECO VALUES(NULL,'RUA DO OUVIDOR','FLAMENGO','RIO DE JANEIRO','RJ',6);
INSERT INTO ENDERECO VALUES(NULL,'RUA URUGUAIANA','CENTRO','VITORIA','ES',5);

INSERT INTO TELEFONE VALUES(NULL,'CEL','78458743',5);
INSERT INTO TELEFONE VALUES(NULL,'RES','56576876',5);
INSERT INTO TELEFONE VALUES(NULL,'CEL','87866896',1);
INSERT INTO TELEFONE VALUES(NULL,'COM','54768899',2);
INSERT INTO TELEFONE VALUES(NULL,'RES','99667587',1);
INSERT INTO TELEFONE VALUES(NULL,'CEL','78989765',3);
INSERT INTO TELEFONE VALUES(NULL,'CEL','99766676',3);
INSERT INTO TELEFONE VALUES(NULL,'COM','66687899',1);
INSERT INTO TELEFONE VALUES(NULL,'RES','89986668',5);
INSERT INTO TELEFONE VALUES(NULL,'CEL','88687909',2);

/* JUNÇÃO */

SELECT NOME, SEXO, BAIRRO, CIDADE
FROM CLIENTE, ENDERECO
WHERE IDCLIENTE = ID_CLIENTE;

SELECT NOME, SEXO, BAIRRO, CIDADE
FROM CLIENTE
INNER JOIN ENDERECO
ON IDCLIENTE = ID_CLIENTE;

SELECT NOME, SEXO, BAIRRO, CIDADE
FROM CLIENTE
INNER JOIN ENDERECO
ON IDCLIENTE = ID_CLIENTE
WHERE SEXO = 'M';

SELECT NOME, SEXO, EMAIL, TIPO, NUMERO
FROM CLIENTE
INNER JOIN TELEFONE
ON IDCLIENTE = ID_CLIENTE;

SELECT C.NOME, E.BAIRRO, T.NUMERO
FROM CLIENTE C, ENDERECO E, TELEFONE T
WHERE C.IDCLIENTE = E.ID_CLIENTE 
AND C.IDCLIENTE = T.ID_CLIENTE;

SELECT C.NOME, E.BAIRRO, T.NUMERO
FROM CLIENTE C
INNER JOIN ENDERECO E
ON C.IDCLIENTE = E.ID_CLIENTE
INNER JOIN TELEFONE T
ON C.IDCLIENTE = T.ID_CLIENTE;

/*
	DML - DATA MANIPULATION LANGUAGE
	DDL - DATA DEFINITION LANGUAGE
	DCL - DATA CONTROL LANGUAGE
	TCL - TRANSACTION CONTROL LANGUAGE
*/

INSERT INTO CLIENTE VALUES(NULL,'PAULA','F',NULL,'77437493');
INSERT INTO ENDERECO VALUES(NULL,'RUA JOAQUIM SILVA','ALVORADA','NITEROI','RJ',7);

SELECT * FROM CLIENTE;

/* FILTROS */

SELECT * FROM CLIENTE
WHERE SEXO = 'M';

/* UPDATE */

SELECT * FROM CLIENTE
WHERE IDCLIENTE = 7;

UPDATE CLIENTE
SET SEXO = 'F'
WHERE IDCLIENTE = 7;

/* DELETE */ 

INSERT INTO CLIENTE VALUES(NULL,'XXX','M',NULL,'XXX');

SELECT * FROM CLIENTE
WHERE IDCLIENTE = 8;

DELETE FROM CLIENTE WHERE IDCLIENTE = 8;

/* 
   DDL - DATA DEFINITION LANGUAGE
   USADA PARA A DEFINIÇÃO DE ESTRUTURAS DE DADOS
*/

CREATE TABLE PRODUTO(
	IDPRODUTO INT PRIMARY KEY AUTO_INCREMENT,
	NOME_PRODUTO VARCHAR(30) NOT NULL,
	PRECO INT,
	FRETE FLOAT(10, 2) NOT NULL
);

ALTER TABLE PRODUTO 
CHANGE PRECO VALOR_UNITARIO INT NOT NULL; 

ALTER TABLE PRODUTO 
CHANGE VALOR_UNITARIO VALOR_UNITARIO INT; 

ALTER TABLE PRODUTO 
MODIFY VALOR_UNITARIO VARCHAR(50) NOT NULL;

ALTER TABLE PRODUTO
ADD PESO FLOAT(10, 2);

ALTER TABLE PRODUTO
MODIFY PESO FLOAT(10, 2) NOT NULL;

ALTER TABLE PRODUTO
DROP COLUMN PESO;

ALTER TABLE PRODUTO
ADD COLUMN PESO FLOAT(10, 2) NOT NULL 
AFTER NOME_PRODUTO;

ALTER TABLE PRODUTO
DROP COLUMN PESO;

ALTER TABLE PRODUTO
ADD COLUMN PESO FLOAT(10, 2) NOT NULL 
FIRST;

/* EXERCICIOS DML */

INSERT INTO CLIENTE VALUES(NULL,'FLAVIO','M','FLAVIO@IG.COM','4657765');
INSERT INTO CLIENTE VALUES(NULL,'ANDRE','M','ANDRE@GLOBO.COM','7687567');
INSERT INTO CLIENTE VALUES(NULL,'GIOVANA','F',NULL,'0876655');
INSERT INTO CLIENTE VALUES(NULL,'KARLA','F','KARLA@GMAIL.COM','545676778');
INSERT INTO CLIENTE VALUES(NULL,'DANIELE','F','DANIELE@GMAIL.COM','43536789');
INSERT INTO CLIENTE VALUES(NULL,'LORENA','F',NULL,'774557887');
INSERT INTO CLIENTE VALUES(NULL,'EDUARDO','M',NULL,'54376457');
INSERT INTO CLIENTE VALUES(NULL,'ANTONIO','M','ANTONIO@IG.COM','12436767');
INSERT INTO CLIENTE VALUES(NULL,'ANTONIO','M','ANTONIO@UOL.COM','3423565');
INSERT INTO CLIENTE VALUES(NULL,'ELAINE','F','ELAINE@GLOBO.COM','32567763');
INSERT INTO CLIENTE VALUES(NULL,'CARMEM','F','CARMEM@IG.COM','787832213');
INSERT INTO CLIENTE VALUES(NULL,'ADRIANA','F','ADRIANA@GMAIL.COM','88556942');
INSERT INTO CLIENTE VALUES(NULL,'JOICE','F','JOICE@GMAIL.COM','55412256');

/* CADASTRE UM ENDERECO PARA CADA CLIENTE */

INSERT INTO ENDERECO VALUES(NULL,'RUA GUEDES','CASCADURA','B. HORIZONTE','MG',9);
INSERT INTO ENDERECO VALUES(NULL,'RUA MAIA LACERDA','ESTACIO','RIO DE JANEIRO','RJ',10);
INSERT INTO ENDERECO VALUES(NULL,'RUA VISCONDESSA','CENTRO','RIO DE JANEIRO','RJ',11);
INSERT INTO ENDERECO VALUES(NULL,'RUA NELSON MANDELA','COPACABANA','RIO DE JANEIRO','RJ',12);
INSERT INTO ENDERECO VALUES(NULL,'RUA ARAUJO LIMA','CENTRO','VITORIA','ES',13);
INSERT INTO ENDERECO VALUES(NULL,'RUA CASTRO ALVES','LEBLON','RIO DE JANEIRO','RJ',14);
INSERT INTO ENDERECO VALUES(NULL,'AV CAPITAO ANTUNES','CENTRO','CURITIBA','PR',15);
INSERT INTO ENDERECO VALUES(NULL,'AV CARLOS BARROSO','JARDINS','SAO PAULO','SP',16);
INSERT INTO ENDERECO VALUES(NULL,'ALAMEDA SAMPAIO','BOM RETIRO','CURITIBA','PR',17);
INSERT INTO ENDERECO VALUES(NULL,'RUA DA LAPA','LAPA','SAO PAULO','SP',18);
INSERT INTO ENDERECO VALUES(NULL,'RUA GERONIMO','CENTRO','RIO DE JANEIRO','RJ',19);
INSERT INTO ENDERECO VALUES(NULL,'RUA GOMES FREIRE','CENTRO','RIO DE JANEIRO','RJ',20);
INSERT INTO ENDERECO VALUES(NULL,'RUA GOMES FREIRE','CENTRO','RIO DE JANEIRO','RJ',21);

/* CADASTRE TELEFONES PARA OS CLIENTES */

INSERT INTO TELEFONE VALUES(NULL,'RES','68976565',9);
INSERT INTO TELEFONE VALUES(NULL,'CEL','99656675',9);
INSERT INTO TELEFONE VALUES(NULL,'CEL','33567765',11);
INSERT INTO TELEFONE VALUES(NULL,'CEL','88668786',11);
INSERT INTO TELEFONE VALUES(NULL,'COM','55689654',11);
INSERT INTO TELEFONE VALUES(NULL,'COM','88687979',12);
INSERT INTO TELEFONE VALUES(NULL,'COM','88965676',13);
INSERT INTO TELEFONE VALUES(NULL,'CEL','89966809',15);
INSERT INTO TELEFONE VALUES(NULL,'COM','88679978',16);
INSERT INTO TELEFONE VALUES(NULL,'CEL','99655768',17);
INSERT INTO TELEFONE VALUES(NULL,'RES','89955665',18);
INSERT INTO TELEFONE VALUES(NULL,'RES','77455786',19);
INSERT INTO TELEFONE VALUES(NULL,'RES','89766554',19);
INSERT INTO TELEFONE VALUES(NULL,'RES','77755785',20);
INSERT INTO TELEFONE VALUES(NULL,'COM','44522578',20);
INSERT INTO TELEFONE VALUES(NULL,'CEL','44522578',21);

/* RELATÓRIO GERAL DE TODOS OS CLIENTE */
SELECT 
	C.IDCLIENTE, 
	C.NOME, 
	C.SEXO, 
	C.EMAIL, 
	C.CPF,
	E.RUA, 
	E.BAIRRO, 
	E.CIDADE, 
	E.ESTADO,
	T.TIPO, 
	T.NUMERO
FROM CLIENTE C 
	INNER JOIN ENDERECO E
	ON C.IDCLIENTE = E.ID_CLIENTE
	INNER JOIN TELEFONE T
	ON C.IDCLIENTE = T.ID_CLIENTE
ORDER BY C.IDCLIENTE;

/* RELATÓRIO DE HOMENS */
SELECT 
	C.IDCLIENTE, 
	C.NOME, 
	C.SEXO, 
	C.EMAIL, 
	C.CPF,
	E.RUA, 
	E.BAIRRO, 
	E.CIDADE, 
	E.ESTADO,
	T.TIPO, 
	T.NUMERO
FROM CLIENTE C 
	INNER JOIN ENDERECO E
	ON C.IDCLIENTE = E.ID_CLIENTE
	INNER JOIN TELEFONE T
	ON C.IDCLIENTE = T.ID_CLIENTE
WHERE C.SEXO = 'M'
ORDER BY C.IDCLIENTE;

/* RELATÓRIOS DE MULHERES */
SELECT 
	C.IDCLIENTE, 
	C.NOME, 
	C.SEXO, 
	C.EMAIL, 
	C.CPF,
	E.RUA, 
	E.BAIRRO, 
	E.CIDADE, 
	E.ESTADO,
	T.TIPO, 
	T.NUMERO
FROM CLIENTE C 
	INNER JOIN ENDERECO E
	ON C.IDCLIENTE = E.ID_CLIENTE
	INNER JOIN TELEFONE T
	ON C.IDCLIENTE = T.ID_CLIENTE
WHERE C.SEXO = 'F'
ORDER BY C.IDCLIENTE;

/* 12, 13, 18, 19 */
SELECT * FROM CLIENTE
WHERE IDCLIENTE IN(12, 13, 18, 18);

UPDATE CLIENTE SET SEXO = 'F' 
WHERE IDCLIENTE IN(12, 13, 18, 18);

UPDATE CLIENTE SET SEXO = 'M'
WHERE IDCLIENTE = 13;

UPDATE CLIENTE SET SEXO = 'F'
WHERE IDCLIENTE = 13;

/* QUANTIDADE DE HOMENS E MULHERES */
SELECT SEXO, COUNT(*) AS QTD
FROM CLIENTE
GROUP BY SEXO;

/* IDS E EMAIL DAS MULHERES QUE MOREM NO CENTRO DO RIO DE JANEIRO E 
NAO TENHAM CELULAR */

SELECT 
	C.IDCLIENTE, 
	C.EMAIL, 
	C.NOME,
	E.BAIRRO, 
	E.CIDADE, 
	T.TIPO, 
	C.SEXO
FROM CLIENTE C
	INNER JOIN ENDERECO E
	ON C.IDCLIENTE = E.ID_CLIENTE
	INNER JOIN TELEFONE T
	ON C.IDCLIENTE = T.ID_CLIENTE
WHERE C.SEXO = 'F' 
	AND E.BAIRRO = 'CENTRO'
	AND E.CIDADE = 'RIO DE JANEIRO'
ORDER BY C.IDCLIENTE;

SELECT 
	C.IDCLIENTE, 
	C.EMAIL, 
	C.NOME,
	E.BAIRRO, 
	E.CIDADE, 
	T.TIPO, 
	C.SEXO
FROM CLIENTE C
	INNER JOIN ENDERECO E
	ON C.IDCLIENTE = E.ID_CLIENTE
	INNER JOIN TELEFONE T
	ON C.IDCLIENTE = T.ID_CLIENTE
WHERE C.SEXO = 'F' 
	AND E.BAIRRO = 'CENTRO'
	AND E.CIDADE = 'RIO DE JANEIRO'
	AND T.TIPO <> 'CEL'
ORDER BY C.IDCLIENTE;

SELECT 
	C.IDCLIENTE, 
	C.EMAIL,
FROM CLIENTE C
	INNER JOIN ENDERECO E
	ON C.IDCLIENTE = E.ID_CLIENTE
	INNER JOIN TELEFONE T
	ON C.IDCLIENTE = T.ID_CLIENTE
WHERE C.SEXO = 'F' 
	AND E.BAIRRO = 'CENTRO'
	AND E.CIDADE = 'RIO DE JANEIRO'
	AND T.TIPO <> 'CEL'
ORDER BY C.IDCLIENTE;

/* PARA UMA CAMPANHA DE MARKETING, O SETOR SOLICITOU UM
RELATÓRIO COM O NOME, EMAIL E TELEFONE CELULAR 
DOS CLIENTES QUE MORAM NO ESTADO DO RIO DE JANEIRO 
VOCÊ TERÁ QUE PASSAR A QUERY PARA GERAR O RELATORIO PARA
O PROGRAMADOR */

SELECT 
	C.NOME, 
	C.EMAIL, 
	T.NUMERO AS CELULAR, 
	E.ESTADO 
FROM CLIENTE C
	INNER JOIN TELEFONE T
	ON C.IDCLIENTE = T.ID_CLIENTE
	INNER JOIN ENDERECO E
	ON C.IDCLIENTE = E.ID_CLIENTE
WHERE ESTADO = 'RJ'
AND T.TIPO = 'CEL'
ORDER BY C.NOME;

SELECT 
	C.NOME, 
	C.EMAIL, 
	T.NUMERO AS CELULAR
FROM CLIENTE C
	INNER JOIN TELEFONE T
	ON C.IDCLIENTE = T.ID_CLIENTE
	INNER JOIN ENDERECO E
	ON C.IDCLIENTE = E.ID_CLIENTE
WHERE ESTADO = 'RJ'
AND T.TIPO = 'CEL'
ORDER BY C.NOME;

/* PARA UMA CAMPANHA DE PRODUTOS DE BELEZA, O COMERCIAL SOLICITOU UM
RELATÓRIO COM O NOME, EMAIL E TELEFONE CELULAR 
 DAS MULHERES QUE MORAM NO ESTADO DE SÃO PAULO 
VOCÊ TERÁ QUE PASSAR A QUERY PARA GERAR O RELATORIO PARA
O PROGRAMADOR */

SELECT 
	C.NOME, 
	C.EMAIL, 
	T.NUMERO AS CELULAR, 
	E.ESTADO, 
	C.SEXO
FROM CLIENTE C
	INNER JOIN ENDERECO E
	ON C.IDCLIENTE = E.ID_CLIENTE
	INNER JOIN TELEFONE T
	ON C.IDCLIENTE = T.ID_CLIENTE
WHERE E.ESTADO = 'SP'
AND C.SEXO = 'F';

SELECT 
	C.NOME, 
	C.EMAIL, 
	T.NUMERO AS CELULAR
FROM CLIENTE C
	INNER JOIN ENDERECO E
	ON C.IDCLIENTE = E.ID_CLIENTE
	INNER JOIN TELEFONE T
	ON C.IDCLIENTE = T.ID_CLIENTE
WHERE E.ESTADO = 'SP'
AND C.SEXO = 'F';

/* NOME, EMAIL, NUMERO, ESTADO */

SELECT 
	C.NOME, 
	IFNULL(C.EMAIL, 'NÃO TEM E-MAIL') AS 'E-MAIL', 
	T.NUMERO, 
	E.ESTADO
FROM CLIENTE C
	INNER JOIN ENDERECO E
	ON C.IDCLIENTE = E.ID_CLIENTE
	INNER JOIN TELEFONE T
	ON C.IDCLIENTE = T.ID_CLIENTE
ORDER BY C.NOME;

SELECT 
	C.NOME, 
	IFNULL(C.EMAIL, '**************') AS 'E-MAIL', 
	T.NUMERO, 
	E.ESTADO
FROM CLIENTE C
	INNER JOIN ENDERECO E
	ON C.IDCLIENTE = E.ID_CLIENTE
	INNER JOIN TELEFONE T
	ON C.IDCLIENTE = T.ID_CLIENTE
ORDER BY C.NOME;


CREATE VIEW RELATORIO AS 
SELECT 
	C.NOME,
	C.SEXO,
	C.EMAIL,
	T.TIPO,
	T.NUMERO,
	E.BAIRRO,
	E.CIDADE,
	E.ESTADO
FROM CLIENTE C
	INNER JOIN ENDERECO E
	ON C.IDCLIENTE = E.ID_CLIENTE
	INNER JOIN TELEFONE T
	ON C.IDCLIENTE = T.ID_CLIENTE
ORDER BY C.IDCLIENTE;

SELECT * FROM RELATORIO;

DROP VIEW V_RELATORIO;

CREATE VIEW V_RELATORIO AS 
SELECT 
	C.NOME,
	C.SEXO,
	IFNULL(C.EMAIL, 'NÃO TEM E-MAIL') AS "E-MAIL",
	T.TIPO,
	T.NUMERO,
	E.BAIRRO,
	E.CIDADE,
	E.ESTADO
FROM CLIENTE C
	INNER JOIN ENDERECO E
	ON C.IDCLIENTE = E.ID_CLIENTE
	INNER JOIN TELEFONE T
	ON C.IDCLIENTE = T.ID_CLIENTE;

INSERT INTO CLIENTE VALUES(NULL, 'Joca', 'M', NULL, '123');
INSERT INTO ENDERECO VALUES(NULL, 'BATATA', 'BATATA', 'BATATA', 'BT', 22);
INSERT INTO TELEFONE VALUES(NULL,'CEL','44522578',22);

SELECT 
	NOME, 
	NUMERO, 
	ESTADO
FROM V_RELATORIO;

ERROR 1394 (HY000): Can not insert into join view 'comercio.v_relatorio' without fields list
ERROR 1395 (HY000): Can not delete from join view 'comercio.v_relatorio'

UPDATE V_RELATORIO SET NOME = 'JOSE' WHERE NOME = 'JORGE';
UPDATE V_RELATORIO SET NUMERO = '12345678' WHERE NOME = 'CARLOS';

CREATE TABLE JOGADORES(
	IDJOGADOR INT,
	NOME VARCHAR(30),
	ESTADO CHAR(2)
);

INSERT INTO JOGADORES VALUES(1,'GUERRERO','RS');
INSERT INTO JOGADORES VALUES(2,'GABIGOL','RJ');
INSERT INTO JOGADORES VALUES(3,'GANSO','RJ');
INSERT INTO JOGADORES VALUES(4,'NENÊ', 'RJ');
INSERT INTO JOGADORES VALUES(5,'LOVE','SP');

CREATE VIEW V_JOGADORES AS
SELECT NOME, ESTADO
FROM JOGADORES;

SELECT * FROM V_JOGADORES;

DELETE FROM V_JOGADORES
WHERE NOME = 'GUERRERO';

INSERT INTO V_JOGADORES VALUES('GUERRERO','RS');

SELECT * FROM JOGADORES;

/* ORDER BY */

CREATE TABLE ALUNOS(
	NUMERO INT,
	NOME VARCHAR(30)
);

INSERT INTO ALUNOS VALUES(1,'JOAO');
INSERT INTO ALUNOS VALUES(1,'MARIA');
INSERT INTO ALUNOS VALUES(2,'ZOE');
INSERT INTO ALUNOS VALUES(2,'ANDRE');
INSERT INTO ALUNOS VALUES(3,'CLARA');
INSERT INTO ALUNOS VALUES(1,'CLARA');
INSERT INTO ALUNOS VALUES(4,'MAFRA');
INSERT INTO ALUNOS VALUES(5,'JANAINA');
INSERT INTO ALUNOS VALUES(1,'JANAINA');
INSERT INTO ALUNOS VALUES(3,'MARCELO');
INSERT INTO ALUNOS VALUES(4,'GIOVANI');
INSERT INTO ALUNOS VALUES(5,'ANTONIO');
INSERT INTO ALUNOS VALUES(6,'ANA');
INSERT INTO ALUNOS VALUES(6,'VIVIANE'); 

SELECT * FROM ALUNOS
ORDER BY NUMERO;

SELECT * FROM ALUNOS
ORDER BY 1, 2;

SELECT * FROM ALUNOS
ORDER BY 2;

/* ORDENANDO POR MAIS DE UMA COLUNA */

SELECT * FROM ALUNOS
ORDER BY 1;

SELECT * FROM ALUNOS
ORDER BY NUMERO, NOME;

SELECT * FROM ALUNOS
ORDER BY 1, 2;

/* MESCLANDO ORDER BY COM PROJECAO */

SELECT NOME FROM ALUNOS
ORDER BY 1, 2;

SELECT NOME FROM ALUNOS
ORDER BY NUMERO, NOME;

/* ORDER BY DESC / ASC */

SELECT * FROM ALUNOS
ORDER BY 1, 2;

SELECT * FROM ALUNOS
ORDER BY 1 ASC;

SELECT * FROM ALUNOS
ORDER BY 1 DESC;

SELECT * FROM ALUNOS
ORDER BY 1, 2 DESC;

SELECT * FROM ALUNOS
ORDER BY 1 DESC, 2 DESC;

/* ORDENANDO COM JOINS */

SELECT  C.NOME, 
		C.SEXO, 
		IFNULL(C.EMAIL,'CLIENTE SEM EMAIL') AS "E-MAIL", 
		T.TIPO, 
		T.NUMERO, 
		E.BAIRRO, 
		E.CIDADE, 
		E.ESTADO
FROM CLIENTE C 
INNER JOIN TELEFONE T 
ON C.IDCLIENTE = T.ID_CLIENTE 
INNER JOIN ENDERECO E 
ON C.IDCLIENTE = E.ID_CLIENTE
ORDER BY 1;

SHOW TABLES;

SELECT * FROM V_RELATORIO
ORDER BY 1;

SELECT * FROM CLIENTE
ORDER BY 1, 2;

DELIMITER $

SELECT * FROM CLIENTE
ORDER BY 1, 2$

DELIMITER ;

DELIMITER $

CREATE PROCEDURE NOME_EMPRESA()
BEGIN

	SELECT 'UNIVERSIDADE DOS DADOS' AS EMPRESA;

END
$

CALL NOME_EMPRESA()$

DELIMITER ;

CALL NOME_EMPRESA();

DELIMITER $

CREATE PROCEDURE CONTA()
BEGIN

	SELECT 10 + 10 AS CONTA;

END
$

CALL CONTA()$

DELIMITER ;

DROP PROCEDURE CONTA;

DELIMITER $

CREATE PROCEDURE CONTA(NUMERO1 INT, NUMERO2 INT)
BEGIN

	SELECT NUMERO1 + NUMERO2 AS CONTA;

END
$

DELIMITER ;

CALL CONTA(100, 80);

/* PROCEDURES */

CREATE DATABASE PROJETO;

USE PROJETO;

CREATE TABLE CURSOS(
	ID_CURSO INT PRIMARY KEY AUTO_INCREMENT,
	NOME VARCHAR(30) NOT NULL,
	HORAS INT(3) NOT NULL,
	VALOR FLOAT(10,2) NOT NULL
);

INSERT INTO CURSOS VALUES(NULL,'Python',200,550.20);
INSERT INTO CURSOS VALUES(NULL,'Java',40,340.00);
INSERT INTO CURSOS VALUES(NULL,'C#',90,890.99);

SELECT * FROM CURSOS;

CREATE VIEW V_CURSOS AS SELECT * FROM CURSOS; 

INSERT INTO V_CURSOS VALUES(NULL,'PHP',999,1000.00);

DELIMITER #

STATUS

CREATE PROCEDURE CAD_CURSO(P_NOME VARCHAR(30),
						   P_HORAS INT(3),
						   P_PRECO FLOAT(10,2))
BEGIN
	INSERT INTO CURSOS VALUES(NULL,P_NOME,P_HORAS,P_PRECO);
END
#

DELIMITER ;

CALL CAD_CURSO('BI SQL SERVER',35,3000.00);
CALL CAD_CURSO('POWER BI',50,1000.00);
CALL CAD_CURSO('PORTUGAL',10,9000.00);

DELIMITER #

CREATE PROCEDURE SHOW_CURSOS()
BEGIN
	SELECT NOME,HORAS,VALOR FROM CURSOS;
END
#

DELIMITER ;

CALL SHOW_CURSOS();

/* FUNÇÕES DE AGREGAÇÕES NÚMERICAS */

CREATE TABLE VENDEDORES(
	ID_VENDEDOR INT PRIMARY KEY AUTO_INCREMENT,
	NOME VARCHAR(30),
	SEXO ENUM('M','F'),
	JANEIRO FLOAT(10,2),
	FEVEREIRO FLOAT(10,2),
	MARCO FLOAT(10,2)
);

INSERT INTO VENDEDORES VALUES(NULL,'CARLOS','M',4334.33,32324.32,3323.23);
INSERT INTO VENDEDORES VALUES(NULL,'FABIO','M',1364.36,57324.39,4223.99);
INSERT INTO VENDEDORES VALUES(NULL,'MARIA','F',8334.33,3242.332,3233.23);
INSERT INTO VENDEDORES VALUES(NULL,'FABIANA','F',3432.33,8732.32,8758.23);
INSERT INTO VENDEDORES VALUES(NULL,'ANA','F',5633.33,1234.32,6546.23);
INSERT INTO VENDEDORES VALUES(NULL,'BRYAN','M',9723.33,2354.32,24857.23);
INSERT INTO VENDEDORES VALUES(NULL,'JENIFFER','F',9863.33,7753.32,8765.23);
INSERT INTO VENDEDORES VALUES(NULL,'BRENDA','F',1132.33,3634.32,89264.23);

/* MAX - TRAZ O VALOR MAXIMO DE UMA COLUNA */

SELECT MAX(FEVEREIRO) AS MAIOR_FEV FROM VENDEDORES;

/* MIN - TRAZ O VALOR MINIMO DE UMA COLUNA */
SELECT MIN(FEVEREIRO) AS MENOR_FEV FROM VENDEDORES;

/* AVG - TRAZ A MÉDIA */
SELECT AVG(FEVEREIRO) AS MEDIA_FEV FROM VENDEDORES;

/* VÁRIAS FUNÇÕES */
SELECT 
	MAX(JANEIRO) AS MAX_JAN,
	MIN(JANEIRO) AS MIN_JAN,
	TRUNCATE(AVG(JANEIRO),2) AS MEDIA_JAN
FROM VENDEDORES;

/* SUM - SOMA OS VALORES DE UMA COLUNA */
SELECT 
	SUM(JANEIRO) AS TOTAL_JAN,
	SUM(FEVEREIRO) AS TOTAL_FEV,
	SUM(MARCO) AS TOTAL_MAR
FROM VENDEDORES;

SELECT 
	SEXO,
	SUM(MARCO) AS VALOR
FROM VENDEDORES GROUP BY SEXO;

/* SUBQUERIES */

SELECT NOME, MARCO AS VALOR FROM VENDEDORES
WHERE MARCO = (SELECT MIN(MARCO) FROM VENDEDORES);

SELECT NOME, MARCO AS VALOR FROM VENDEDORES
WHERE MARCO = (SELECT MAX(MARCO) FROM VENDEDORES);

SELECT NOME, MARCO AS VALOR FROM VENDEDORES
WHERE MARCO > (SELECT MAX(MARCO) FROM VENDEDORES);

SELECT NOME, FEVEREIRO AS VALOR FROM VENDEDORES
WHERE FEVEREIRO > (SELECT AVG(FEVEREIRO) FROM VENDEDORES);

SELECT NOME, FEVEREIRO AS VALOR FROM VENDEDORES
WHERE FEVEREIRO < (SELECT AVG(FEVEREIRO) FROM VENDEDORES);

/* OPERAÇÕES EM LINHAS */

SELECT * FROM VENDEDORES;

SELECT 
	NOME,
	JANEIRO,
	FEVEREIRO,
	MARCO,
	(JANEIRO+FEVEREIRO+MARCO) AS "TOTAL",
	TRUNCATE((JANEIRO+FEVEREIRO+MARCO)/3,2) AS "MEDIA"
FROM VENDEDORES;

SELECT 
	NOME,
	JANEIRO,
	FEVEREIRO,
	MARCO,
	(JANEIRO+FEVEREIRO+MARCO) AS "TOTAL",
	((JANEIRO+FEVEREIRO+MARCO)*.25) AS "DESCONTO",
	TRUNCATE((JANEIRO+FEVEREIRO+MARCO)/3,2) AS "MEDIA"
FROM VENDEDORES;

/* MODIFICANDO TABELAS */

CREATE TABLE TABELA(
	COLUNA1 VARCHAR(30),
	COLUNA2 VARCHAR(30),
	COLUNA3 VARCHAR(30)
);

-- ADICIONANDO UMA PK
ALTER TABLE TABELA ADD ID INT PRIMARY KEY AUTO_INCREMENT;

-- ADICIONANDO UMA COLUNA SEM POSIÇÃO
ALTER TABLE TABELA ADD COLUNA VARCHAR(30);

-- ADICIONANDO UMA COLUNA COM POSIÇÃO
ALTER TABLE TABELA ADD COLUNA4 VARCHAR(30) NOT NULL UNIQUE AFTER COLUNA1;

/* MODIFICANDO CAMPOS */
ALTER TABLE TABELA MODIFY COLUNA4 DATE NOT NULL;

/* RENOMEANDO O NOME DA TABELA */
ALTER TABLE TABELA RENAME PESSOA;

CREATE TABLE TIME(
	ID_TIME INT PRIMARY KEY AUTO_INCREMENT,
	TIME VARCHAR(30),
	ID_PESSOA INT NOT NULL
);

ALTER TABLE TIME ADD FOREIGN KEY(ID_PESSOA) REFERENCES PESSOA(ID);

/* VERIFICAR AS CHAVES */
SHOW CREATE TABLE PESSOA;

/* REMOVENDO CHAVE ESTRANGEIRA */
ALTER TABLE `TIME` DROP FOREIGN KEY time_ibfk_1; 


/* ORGANIZAÇÃO DE CHAVES(CONSTRAINTS) E ACÕES DE CONSTRAINTS - PARTE 1 */

CREATE TABLE jogador(
	id_jogador INT PRIMARY KEY AUTO_INCREMENT,
	nome_jogador VARCHAR(255) NOT NULL
);

CREATE TABLE times(
	id_time INT PRIMARY KEY AUTO_INCREMENT,
	nome_time VARCHAR(255) NOT NULL,
	id_jogador INT NOT NULL,
	FOREIGN KEY(id_jogador) REFERENCES jogador(id_jogador)
);

INSERT INTO jogador(nome_jogador) VALUES('guerrero');
INSERT INTO times(nome_time, id_jogador) VALUES('flamengo', 1);

SHOW CREATE TABLE jogador;
SHOW CREATE TABLE times;

/* ORGANIZAÇÃO DE CHAVES(CONSTRAINTS) E ACÕES DE CONSTRAINTS -PARTE 2 */

CREATE TABLE cliente(
	id_cliente INT,
	nome VARCHAR(255) NOT NULL
);

CREATE TABLE telefone(
	id_telefone INT,
	tipo CHAR(3) NOT NULL,
	numero varchar(10),
	id_cliente INT NOT NULL
);

ALTER TABLE cliente ADD CONSTRAINT pk_cliente 
PRIMARY KEY(id_cliente);

ALTER TABLE telefone ADD CONSTRAINT pk_telefone 
PRIMARY KEY(id_telefone);

ALTER TABLE telefone ADD CONSTRAINT fk_cliente_telefone
FOREIGN KEY(id_cliente) REFERENCES cliente(id_cliente);

SHOW CREATE TABLE telefone;

/* DICIONARIO DE DADOS - GUARDA UM META DADO */

USE information_schema;

STATUS;

SHOW TABLES;

DESC TABLE_CONSTRAINTS;

SELECT CONSTRAINT_SCHEMA AS "BANCO",
	   TABLE_NAME AS "NOME",
	   CONSTRAINT_NAME AS "REGRA_NOME",
	   CONSTRAINT_TYPE AS "TIPO"
FROM TABLE_CONSTRAINTS
WHERE CONSTRAINT_SCHEMA = 'teste';


USE teste;

ALTER TABLE telefone
DROP FOREIGN KEY fk_cliente_telefone;


/* SISTEMA DO SEU JOSÉ */

CREATE DATABASE projeto;
USE projeto;

/*  TABELAS */
CREATE TABLE cliente(
	id_cliente INT PRIMARY KEY AUTO_INCREMENT,
	nome VARCHAR(50) NOT NULL,
	sexo ENUM("M", "F") NOT NULL
);

CREATE TABLE telefone(
	id_telefone INT PRIMARY KEY AUTO_INCREMENT,
	tipo ENUM("RES", "COM", "CEL") NOT NULL,
	numero VARCHAR(14) NOT NULL,
	id_cliente INT
);

CREATE TABLE carro(
	id_carro INT PRIMARY KEY AUTO_INCREMENT,
	nome VARCHAR(50) NOT NULL,
	marca VARCHAR(25) NOT NULL,
	ano CHAR(4) NOT NULL,
	cor VARCHAR(25) NOT NULL,
	id_cliente INT UNIQUE NOT NULL
);

CREATE TABLE servico(
	id_servico INT PRIMARY KEY AUTO_INCREMENT,
	preco FLOAT(10, 2) NOT NULL,
	entrada DATE NOT NULL,
	saida DATE NOT NULL,
	problema_apresentado TEXT NOT NULL,
	resultado_final TEXT NOT NULL,
	id_carro INT NOT NULL
);

SHOW TABLES;

/* CONSTRAINTS */

ALTER TABLE telefone ADD CONSTRAINT fk_cliente_telefone
FOREIGN KEY(id_cliente) REFERENCES cliente(id_cliente);

ALTER TABLE carro ADD CONSTRAINT fk_cliente_carro
FOREIGN KEY(id_cliente) REFERENCES cliente(id_cliente);

ALTER TABLE servico ADD CONSTRAINT fk_carro_servico
FOREIGN KEY(id_carro) REFERENCES carro(id_carro);

/* DADOS */

INSERT INTO cliente VALUES(NULL, 'joao', 'M');
INSERT INTO cliente VALUES(NULL, 'igor', 'M');
INSERT INTO cliente VALUES(NULL, 'maria', 'F');
INSERT INTO cliente VALUES(NULL, 'gustavo', 'M');
INSERT INTO cliente VALUES(NULL, 'fabiana', 'F');
INSERT INTO cliente VALUES(NULL, 'heloisa', 'F');
INSERT INTO cliente VALUES(NULL, 'marcos', 'M');
INSERT INTO cliente VALUES(NULL, 'josé', 'M');
INSERT INTO cliente VALUES(NULL, 'helem', 'F');
INSERT INTO cliente VALUES(NULL, 'thiago', 'M');

INSERT INTO telefone VALUES(NULL, 'RES', '123', 1);
INSERT INTO telefone VALUES(NULL, 'RES', '123', 8);
INSERT INTO telefone VALUES(NULL, 'RES', '123', 3);
INSERT INTO telefone VALUES(NULL, 'RES', '123', 5);
INSERT INTO telefone VALUES(NULL, 'RES', '123', 5);
INSERT INTO telefone VALUES(NULL, 'RES', '123', 7);
INSERT INTO telefone VALUES(NULL, 'RES', '123', 9);

INSERT INTO carro VALUES(NULL, 'compass', 'jeep', 2017, 'branco', 1);
INSERT INTO carro VALUES(NULL, 'gol bola', 'volksvagem', 2002, 'preto', 2);
INSERT INTO carro VALUES(NULL, 'gol quadrado', 'volksvagem', 2004, 'azul', 3);
INSERT INTO carro VALUES(NULL, 'camaro', 'chevrolet', 2012, 'amarelo', 4);
INSERT INTO carro VALUES(NULL, 'corsa', 'chevrolet', 1999, 'rosa', 5);
INSERT INTO carro VALUES(NULL, 'amarok', 'volksvagem', 2015, 'verde', 6);
INSERT INTO carro VALUES(NULL, 'classic', 'chevrolet', 2007, 'cinza', 7);
INSERT INTO carro VALUES(NULL, 'renegada', 'jeep', 2022, 'preto', 8);
INSERT INTO carro VALUES(NULL, 'r8 v10 plus', 'audi', 2016, 'cinza', 9);
INSERT INTO carro VALUES(NULL, 'f8 spider', 'ferrari', 2019, 'vermelha', 10);

INSERT INTO servico VALUES(
	NULL, 
	850.00, 
	'2022-03-19', 
	'2022-04-22', 
	'arranhao na lateral', 
	'foi passado um spray da mesma cor do carro, ficou novinho em folha',
	1
);

INSERT INTO servico VALUES(
	NULL, 
	120.99, 
	'2021-03-19', 
	'2021-05-29',
	'motor trincado', 
	'foi colado uma fita durex na rachadura do motor, ficou em bom estado',
	2
);

INSERT INTO servico VALUES(
	NULL, 
	350.00, 
	'2021-03-19', 
	'2021-05-29',
	'motor trincado', 
	'foi colado uma fita durex na rachadura do motor, ficou em bom estado',
	3
);

INSERT INTO servico VALUES(
	NULL, 
	350.00, 
	'2021-03-19', 
	'2021-05-29',
	'motor trincado', 
	'foi colado uma fita durex na rachadura do motor, ficou em bom estado',
	4
);

INSERT INTO servico VALUES(
	NULL, 
	350.00, 
	'2021-03-19', 
	'2021-05-29',
	'motor trincado', 
	'foi colado uma fita durex na rachadura do motor, ficou em bom estado',
	5
);

INSERT INTO servico VALUES(
	NULL, 
	350.00, 
	'2021-03-19', 
	'2021-05-29',
	'motor trincado', 
	'foi colado uma fita durex na rachadura do motor, ficou em bom estado',
	6
);

INSERT INTO servico VALUES(
	NULL, 
	350.00, 
	'2021-03-19', 
	'2021-05-29',
	'motor trincado', 
	'foi colado uma fita durex na rachadura do motor, ficou em bom estado',
	7
);

INSERT INTO servico VALUES(
	NULL, 
	350.00, 
	'2021-03-19', 
	'2021-05-29',
	'motor trincado', 
	'foi colado uma fita durex na rachadura do motor, ficou em bom estado',
	8
);

INSERT INTO servico VALUES(
	NULL, 
	350.00, 
	'2021-03-19', 
	'2021-05-29',
	'motor trincado', 
	'foi colado uma fita durex na rachadura do motor, ficou em bom estado',
	9
);

INSERT INTO servico VALUES(
	NULL, 
	350.00, 
	'2021-03-19', 
	'2021-05-29',
	'motor trincado', 
	'foi colado uma fita durex na rachadura do motor, ficou em bom estado',
	10
);


/* TRIGGERS */

CREATE TRIGGER NOME
BEFORE/AFTER INSERT/DELETE/UPDATE ON TABELA
FOR EACH ROW (PARA CADA LINHA)
BEGIN -> INICIO

	QUALQUER COMANDO SQL

END -> FIM

CREATE DATABASE aula40;

USE aula40;

CREATE TABLE usuario(
	id_usuario INT PRIMARY KEY AUTO_INCREMENT,
	nome VARCHAR(30) NOT NULL,
	login VARCHAR(30) NOT NULL,
	senha VARCHAR(100) NOT NULL
);

CREATE TABLE bkp_usuario(
	id_backup INT PRIMARY KEY AUTO_INCREMENT,
	id_usuario INT NOT NULL,
	nome VARCHAR(30) NOT NULL,
	login VARCHAR(30) NOT NULL
);

DELIMITER $

CREATE TRIGGER bkp_usuario
BEFORE DELETE ON usuario
FOR EACH ROW
BEGIN
	INSERT INTO bkp_usuario VALUES(NULL, 
								   OLD.id_usuario, 
								   OLD.nome, 
								   OLD.login);
END
$

DELIMITER ;

INSERT INTO usuario VALUES(NULL, "andrade", "andrade2009", 'hexacampeão');

SELECT * FROM usuario;

DELETE FROM usuario WHERE id_usuario = 1;

SELECT * FROM bkp_usuario;

/* CONEXÃO ENTRE BANCO DE DADOS */

CREATE DATABASE loja;

USE loja;

CREATE TABLE produto(
	id_produto INT PRIMARY KEY AUTO_INCREMENT,
	nome VARCHAR(30) NOT NULL,
	valor FLOAT(10,2) NOT NULL
);

CREATE DATABASE bkp_loja;

USE bkp_loja;

CREATE TABLE bkp_produto(
	id_bkp INT PRIMARY KEY AUTO_INCREMENT,
	id_produto INT,
	nome VARCHAR(30) NOT NULL,
	valor FLOAT(10,2) NOT NULL
);

USE loja;

INSERT bkp_loja.bkp_produto VALUES(NULL, 1000, 'teste', 0.0);

SELECT * FROM bkp_loja.bkp_produto;

DELIMITER $

CREATE TRIGGER bkp_loja_produdo 
AFTER INSERT ON produto
FOR EACH ROW 
BEGIN
	INSERT INTO bkp_loja.bkp_produto VALUES(NULL, 
										    NEW.id_produto, 
											NEW.nome, 
											NEW.valor);
END
$

DELIMITER ;

INSERT INTO produto VALUES(NULL, 'livro modelagem', 50.00);
INSERT INTO produto VALUES(NULL, 'livro oracle', 70.00);
INSERT INTO produto VALUES(NULL, 'livro bi', 90.00);
INSERT INTO produto VALUES(NULL, 'livro sql server', 110.00);

SELECT * FROM bkp_loja.bkp_produto;

DELIMITER $

CREATE TRIGGER bkp_loja_produdo_del
BEFORE DELETE ON produto
FOR EACH ROW 
BEGIN
	INSERT INTO bkp_loja.bkp_produto VALUES(NULL, 
										    OLD.id_produto, 
											OLD.nome, 
											OLD.valor);
END
$

DELIMITER ;

DELETE FROM produto WHERE id_produto = '6';

SELECT * FROM produto

SELECT * FROM bkp_loja.bkp_produto;

DROP TRIGGER bkp_loja_produdo;

DROP TRIGGER bkp_loja_produdo_del;

DROP DATABASE loja;

DROP DATABASE bkp_loja;

CREATE DATABASE loja;

USE loja;

CREATE TABLE produto(
	id_produto INT PRIMARY KEY AUTO_INCREMENT,
	nome VARCHAR(30) NOT NULL,
	valor FLOAT(10,2) NOT NULL
);

CREATE DATABASE bkp_loja;

USE bkp_loja;

CREATE TABLE bkp_produto(
	id_bkp INT PRIMARY KEY AUTO_INCREMENT,
	id_produto INT,
	nome VARCHAR(30) NOT NULL,
	valor FLOAT(10,2) NOT NULL
);

USE loja;

ALTER TABLE bkp_loja.bkp_produto ADD
EVENTO CHAR(1) NOT NULL;

ALTER TABLE bkp_loja.bkp_produto MODIFY
id_produto INT NOT NULL;

DESC bkp_loja.bkp_produto;

DELIMITER $

CREATE TRIGGER bkp_loja_produdo 
AFTER INSERT ON produto
FOR EACH ROW 
BEGIN
	INSERT INTO bkp_loja.bkp_produto VALUES(NULL, 
										    NEW.id_produto, 
											NEW.nome, 
											NEW.valor,
											'I');
END
$

DELIMITER ;

INSERT INTO produto VALUES(NULL, 'livro modelagem', 50.00);
INSERT INTO produto VALUES(NULL, 'livro oracle', 70.00);
INSERT INTO produto VALUES(NULL, 'livro bi', 90.00);
INSERT INTO produto VALUES(NULL, 'livro sql server', 110.00);

SELECT * FROM produto;

SELECT * FROM bkp_loja.bkp_produto;

DELIMITER $

CREATE TRIGGER bkp_loja_produdo_del
BEFORE DELETE ON produto
FOR EACH ROW 
BEGIN
	INSERT INTO bkp_loja.bkp_produto VALUES(NULL, 
										    OLD.id_produto, 
											OLD.nome, 
											OLD.valor,
											'D');
END
$

DELIMITER ;

DELETE FROM produto
WHERE id_produto = '1' OR 
      id_produto = '3';
	  

SELECT * FROM produto;

SELECT * FROM bkp_loja.bkp_produto;

/* A 42 TRIGGER DE AUDITORIA */

DELIMITER ;

DROP DATABASE loja;

DROP DATABASE bkp_loja;

CREATE DATABASE loja;

USE loja;

CREATE TABLE produto(
	id_produto INT PRIMARY KEY AUTO_INCREMENT,
	nome VARCHAR(30) NOT NULL,
	valor FLOAT(10,2) NOT NULL
);

INSERT INTO produto VALUES(NULL, 'livro modelagem', 50.00);
INSERT INTO produto VALUES(NULL, 'livro oracle', 70.00);
INSERT INTO produto VALUES(NULL, 'livro bi', 90.00);
INSERT INTO produto VALUES(NULL, 'livro sql server', 110.00);

CREATE DATABASE `backup`;

USE `backup`;

CREATE TABLE bkp_produto(
	id_backup INT PRIMARY KEY AUTO_INCREMENT,
	id_produto INT NOT NULL,
	nome VARCHAR(30) NOT NULL,
	valor_original FLOAT(10,2) NOT NULL,
	valor_alterado FLOAT(10,2) NOT NULL,
	`DATA` DATETIME NOT NULL,
	usuario VARCHAR(30) NOT NULL,
	evento CHAR(1) NOT NULL
);

ALTER TABLE bkp_produto CHANGE
id_backuap id_backup INT NOT NULL AUTO_INCREMENT;

ALTER TABLE bkp_produto ADD
id_produto INT NOT NULL AFTER id_backup;

SELECT NOW() AS agora;

SELECT CURRENT_USER() AS usuario;

USE loja;

SELECT * FROM produto;

DELIMITER $

CREATE TRIGGER audit_prod
AFTER UPDATE ON produto
FOR EACH ROW
BEGIN
	INSERT INTO `backup`.bkp_produto VALUES(NULL,
	                                        OLD.id_produto,
											OLD.nome,
											OLD.valor,
											NEW.valor,
											NOW(),
											CURRENT_USER(),
											'U');
END
$

DELIMITER ;

UPDATE produto SET valor = 110.00
WHERE id_produto = '4';

UPDATE produto SET valor = 65.00
WHERE id_produto = '3';

SELECT * FROM produto;

SELECT * FROM `backup`.bkp_produto;

/* AUTORELACIONAMENTO */

CREATE TABLE cursos(
	id_curso INT PRIMARY KEY AUTO_INCREMENT,
	nome VARCHAR(30) NOT NULL,
	horas INT NOT NULL,
	valor FLOAT(10, 2) NOT NULL,
	id_prereq INT
);

ALTER TABLE cursos ADD CONSTRAINT fk_prereq_cursos
FOREIGN KEY(id_prereq) REFERENCES cursos(id_cursos);

INSERT INTO cursos VALUES(NULL,
				   'BD RELACIONAL',
				   20,
				   400.00,
				   NULL);
				   
				   
INSERT INTO cursos VALUES(NULL,
				   'BUSSINES INTELIGENCE',
				   40,
				   800.00,
				   1);

INSERT INTO cursos VALUES(NULL,
				    'RELATÓRIOS AVANÇADOS',
				    20,
				    600.00,
				    2);
				    
INSERT INTO cursos VALUES(NULL,
				    'LÓGICA DE PROGRAMAÇÃO',
				    10,
				    200.00,
				    NULL);
				   
INSERT INTO cursos VALUES(NULL,
				   'RUBY',
				   30,
				   150.00,
				   4);

SELECT * FROM cursos;

SELECT nome, 
	   valor, 
	   horas, 
	   IFNULL(id_prereq, 'SEM REQ')
FROM cursos;


SELECT c.nome AS curso, 
	   c.valor AS valor,  
	   c.horas AS carga, 
	   IFNULL(p.nome, '---') AS prereq
FROM cursos c
LEFT JOIN cursos p
ON p.id_curso = c.id_prereq;

/* CURSORES - É UM VETOR, ONDE É ARMAZENADO OS OBJETOS, NO QUAL 
PODEMOS ACESSAR OS CAMPOS DO MESMO. CONFORME AS OPERAÇÕES DE UM DETERMINADO OBJETO
DO CURSOR É FINALIZADA O ESPAÇO RESERVADO PARA TAL REGISTRO NA MEMÓRIA É LIBERADO E PULAMOS 
PARA A PROXIMA OCORRÊNCIA. QUANDO AS OPERAÇÕES DO ÚLTIMO É FINALIZADA O SGBD IRÁ MATAR 
O LOOP NO QUAL ITERA SOBRE O CURSOR. */

CREATE DATABASE cursores;
USE cursores;

CREATE TABLE vendedor(
	id_vendedor INT PRIMARY KEY AUTO_INCREMENT,
	nome VARCHAR(50) NOT NULL,
	jan INT NOT NULL,
	fev INT NOT NULL,
	mar INT NOT NULL
);

INSERT INTO vendedor VALUES
	(NULL, 'MAFRA', 23232, 32332, 3232),
	(NULL, 'JOAO', 45353, 124534, 32343),
	(NULL, 'GABRIEL', 32564, 21214, 98932),
	(NULL, 'YAGO', 47643, 21436, 86765),
	(NULL, 'BIANCA', 76464, 21343, 87974),
	(NULL, 'CAMILA', 65367, 21434, 99723),
	(NULL, 'CIGANA', 65465, 32434, 95628);
	
SELECT * FROM vendedor;

SELECT nome AS 'NOME',
	   mar AS 'TOTAL MARÇO'
FROM vendedor
WHERE mar = (SELECT MIN(mar) FROM vendedor);

SELECT nome AS 'NOME',
	   mar AS 'TOTAL MARÇO'
FROM vendedor
WHERE mar = (SELECT MAX(mar) FROM vendedor);

SELECT nome,
	   (jan+fev+mar) AS total
FROM vendedor;

SELECT nome AS 'VENDEDOR',
	   (jan+fev+mar) AS 'TOTAL',
	   TRUNCATE((jan+fev+mar)/3, 2) AS 'MÉDIA'
FROM vendedor
ORDER BY 2 DESC;

CREATE TABLE vend_total(
	nome VARCHAR(50) NOT NULL,
	jan INT NOT NULL,
	fev INT NOT NULL,
	mar INT NOT NULL,
	total INT NOT NULL,
	media INT NOT NULL
);

DELIMITER $

CREATE PROCEDURE insere_dados()
BEGIN
	DECLARE fim INT DEFAULT 0;
	DECLARE var1, var2, var3, vtotal, vmedia INT;
	DECLARE vnome VARCHAR(50);
	
	DECLARE reg CURSOR FOR(
		SELECT nome,
			   jan,
			   fev,
			   mar
	    FROM vendedor
	);
	
	DECLARE CONTINUE HANDLER FOR NOT FOUND SET fim = 1;
	
	OPEN reg;
	
	REPEAT
		FETCH reg INTO vnome, var1, var2, var3;
		IF NOT fim THEN
			SET vtotal = var1 + var2 + var3;
			SET vmedia = vtotal / 3;
			
			INSERT INTO vend_total VALUES(vnome, var1, var2, var3, vtotal, vmedia);
		END IF;
	UNTIL fim END REPEAT;
	
	CLOSE reg;
END		
$

DELIMITER ;

SELECT * FROM vendedor;

SELECT * FROM vend_total;

CALL insere_dados();


/* FORMAS NORMAIS 

	1FN - UM CAMPO NÃO PODE SER DIVISIVEL NEM VETORIZADO E PRECISA
	TER UM CAMPO QUE IDENTIFIQUE OS DEMAIS(CHAVE PRIMARIA);
	
	2FN - TODOS CAMPOS NÃO CHAVES DEVEM DEPENDER DA TOTALIDADE DOM CAMPOS 
	ASSOCIATIVOS(SÃO CHAVES QUE ASSOCIAM AS TEBELAS DOS RELACIONAMENTOS);
	
	3FN - NENHUM CAMPO NÃO CHAVE PODE DEPENDER DE OUTRO CAMPO NÃO CHAVE.
*/



/* PRATICANDO AS FORMAS NORMAIS */

CREATE DATABASE consultorio;

USE consultorio;

CREATE TABLE paciente(
	id_paciente INT PRIMARY KEY AUTO_INCREMENT,
	nome VARCHAR(30) NOT NULL,
	sexo CHAR(1) NOT NULL,
	email VARCHAR(30) NOT NULL,
	nascimento DATE NOT NULL
);

CREATE TABLE medico(
	id_medico INT PRIMARY KEY AUTO_INCREMENT,
	nome VARCHAR(30) NOT NULL,
	sexo CHAR(1) NOT NULL,
	especialidade VARCHAR(30) NOT NULL,
	funcionario ENUM('S', 'N') NOT NULL
);

CREATE TABLE hospital(
	id_hospital INT PRIMARY KEY AUTO_INCREMENT,
	nome VARCHAR(30) NOT NULL,
	bairro VARCHAR(30) NOT NULL,
	cidade VARCHAR(30) NOT NULL,
	estado CHAR(2) NOT NULL
);

CREATE TABLE consulta(
	id_consulta INT PRIMARY KEY AUTO_INCREMENT,
	id_paciente INT NOT NULL,
	id_medico INT NOT NULL,
	id_hospital INT NOT NULL,
	date DATETIME NOT NULL,
	diagnostico VARCHAR(50) NOT NULL
);

CREATE TABLE internacao(
	id_internacao INT PRIMARY KEY AUTO_INCREMENT,
	entrada DATETIME NOT NULL,
	saida DATETIME NOT NULL,
	quarto INT NOT NULL,
	observacoes VARCHAR(50) NOT NULL,
	id_consulta INT NOT NULL UNIQUE
);

ALTER TABLE consulta ADD CONSTRAINT fk_consulta_paciente
FOREIGN KEY(id_paciente) REFERENCES paciente(id_paciente);

ALTER TABLE consulta ADD CONSTRAINT fk_consulta_medico
FOREIGN KEY(id_medico) REFERENCES medico(id_medico);

ALTER TABLE consulta ADD CONSTRAINT fk_consulta_hospital
FOREIGN KEY(id_hospital) REFERENCES hospital(id_hospital);

SHOW CREATE TABLE consulta;

ALTER TABLE internacao ADD CONSTRAINT fk_internacao_consulta
FOREIGN KEY(id_consulta) REFERENCES consulta(id_consulta);

SHOW CREATE TABLE internacao;

DESC information_schema.table_constraints;

SELECT constraint_name,
	   table_name,
	   constraint_type
FROM information_schema.table_constraints;

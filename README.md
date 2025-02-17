# SQLServer
Repositório destinado a conteúdos e Scripts de SQLServer.

## Introdução a Linguagem TSQL
A linguagem Transaction SQL é uma extensão da linguagem SQL e é de propriedade da Microsoft para acesso ao banco SQLServer e outros que o suportam. 

Além dos comando SQL ANSI possui algumas outras características como:
*	Controle de fluxo;
*	Declaração de blocos em lote;
*	Declarações de variáveis;
*	Funções de manipulação de dados como strings, datas e outros.

### * Definindo Estrutura de Armazenamento de Dados
Em um sistema gerenciador de banco de dados baseado no modelo relacional as informações são armazenadas em estruturas chamadas Tabela. Uma tabela poderá possuir diversos recursos como: índices, gatilhos, constraints e etc. A seguir veremos o comando de definição de Tabela.


#### Tipos de Dados
O SQLServer possui um conjunto bem maior de tipos de dados. Com isso poderá ser utilizado um tipo especificamente para uma necessidade. Para consultar todos os tipos de dados do SQLServer poderá ser acessado o link: http://msdn.microsoft.com/pt-br/library/ms187752.aspx

#### CreateTable
Tabelas são os legítimos repositórios de dados de um banco de dados. Sua estrutura é definida como a de uma tabela do Modelo Relacional.

Exemplo:
~~~ sql
CREATE TABLE CLIENTE
(
  CODIGO 	INTEGER NOT NULL,
  NOME 		VARCHAR(50),
  NASCIMENTO	DATE,
  SEXO		CHAR(1) NOT NULL,
  RENDAMENSAL 	DECIMAL(15,2)
)
~~~

#### Coluna Identity
O SQLServer possui uma característica a colunas do tipo inteiro que permite que seja gerado um valor automaticamente. A coluna não poderá receber valor.

Exemplo:
~~~ sql
CREATE TABLE CLIENTE
(
  CODIGO INTEGER IDENTITY(1,5),
  NOME VARCHAR(50)
)
~~~
Onde:	1 é o valor que a numeração deverá iniciar.
5 é o número que define a cada inserção feita na tabela.



### * Manipulando Dados
Visto que o repositório está definido poderá ser utilizado para armazenamento de dados e outras manipulações. Abaixo tempos alguns comandos de Manipulação de Dados.

#### INSERT
O INSERT é um comando DML (Data Manipulation Language) utilizado para executar inclusão de dados em uma tabela. Os valores podem ser informados exclusivamente ou em conjunto, resultado de um comando SELECT.

Considere a tabela abaixo:
~~~sql
CREATE TABLE PRODUTOS
(
  ID INTEGER,
  DESCRICAO VARCHAR(50),
  CADASTRO DATE, 
  SALDO INTEGER, 
  PRECO DECIMAL(15,2),
  SITUACAO CHAR(1)
)
~~~

Exemplo 1: Inserindo dados em todos os campos especificando todas as colunas e todos os valores.
~~~sql
INSERT INTO PRODUTOS  
(ID, DESCRICAO, CADASTRO, SALDO, PRECO, SITUACAO)  
VALUES  
(1,'MACARRÃO','01/01/1997',385,3.76, 'A')  
~~~

Exemplo 2: Inserindo dados em todos os campos especificando apenas os valores. 
Obs: Só poderá ser omitido o nome dos campos pois todos os valores estão sendo informados respectivamente segundo a ordem definida na tabela.

~~~sql
INSERT INTO PRODUTOS  
VALUES  
(1,'FEIJÃO','01/01/1997',350,1.02, 'A')  
~~~

Exemplo 3: Inserindo dados em parte dos campos especificando campos e seus respectivos valores.
~~~sql
INSERT INTO PRODUTOS  
(ID, DESCRICAO, PRECO)  
VALUES  
(1,'ARROZ',5.14)  
~~~

Exemplo 4: Inserindo dados em todos os campos especificando alguns valores nulos.
~~~sql
INSERT INTO PRODUTOS  
(ID, DESCRICAO, CADASTRO, SALDO, PRECO)  
VALUES  
(1,'FARINHA', NULL, NULL, NULL) 
~~~
 
Exemplo 5: Inserindo múltiplos registros em apenas 1insert.
~~~sql
INSERT INTO PRODUTOS
(ID, DESCRICAO, CADASTRO, SALDO, PRECO)  
VALUES  
(1,'ARROZ','01/01/1997',10,13.76),
(2,'FEIJÃO','01/01/2000',11,3.11),
(3,'MACARRÃO','01/01/2000',34,7.88),
(4,'OLEO','01/01/1996',69,3.33),
(5,'SAL','01/01/1994',73,1.70),
(6,'AÇUCAR','01/01/1997',35,6.92)
~~~

**Observações**
```
* Os tipos que representam texto deverão ser informados entre aspas simples(').
* Os tipos que representam data deverão ser informados entre aspas simples(').
* A data informada deverá ser uma data válida, caso não seja o banco irá disparar um erro.
```
#### SELECT
O SELECT é um comando DQL (Data Query Language) utilizado para executar consultas de dados no banco de dados. É possível consultar uma ou várias tabelas e listar uma ou várias colunas. O Caractere (*) representa todas as colunas. Todas as linhas serão exibidas naturalmente. A cláusula FROM determina a tabela de origem.

Exemplo 1: Selecionando todas as colunas
~~~sql
SELECT * 
  FROM PRODUTOS
~~~
Exemplo 2: Selecionando parte das colunas
~~~sql
SELECT DESCRICAO, PRECO
  FROM PRODUTOS
~~~
Exemplo 3: Selecionando colunas e montando expressões
~~~sql
SELECT SALDO, PRECO, SALDO * PRECO
  FROM PRODUTOS
~~~
Exemplo 4: Selecionando colunas e montando expressões com valores fixo
~~~sql
SELECT SALDO, PRECO, SALDO * 1.5
  FROM PRODUTOS
~~~

**Alias**
O alias é um rotulo que poderá ser definido para uma coluna ou uma expressão.

Exemplo 1: Rótulo com uma palavra sem espaços.
~~~sql
SELECT SALDO AS QTD, PRECO, SALDO * PRECO AS PRECO_VENDA
  FROM PRODUTOS
~~~
Exemplo 2: Rótulo com duas ou mais palavras
~~~sql
SELECT SALDO, PRECO as 'preço', SALDO * PRECO AS [PRECO DE VENDA]
  FROM PRODUTOS
~~~

**Inserindo dados de uma consulta**
Com o resultado de um comando SELECT é possível inserir os dados em uma tabela.

Exemplo:
~~~sql
INSERT INTO PRODUTOS  
(DESCRICAO, CADASTRO, PRECO)  
SELECT NOME, 
  CADASTRO, 
  PRECO*1.4
  FROM MERCADORIA
~~~



#### Expressões
É uma combinação de valores, operadores e símbolos que tem como objetivo encontrar um determinado valor. Abaixo veremos alguns tipos de expressões.

##### Expressões lógicas
São Expressões cujo resultado pode ser apenas verdadeiro ou falso. Possui operandos de qualquer tipo de dado/Expressões e operadores: Relacionais, Lógicos, Conjunto, De Nulo.

##### Operadores Relacionais
 Igual. (=) <br>
Exemplo: 
~~~sql
cidade='Londrina'
~~~

Menor. (<) <br>
Exemplo: 
~~~sql
Salario <1000.00
~~~

 Maior. (>) <br>
Exemplo:
 ~~~sql
 Qtd>10
 ~~~

Diferente. (<>) <br>
Exemplo: 
~~~sql
Modelo<>'fusca'
~~~

Maior igual. (>=)  <br>
Exemplo:
~~~sql
Nascimento>='01/01/2012'
~~~
Menor igual. (<=) <br>
Exemplo: 
~~~sql
Vencimento<='13/05/1979'
~~~

Operadores Lógicos
Operador E. **AND**  <br>
Exemplo: 
~~~sql
Idade >18 AND Idade<60
~~~
Operador OU. **OR** <br>
Exemplo:
~~~sql
Profissao ='Analista' OR Profissao='DBA'
~~~
Operador Não. **NOT** <br>
Exemplo: 
~~~sql
not (valor =10)
~~~
##### Operadores Conjunto
**IN** – Define valores de um conjunto. 
~~~sql
Exemplo: COR IN ('PRETA','BRANCA')
~~~
**BETWEEN** – Define uma faixa de valores. 
Exemplo: 
~~~sql
ANOFABRICACAO BETWEEN 2000 AND 2012
~~~

**LIKE** – Define um coringa para a direção.
Exemplo 1: Busca todos os que começam com a letra 'F'.
~~~sql
NOME LIKE 'F%'.
~~~

Exemplo 2: Busca todos que o ultimo nome seja silva.
~~~sql
NOME LIKE '%SILVA'.
~~~

Exemplo 3: Busca Todos que possui Oliveira em qualquer parte do nome.
~~~sql
NOME LIKE '%OLIVEIRA%'.
~~~

##### Operador de Nulo

**IS** = Testa de o valor é nulo.
Exemplo 1: Quando for nulo.
~~~sql
Nome is null
~~~

Exemplo 2: Quando não for nulo.
~~~sql
Nome is not null
~~~

#### WHERE 
Cláusula do comando SELECT utilizado para determinar uma condição que será uma Expressão lógica. A Expressão poderá possuir operadores lógicos, de conjunto, Aritméticos, e relacionais. Será utilizada principalmente para determinar um filtro a consulta.

Exemplo 1: Apenas os maiores de 2.
~~~sql
SELECT *  
  FROM PRODUTOS
 WHERE PRECO >2  
~~~

Exemplo 2: Apenas os maiores de 5.78.
~~~sql
SELECT *  
  FROM PRODUTOS
 WHERE PRECO >=5.78 
~~~

Exemplo 3: Exatamente os 3 itens.
~~~sql
SELECT *  
  FROM PRODUTOS
 WHERE CODIGO IN (4,2,9)  
~~~

Exemplo 4: Quando as 2 condições forem verdadeiras.
~~~sql
SELECT *  
  FROM PRODUTOS
 WHERE CODIGO BETWEEN 5 AND 8  
   AND PRECO >=5.78  
~~~

Exemplo 5: Quando as 2 condições forem verdadeiras.
~~~sql
SELECT *  
  FROM PRODUTOS
 WHERE DESCRICAO LIKE 'A%'  
   AND CODIGO IN (4,2,9)  
~~~

Exemplo 6: Quando a Descrição possui a letra a.
~~~sql
SELECT *  
  FROM PRODUTOS
 WHERE DESCRICAO LIKE '%A%'  
~~~

~~~sql
Exemplo 7: Quando a descrição termina com a.
SELECT *  
  FROM PRODUTOS
 WHERE DESCRICAO LIKE '%A'  
~~~

#### ORDER BY
O ORDER BY da instrução SELECT indica que o resultado de uma instrução SELECT deve ser ordenado através das colunas no sentido informado. Sentido = direção da ordenação. Pode ser Ascendente e Descendente. Quando não informado o sentido o mesmo será ascendente. Também poderá ser informado o número da coluna na consulta.

Exemplo 1: 
~~~sql
SELECT * 
  FROM PRODUTOS ORDER BY CODIGO
~~~
Exemplo 2: 
~~~sql
SELECT * 
  FROM PRODUTOS 
 ORDER BY SITUACAO, DESCRICAO DESC
~~~
Exemplo 3: 
~~~sql
select * 
  FROM PRODUTOS ORDER BY 3,2
~~~

#### DISTINCT
Cláusula do comando SELECT utilizada distinguir os valores uns dos outros, fazendo assim a exibição de um valor uma única vez. Devemos observar que ele considera para a distinção os valores exibidos pelas colunas do select.

Exemplo 1: O exemplo irá trazer apenas uma ocorrência de cada valor da coluna.
~~~sql
SELECT DISTINCT SITUACAO 
  FROM PRODUTOS
~~~

Exemplo 2: O exemplo irá trazer apenas uma ocorrência de cada par de valores das respectivas colunas.
~~~sql
SELECT DISTINCT SITUACAO, SALDO
  FROM PRODUTOS
~~~

#### TOP
Limita o número de registros de uma instrução select.

Exemplo 1:
~~~sql
SELECT TOP 5 * 
  FROM PRODUTOS
~~~

Exemplo 2:
~~~sql
SELECT TOP 10 
  NOME, SALDO 
  FROM PRODUTOS
~~~

#### UPDATE
O UPDATE é um comando DML (Data Manipulation Language) utilizado para executar alteração de dados em uma tabela. Os campos a serem alterados deverão ser especificados pela cláusula SET. Deve-se ter cuidado pois quando não utilizado a cláusula where todos os registros serão atualizados.

Exemplo 1: 
~~~sql
UPDATE PRODUTOS
   SET SALDO = 0  
 WHERE sITUACAO='I'  
~~~

Exemplo 2:
~~~sql
UPDATE PRODUTOS 
   SET SALDO = 10,  
       PRECO = PRECO * 1.1  
 WHERE SITUACAO='I'  
~~~

Exemplo 3:
~~~sql
UPDATE PRODUTOS
   SET SITUACAO='A'  
~~~


#### DELETE 
O DELETE é um comando DML (Data Manipulation Language) utilizado para executar exclusão de dados em uma tabela. Deve-se ter cuidado pois quando não utilizado a cláusula WHERE todos os registros serão excluídos.

Exemplo 1: 
~~~sql
DELETE PRODUTOS
 WHERE SITUACAO='A'  
~~~
Exemplo 2: 
~~~sql
DELETE PRODUTOS
 WHERE SITUACAO='A'  
   AND PRECO >3  
~~~

Exemplo 3: 
~~~sql
DELETE PRODUTOS
 WHERE SITUACAO='A'  
    OR DESCRICAO NOT LIKE '%E%' 
~~~

Exemplo 4: 
~~~sql
DELETE PRODUTOS
~~~

### Definindo Constraints
São restrições implementadas através de regras. Essas regras serão impostas aos comandos: INSERT, UPDATE, DELETE. As regras podem ser definidas na criação da tabela, através do comando CREATE TABLE, ou na alteração da tabela, através do comando ALTER TABLE. Caso a tabela já tenha o valor que está sendo restringido pela constraint, a constraint não será criada. Os tipos de constraints são: check, unique, primary key e foreign key.

OBS:
Caso haja alguma tentativa de manipulação de dados que contraria a regra será cancelada e o banco lançará um erro. Caso haja a tentativa de criação de uma regra que já esteja invalidada por uma informação gravada a regra será cancelada e o banco lançará um erro.

#### Constraint de Check
Define que a coluna da tabela possui uma condição a ser respeitada. A condição é criada segundo uma expressão lógica. Tanto para inserir como para atualizar dados de uma tabela deverá ser respeitada a condição.

Exemplo 1: Na construção da tabela.

~~~sql
CREATE TABLE VEICULO
(
	PLACA CHAR(7) NOT NULL,
	MARCA VARCHAR(30),
	MODELO VARCHAR(30),
	ANOFABRICACAO INTEGER,
	ANOMODELO INTEGER,
	CONSTRAINT CHK_MARCA CHECK(MARCA IN('FIAT','VW')),
	CONSTRAINT CHK_ANOMODELO CHECK(ANOMODELO<> 2013)
)
~~~

Exemplo 2: Na Alteração.
~~~sql
ALTER TABLE VEICULO
ADD CONSTRAINT CHK_MARCA CHECK(VEI_MARCA IN('FIAT','VW'))

ALTER TABLE VEICULO
  ADD CONSTRAINT CHK_ANOMODELO CHECK(ANOMODELO<>2014)
~~~

#### Constraint de Unique
Define que a coluna da tabela é única, não podendo possuir valores repetidos. OBS: um valor da coluna poderá ser nulo NULL.
Exemplo 1: Na criação da Tabela.

~~~sql
CREATE TABLE VEICULO
(
PLACA CHAR(7),
MARCA VARCHAR(30),
MODELO VARCHAR(30),
ANOMODELO INTEGER,
CONSTRAINT UNQ_PLACA UNIQUE (PLACA)
)
~~~

Exemplo 2: Na alteração da tabela.
~~~sql
ALTER TABLE VEICULO
ADD CONSTRAINT UNQ_PLACA UNIQUE (PLACA)
~~~

#### Constraint de primary Key
Chave primária é um recurso utilizado em bancos relacionais onde a sua definição irá permitir que uma ou mais colunas que identifique uma linha da tabela. Outra função da PRIMARY KEY é ser o campo de referência em outra tabela a fim de manter integridade referencial.
*	Características:
*	 Não Pode ser Nulo.
*	Identificará a linha.
*	Terá um índice definido.
*	Poderá ser referenciada em outra tabela a fim de definir integridade referencial.
*	Pode ser simples (Possui um único campo) ou composta (possui dois ou mais campos).
*	Se a chave primária é composta, os valores de cada campo podem se repetir, mas não a combinação desses valores.
*	Toda chave primária irá criar um objeto chamado Constraint.

Exemplo 1: Na criação da tabela
~~~sql
Create table marca
(
ID INT NOT null,
descricao varchar(50)
constraint pk_Marca primary key (id)
)
~~~

Exemplo 2: Na criação da tabela
~~~sql
ALTER table marca
ADD constraint pk_Marca primary key (id)
~~~

#### Constraint de Foreign key
Chave Estrangeira é um recurso utilizado em bancos relacionais onde a sua definição irá permitir que a tabela corrente tenha uma relação com outra tabela. A relação é imposta através de campos contidos nas duas tabelas.

Características:
*	O campo de referência da tabela atual deverá ser chave primária na outra tabela.
*	As colunas de relação necessariamente precisam ser do mesmo tipo.
*	Uma chave estrangeira poderá compor uma chave primária.
*	Nem toda chave estrangeira será uma chave primária.
*	Pode ter o valor nulo.
*	Toda chave estrangeira irá criar um objeto chamado Constraint.

Exemplo 1: Na criação da tabela:
~~~sql
CREATE TABLE MODELO  
(  
     ID INT NOT NULL,  
     DESCRICAO VARCHAR(30),  
     MARCA_ID INT ,  
     CONSTRAINT PK_MODELO PRIMARY KEY (ID),  
     CONSTRAINT FK_MODELO_MARCA FOREIGN KEY (MARCA_ID)  
        REFERENCES MARCA (ID)  
) 
~~~
Exemplo 2: Na criação da tabela

~~~sql
ALTER TABLE MODELO
     ADD CONSTRAINT FK_MODELO_MARCA FOREIGN KEY (MARCA_ID) 
             REFERENCES MARCA (ID) 
~~~
Ações de Restrição
*	São ações que podem ser definidas para fornecer uma alternativa a restrição. São executadas automaticamente na tabela Child, de acordo com um evento ocorrido na tabela Parent relacionada.

São elas:
Cascade: Executa a mesma ação nos registros da tabela Child relacionada.
Set Null: Altera para null, o valor da(s) coluna(s) da chave estrangeira dos registros da tabela Child relacionada. 

Eventos:
*	Delete: Ao excluir um registro da tabela Parent.
*	Update: Ao alterar os valores da chave primária de um registro da tabela Parent.

Exemplo 1:Na criação da Tabela
*	Tabela Parent:
~~~sql
CREATE TABLE MARCA  
(  
     ID INT NOT NULL,  
     DESCRICAO VARCHAR(30),  
     CONSTRAINT PK_MARCA PRIMARY KEY (ID)
)  	
~~~
*	Tabela Child:
~~~sql
CREATE TABLE MODELO  
(  
     ID INT NOT NULL,  
     DESCRICAO VARCHAR(30),  
     MARCA_ID INT,  
     CONSTRAINT PK_MODELO PRIMARY KEY (ID),  
     CONSTRAINT FK_MODELO_MARCA FOREIGN KEY (MARCA_ID)  
        REFERENCES MARCA (ID) ON UPDATE SET NULL ON DELETE CASCADE
)  
~~~

#### Excluindo Constraint
O comando Drop Constraint pode ser utilizada para apagar constraints de unique, check, primary key e foreign key. Para apagar uma primary key a mesma não pode possuir dependência em uma foreign key .

Exemplo 1: Apagando uma constraint de primary key. 
~~~sql
ALTER TABLE CLIENTE  
	DROP CONSTRAINT PK_CLIENTE
~~~
Exemplo 2: Apagando uma constraint de check
~~~sql
ALTER TABLE VEICULO
	DROP CONSTRAINT CHK_VEI_ANOMODELO
~~~

### Índices
Índices são estruturas que possibilitam uma forma mais rápida e eficiente de acessar os dados de uma tabela. Ocupam espaço físico para manter informações que serão utilizados para acessar os dados da tabela. As informações são formadas pelas colunas que serão utilizadas para formar o índice, bem como classificar a coluna da tabela.

**Características:**
*	Aumentam a velocidade de:
*	Recuperação de dados.
*	Ordenação dos registros.
*	Funciona de maneira semelhante ao índice de um livro.
*	Antes da execução de uma instrução Select, o gerenciador sempre verifica a existência de índices.

**Necessidade de índices:**
*	Motivos para se criar índices:
*	Os dados solicitados são solicitados ordenados com frequência.
*	Motivos para NÃO se criar índices:
*	As colunas já fazem parte de índices.
*	Dificilmente as colunas aparecerão na cláusula WHERE do SELECT.
*	As colunas têm alterações frequentes.
*	A coluna possuir poucos valores discretos, Masculino ou Feminino, por exemplo.

O comando para criar um Índice pode-se utilizar um comando DDL, o Create Index. 

Exemplo 1: Criando índice com 1 campo.
~~~sql
CREATE INDEX IX_PRODUTO_DESCRICAO ON PRODUTO (DESCRICAO)
~~~
Exemplo 2: Criando índice com 2 campo.
~~~sql
CREATE INDEX IX_PRODUTO_DESCRICAO ON PRODUTO (DESCRICAO, GRUPO)
~~~
### Excluindo índice
Para exclui um Índice pode-se utilizar um comando DDL, o Drop Index. 

Exemplo:
~~~sql
DROP INDEX IX_CLIENTE1 ON CLIENTE
~~~
Forçando a utilização do Índice
Para forçar a utilização do índice basta o referenciar no nome da tabela. Veja o exemplo abaixo.

Exemplo 1: 
~~~sql
SELECT vei_placa
FROM VEICULO WITH(INDEX = index1 )
~~~


### Consultas Avançadas
São consultas que tem o objetivo de trazer as informações de forma mais elaborada. Pode ser feito junção de dados, Agrupamentos, Cálculos e outros.


#### Junção de Dados
Juntar tabelas significa considerar registros de mais de uma tabela que tenham ou não os mesmos valores em colunas consideradas chaves ou algo equivalente.
Para isso pode-se realizar:
* Junções Verticais.
* Junções Horizontais.

#### Junção Horizontal
Junções Horizontais em que o registro de uma tabela e de outra se complementam, tornando-se um só registro com a quantidade somada de suas colunas, tais como: Cross Join, Inner Join e Outer Join.

Considere o script abaixo.
~~~sql
CREATE TABLE MARCA  
(  
  MARCA_ID INTEGER,  
  NOME VARCHAR(30),  
  SITUACAO CHAR(1) 
)  

CREATE TABLE MODELO  
(  
  MODELO_ID INTEGER,  
  NOME VARCHAR(30),  
  SITUACAO CHAR(1), 
  MARCA_ID INTEGER  
)  

INSERT INTO MARCA
VALUES
(1,'CHEVROLET',1),
(2,'VOLKSWAGEN',1),
(3,'FIAT',1),
(4,'RENAULT',2),
(5,'FORD',1)

INSERT INTO MODELO
VALUES
(1,'CORSA',2,1),
(2,'AGILE',1,1),
(3,'MONTANA',1,1),
(4,'ASTRA',1,1),
(5,'VECTRA',2,1),
(6,'CORSA',1,1),
(7,'GOL',1,2),
(8,'POLO',1,2),
(9,'SANTANA',1,2),
(10,'UNO',1,3),
(11,'STILO',2,3),
(12,'MAREA',2,3),
(13,'CLIO',1,4),
(14,'SCENIC',2,4),
(15,'FUSION',1,5),
(16,'FIESTA',1,5)
~~~
**Cross Join**
O comando irá trazer todos os registros. Irá listar pra cada registro da tabela da esquerda todos os registros da tabela da direita, formando um produto cartesiano. 
Exemplo 1: 
~~~sql
SELECT *  
FROM MARCA CROSS JOIN MODELO 
~~~

**Inner Join**
Permite trazer um conjunto de dados de tabelas onde os campos estão relacionados através de igualdade. O comando impõe obrigatoriedade, ou seja trará apenas registros onde os valores de comparação são iguais nas duas tabelas da relação.

Exemplo 1: 
~~~sql
SELECT *  
  FROM MARCA  
	INNER JOIN MODELO  
       ON MARCA.MARCA_ID = MODELO.MARCA_ID 
~~~
**Outer Join**
Permite trazer um conjunto de dados de tabelas onde os campos estão relacionados através de igualdade. O comando não impõe obrigatoriedade, ou seja, trará registros onde os valores de comparação são iguais nas duas tabelas da relação, e os registros onde os valores de comparação não são iguais nas duas tabelas da relação. A cláusula OUTER JOIN possui os tipos: Left, Right e Full.

**Left**
Considera a tabela da esquerda, ou seja, considerará todos os registros da tabela da esquerda mesmo que a mesma não possua registros de referência na tabela da direita.

Exemplo 1: 
~~~sql
SELECT *  
  FROM MARCA  
       LEFT OUTER JOIN MODELO ON 
MARCA.MARCA_ID = MODELO.MARCA_ID 
~~~

**Right**
Considera a tabela da direita, ou seja, considerará todos os registros da tabela da direita mesmo que a mesma não possua registros de referência na tabela da esquerda. 

Exemplo 1:
~~~sql
SELECT *  
  FROM MARCA  
       RIGHT OUTER JOIN MODELO ON
MARCA.MARCA_ID = MODELO.MARCA_ID 
~~~

**Full**
Considerará todos os registros das duas tabelas, ou seja, considera todos os registros que possuem relação e os que não possuem relação.

Exemplo 1:
~~~sql
SELECT *  
  FROM MARCA  
  FULL OUTER JOIN MODELO ON
       MARCA.MARCA_ID = MODELO.MARCA_ID
~~~

**Junção Vertical**
Junções Verticais em que o registro de uma tabela se junta totalizando o número de registro dependendo do operador de conjunto utilizado. 

**Conjunto Regulares**
Conjuntos regulares são resultados de instruções SELECT. Que têm a mesma quantidade de colunas, não precisando ter o mesmo nome Cujas colunas têm os mesmos tipos de dados, entretanto, se o tipo de dado for CHAR ou VARCHAR, o tamanho também tem que ser o mesmo.

**Considere os conjuntos Regulares:**
	
**Union All**
Une dos conjuntos regulares mostrando todas as linhas das duas tabelas, mesmo que uma linha já tenha sido mostrada.

Exemplo 1: 
~~~sql
SELECT ING_ID, ING_DESCRICAO  
  FROM INGREDIENTE  
 UNION ALL  
SELECT PRO_ID, PRO_DESCRICAO  
  FROM PRODUTO 
~~~
**Union**
Une dos conjuntos regulares mostrando todas não coincidentes e as que são coincidentes será exibida uma única vez.

Exemplo 1:
~~~sql
SELECT ING_ID, ING_DESCRICAO  
  FROM INGREDIENTE  
 UNION  
SELECT PRO_ID, PRO_DESCRICAO  
  FROM PRODUTO 
~~~
Intersect
Apresenta apenas as linhas que onde os conteúdos são coincidentes e apenas os coincidentes, ou seja, possuem nas duas tabelas.

Exemplo 1: 
~~~sql
SELECT ING_ID, ING_DESCRICAO  
  FROM INGREDIENTE  
 INTERSECT  
SELECT PRO_ID, PRO_DESCRICAO  
  FROM PRODUTO  
~~~
Except
Apresenta apenas as linhas do primeiro conjunto regular, e os conteúdos que não são coincidentes.

Exemplo 1:
~~~sql
SELECT ING_ID, ING_DESCRICAO  
  FROM INGREDIENTE  
EXCEPT  
SELECT PRO_ID, PRO_DESCRICAO  
  FROM PRODUTO  
~~~

**Agrupamento de Dados e funções de Agregação**
A Cláusula group by do comando SELECT é utilizado para agrupar dados resultantes da consulta. Serão agrupados os valores iguais de uma determinada coluna. A coluna a ser agrupada deverá estar presente na lista de colunas a serem exibidas ou uma função de agregação deverá ser exibida.

Exemplo 1: 
~~~sql
Select descricao
From produto
Group by descricao
~~~
Exemplo 2: 
~~~sql
Select descricao
From produto
Group by descricao
~~~
Funções de Agregação
São funções que podem ser utilizadas juntamente como o group by e produzir algum tipo de cálculo. Vejamos:

AVG
Calcula a Média dos valores não nulos de uma coluna numérica.

Exemplo 1:Irá exibir um único valor com a média geral do saldo.
~~~sql
SELECT AVG(SALDO) AS MEDIA  
FROM PRODUTO  
~~~
Exemplo 2: Irá calcular a média do preço agrupado por situação.
~~~sql
SELECT SITUACAO, AVG(PRECO) AS MEDIA  
FROM PRODUTO  
GROUP BY SITUACAO 
~~~

SUM
Soma os valores não nulos de uma coluna numérica.

Exemplo 1: Irá exibir um único valor com a soma geral do saldo.
~~~sql
SELECT sum(SALDO) AS soma
FROM PRODUTO  
~~~
Exemplo 2: Irá calcular a soma do preço agrupado por situação.
~~~sql
SELECT SITUACAO, sum(PRECO) AS soma
FROM PRODUTO  
GROUP BY SITUACAO 
~~~
MAX
Encontra o maior valor de uma coluna.

Exemplo 1: Irá exibir o maior valor da coluna
~~~sql
SELECT max(SALDO) AS maior
FROM PRODUTO  
~~~
Exemplo 2: Irá exibir o maior valor da coluna agrupado por situação
~~~sql
SELECT SITUACAO, max(PRECO) AS maior
FROM PRODUTO  
GROUP BY SITUACAO 
~~~
MIN
Encontra a menor valor de uma coluna.

Exemplo 1: Irá exibir o menor valor da coluna
~~~sql
SELECT max(SALDO) AS maior
FROM PRODUTO  
~~~
Exemplo 2: Irá exibir o menor valor da coluna agrupado por situação
~~~sql
SELECT SITUACAO, max(PRECO) AS maior
FROM PRODUTO  
GROUP BY SITUACAO 
~~~
COUNT
Conta a quantidade de ocorrências não nulas de uma coluna. Quando for utilizado o (*) ele irá considerar todas as colunas da tabela.

Exemplo 1: Conta a quantidade de registros da tabela
~~~sql
SELECT COUNT (*) AS QTD
FROM PRODUTO
~~~

Exemplo 2: Seleciona apenas na coluna descrição os valores não nulos.
~~~sql
SELECT COUNT (DESCRICAO) AS QTD
FROM PRODUTO
~~~
Exemplo 3: Seleciona apenas na coluna descrição os valores não nulos agrupados por situação.
~~~sql
SELECT SITUACAO, COUNT (DESCRICAO) AS QTD
FROM PRODUTO
GROUP BY SITUACAO
~~~

### Sub Consultas
Permite usar uma instrução DQL para resultar um único valor ou um conjunto de valores a serem usados como operando numa expressão colocada numa cláusula WHERE de outra instrução Select, mais externa.

Considere o script abaixo.
~~~sql
CREATE TABLE VENDEDOR 
(	
  CODIGO INTEGER,
  NOME VARCHAR(50), 
  UF_SIGLA CHAR(2)
)

INSERT INTO VENDEDOR VALUES (1,'BRUNO','SP'),(2,'MAURO','CE'),(3,'MARIA',NULL),(4,'DIONE','PR')

CREATE TABLE UF 
(
  SIGLA CHAR(2), 
  NOME VARCHAR(20)
)

CREATE TABLE NOTAFISCAL
(
  ID INTEGER IDENTITY,
  NUMERO INTEGER,
  EMISSAO DATE,
)

INSERT INTO NOTAFISCAL
VALUES
(65489,'01/01/2014'),
(98753,'02/05/2013'),
(32159,'02/10/2013'),
(87223,'02/02/2013'),
(33988,'02/03/2013')

CREATE TABLE NOTAFISCALITEM
(
  ID INTEGER IDENTITY	,
  NOTAFISCAL_ID INTEGER,
  PRODUTO_ID INTEGER,
  VLRUNITARIO DECIMAL(10,2),
  QTD INTEGER
)

INSERT INTO NOTAFISCALITEM
VALUES
(1,1,38.10,568),
(2,2,38.20,434),
(2,3,45.80,543), 
(3,4,43474,434), 
(3,5,45.36,234), 
(5,4,34.49,467), 
(5,5,23.84,347),
(5,3,27.56,567),
(2,5,27.39,345),
(2,1,36.74,567), 
(1,5,37.25,456),
(4,6,27.48,456),
(5,7,27.64,345), 
(5,8,38.85,546), 
(5,2,33.77,677), 
(1,3,23.35,456)

INSERT INTO UF VALUES 
('AL','ALAGOAS'),
('CE','CEARA'),
('SP','SAO PAULO')
~~~
Exemplo 1: Para mostrar todas as colunas da tabela Vendedor cujo valor da coluna UF_SIGLA esteja entre AL, CE e SP.
Neste exemplo está sendo usados os valores diretamente.
~~~sql
SELECT * 
  FROM VENDEDOR 
 WHERE UF_SIGLA IN ('AL','CE','SP')
~~~

Exemplo 2: Para mostrar todas as colunas da tabela Vendedor cujo valor da coluna UF_SIGLA seja filtrada por uma sub-consulta.
~~~sql
SELECT *
  FROM VENDEDOR
 WHERE UF_SIGLA IN (SELECT SIGLA FROM UF)‏
~~~

Exemplo 3: Filtrando dados na Sub-Consulta e usando como filtro na consulta principal.
~~~sql
SELECT *
  FROM VENDEDOR
 WHERE UF_SIGLA = (SELECT SIGLA FROM UF 
                    WHERE NOME like '%i%')
~~~

Exemplo 4:  Sub-Consulta com relacionamento
~~~sql
SELECT *
  FROM VENDEDOR
  INNER JOIN (SELECT SIGLA 
                FROM UF 
               WHERE NOME = 'CEARA') AS ESTADO
 ON VENDEDOR.UF_SIGLA = ESTADO.SIGLA
~~~

Exemplo 5: Sub-Consulta como coluna.
~~~sql
SELECT
	ID,
	EMISSAO,
      	(
	 SELECT SUM(VLRUNITARIO)
	   FROM NOTAFISCALITEM B
		  WHERE A.ID = B.NOTAFISCAL_ID
	) AS TOTAL
 FROM NOTAFISCAL A
~~~

#### Exists
Comando que verifica a existência de um subconjunto de dados.
Exemplo 1: 
~~~sql
SELECT * 
  FROM MARCA
 WHERE EXISTS (SELECT *
	FROM MODELO
		WHERE MARCA.MARCA_ID = MODELO.MARCA_ID)
~~~

### Visões
É uma estrutura que armazena uma instrução Select e simula outra tabela a partir do conjunto de registros resultante dessa instrução. Tem seu funcionamento semelhante a uma tabela, mas não é uma. Permite fornecer subconjuntos e super-conjuntos de dados de uma ou mais tabelas. Permite que seja montado uma consulta baseada em um cenário. OBS: A cláusula ORDER BY é proibida na instrução <select> da visão, sendo permitido ordenar o resultado de um select na visão.


Exemplo 1: Criando uma view de clientes e notas.
~~~sql
Create view vwvendas_Cliente 
As
Select cliente.nome, Nota.valortotal
  From notafiscal
  	  Inner join cliente 
     on cliente.id = nota.cliente_id
~~~

Exemplo 2: Usando uma view.
~~~sql
Select * 
  from vendas_cliente 
 where valortotal >1000
~~~

Exemplo 3: Criando uma views de marcas ativas
~~~sql
CREATE VIEW VWMARCAS_ATIVAS
AS
	SELECT MARCA_ID, NOME 
  FROM MARCA 
 WHERE SITUACAO='A'
~~~
Exemplo 4: Usando a view.
~~~sql
select * from vw_marcas_ativas order by nome
~~~
Exemplo 5: Alterando uma visão.
~~~sql
alter VIEW VWMARCAS_ATIVAS
AS
     SELECT MARCA_ID, NOME 
  FROM MARCA 
 WHERE SITUACAO='i'
~~~
Exemplo 6: Excluindo uma visão.
~~~sql
drop view VWMARCAS_ATIVAS
~~~

#### Visões Atualizáveis
São visões que permite manipular seus registros, além de visualizá-los. Para a visão ser atualizável Ela deve usar colunas de uma única tabela. Essas colunas não podem ser originadas de expressões aritméticas e O SELECT da visão não pode conter: 
* Cláusula WHERE que utilize o predicado DISTINCT; 
* Cláusula HAVING; 
* Funções; 
* Queries aninhadas; 
* Stored Procedures. 

Exemplo 1: Pode-se inserir uma marca ativa na visão
~~~sql
Insert into VW_MARCAS_ATIVAS values (6,'AUDI')
~~~

Exemplo 2: Pode-se inserir uma marca ativa na visão
~~~sql
Insert into VW_MARCAS_ATIVAS values (7,'HYUNDAI')
~~~

### Controle Transacional
O controle transacional é um recurso disponível em vários SGBD’s e faz isso através de um recurso chamado transação. A transação É uma unidade lógica criada na memória a fim de trabalhar com dados temporariamente através de diversas operações. Caso a operação seja confirmada os dados serão confirmados no banco (COMMIT), Caso a operação não seja confirmada no banco (ROLLBACK) os dados não serão confirmados no banco. Para a criação de uma transação deverá ser utilizado os comandos BEGIN TRANSACTION, COMMIT e ROLLBACK. O controle de transações garante que se a transação executar atualizações e ocorrer uma falha antes de seu término então essas atualizações serão desfeitas.

Características:
* As transações são atômicas (tudo ou nada).
* As transações são isoladas umas das outras.
* Um programa só pode executar uma instrução BEGIN TRANSACTION quando não tiver outra transação em andamento.

#### Nível de Isolamento:
É a forma no qual os comandos, dados externos, e outras transações enxergam os dados trabalhados dentro de uma transação.

Exemplo 1: O Código Abaixo irá inserir um registro na tabela de produto e o mesmo será confirmado.
~~~sql
BEGIN TRANSACTION
INSERT INTO PRODUTO
VALUES 
(1,'SAPATO',3,151.0,1)
COMMIT
~~~

Exemplo 2: O Código Abaixo irá inserir um registro na tabela de produto e o mesmo não será confirmado.
~~~sql
BEGIN TRANSACTION
INSERT INTO PRODUTO
VALUES 
(1,'SAPATO',3,151.0,1)
ROLLBACK
~~~

#### Check Points
O comando permite que seja criado um ponto de restauração de forma que possa ser desfeitas todos os comandos executados após o ponto salvo. Vários pontos poderão ser criados e poderá ser restaurado a qualquer ponto também.

Exemplo 1: O Exemplo irá restaurar até o ponto t1 e gravará apenas o produto 1 e 2.
~~~sql
Begin Transaction
INSERT INTO PRODUTO VALUES (1,'Camisa',1,112.0)
INSERT INTO PRODUTO VALUES (2,'Calça',3,112.0)
Save Transaction t1
INSERT INTO PRODUTO VALUES (3,'Gravata',2,112.0)
Save Transaction t2
INSERT INTO PRODUTO VALUES (5,'Meia',4,112.0)
Save Transaction t3
INSERT INTO PRODUTO VALUES (6,'Sapato',2,112.0)
Rollback Transaction t1
Commit
~~~
Exemplo 2: O exemplo irá restaurar até o ponto t3 e gravará apenas o produto 1 e 5.
~~~sql
Begin Transaction
INSERT INTO PRODUTO VALUES (1,'Camisa',1,112.0)
INSERT INTO PRODUTO VALUES (2,'Calça',3,112.0)
Save Transaction t1
INSERT INTO PRODUTO VALUES (3,'Gravata',2,112.0)
Save Transaction t2
INSERT INTO PRODUTO VALUES (5,'Meia',4,112.0)
Save Transaction t3
INSERT INTO PRODUTO VALUES (6,'Sapato',2,112.0)
Rollback Transaction t3
Commit

~~~

### Automação de Processos
A automação de processos pode ser feita através rotinas programadas no banco de dados através da linguagem TSQL.

#### Introdução ao Transaction SQL
A linguagem T-SQL estende a linguagem SQL e é comumente usado para escrever as consultas ou blocos de código utilizando comandos e funções que não se limita apenas aos comandos SQL padrão. Poderá ser utilizado por exemplo criação de variáveis, estruturas de decisão, estruturas de repetição e outros.


#### Variáveis
As variáveis são locais na memória que podem armazenar dados temporariamente. As variáveis podem ser utilizadas diretamente como comando, ou dentro de alguma estrutura de lote: exemplo: Procedures, triggers. Deverá ter como prefixo o caractere “@”. Para declaração de variáveis poderá ser utilizado o comando DECLARE.

**Definindo Variáveis:**
Exemplo 1:
~~~sql
DECLARE @N1 AS INTEGER
DECLARE @N2 AS INTEGER
~~~
Exemplo 2:
~~~sql
DECLARE @NASCIMENTO DATE, @NOME VARCHAR(10) @FONE VARCHAR(9)
~~~

**Atribuindo valores:**
Para definir um valor a uma variável poderá ser utilizado o comando SET.

Exemplo 1:
~~~sql
SET @NASCIMENTO = '01/01/2012'
SET @NOME = (SELECT CLI_NOME FROM CLIENTE)
SET @FONE = '9998-2354'
~~~

**Atribuindo com Select:**
Uma variável pode receber um valor vindo de uma coluna em um select. Obs: o select deverá retornar apenas 1 linha.

Exemplo 1:
~~~sql
Select @TOTAL=TOTAL FROM NOTAFISCAL
PRINT @TOTAL
~~~

**Bloco Anônimo**
Um bloco anônimo pode ser definido através dos comandos begin e end. O bloco pode ser definido por exemplo em alguma ferramenta que permite a execução de comandos TSQL.O código não ficará armazenado em um objeto no banco de dados. O comando PRINT poderá imprimir um conteúdo no console.

Exemplo 1:
~~~sql
BEGIN
DECLARE @NOTA1 DECIMAL(10,2)
DECLARE @NOTA2 DECIMAL(10,2)
DECLARE @MEDIA DECIMAL(10,2)

SET @NOTA1 = 7
SET @NOTA2 = 2
SET @MEDIA = (@NOTA1+@NOTA2)/2
PRINT @MEDIA
END;
~~~

**Funções de Manipulação de Dados**
São funções que tem como objetivo fazer manipulação de dados. São divididas em: Conversão de dados, Data, Nulo, texto e Outros.

**Funções de conversão**
São funções que tem como objetivo fazer conversão de dados.

CAST
Converte dados para um tipo determinado. Caso defina um valor menor a string será cortada.

Exemplo 1:
~~~sql
  SELECT CAST(IDADE AS VARCHAR(10))+'-'+NOME AS PACIENTE
FROM PACIENTE
~~~
CONVERT
Possui uma função similar ao cast porem poderá ser especificado um estilo para conversão.

Exemplo 1:
~~~sql
SELECT CONVERT(VARCHAR(10), DATA_INTERNAMENTO,103) +'-'+ NOME AS INTERNAMENTO 
FROM PACIENTE
~~~
Funções de Null
São funções que tem como objetivo fazer tratamento com valores nulos.

ISNULL
Retorna um determinado valor caso a expressão seja nula.
Exemplo 1:
~~~sql
SELECT ISNULL(NOME,'NÃO EXISTE') AS NOME
   FROM PACIENTE
~~~
COALESCE
Retorna a primeira expressão não NULL entre os seus argumentos.

Exemplo 1: 
~~~sql
SELECT COALESCE(NOME, 
		CAST(DATA_INTERNAMENTO AS VARCHAR(10)),
		CAST(IDADE AS VARCHAR(10)),
		CAST(VLR_INTERNAMENTO AS VARCHAR(10))) 
		  AS 'NAO NULO'
 FROM PACIENTE
~~~

Funções de String
São funções que permite a manipulação de strings.

CONCAT
Concatena duas ou mais string.

Exemplo 1:
~~~sql
select CONCAT('Banco', 'de', 'Dados')
~~~
SUBSTRING
Recupera uma parte do input string.

Exemplo 1:
~~~sql
select SUBSTRING(CONVERT(VARCHAR(10),getdate(),103),0,6) as diames
~~~

UPPER
Converte os caracteres para maiúsculo.

Exemplo 1: 
~~~sql
Select UPPER(nome) from cliente
~~~
LOWER
Converte os caracteres para minúsculo.

Exemplo 1: 
~~~sql
Select LOWER ('LINGUAGEM DE ACESSO BANCO DE DADOS') as Minusculo
~~~
LTRIM
Remove os espaços a esquerda de uma string.
Exemplo: 
~~~sql
Select LTRIM('                       remove os espaços a esquerda') as Esquerda
~~~
RTRIM
Remove os espaços a direita de uma string.
Exemplo: 
~~~sql
SelectLTRIM('remove os espaços a esquerda                                              ') as Direita
~~~

REPLACE
Substitui todas as ocorrências de uma determinada string em uma determinada string.
Exemplo 1: 
~~~sql
Select Replace (nome,'joao','maria') from cliente
~~~
Funções de Data
São funções que permitem a manipulação de datas como por exemplo adicionar dias, meses ou anos em uma data.

GETDATE
Função que retorna a data e hora do sistema.
Exemplo 1:
~~~sql
Select GETDATE()
~~~
DATEDIFF
Função que retorna um valor considerando um período. Para isso é necessário informar o intervalo do valor.

Exemplo 1: 
~~~sql
Select DateDiff (YEAR, '01/01/2000', DTNASCIMENTO) From Cliente
~~~
DATEADD
Retorna um valor adicionando um intervalo determinado.

Exemplo 1:
~~~sql
Select DATEADD(YEAR, -5,DTNASCIMENTO) From Cliente
~~~
DATEPART
Retorna um valor particionado da data.

Exemplo 1: 
~~~sql
Select DATEPART(YEAR, DTNASCIMENTO) From Cliente
~~~
YEAR
Retorna o valor numérico correspondente ao ano.

Exemplo 1:
~~~sql
Select Year(dtnascimento) from cliente
~~~

MONTH
Retorna o valor numérico correspondente ao mês.

Exemplo 1:
~~~sql
Select Month(dtnascimento) from cliente
~~~
DAY
Retorna o valor numérico correspondente ao dia.

Exemplo 1: 
~~~sql
Select Day(dtnascimento) from cliente
~~~
Estrutura de Decisão
São estruturas que podem ser utilizadas no código para que seja feita uma tomada de decisão.

**Comando if**
Comando responsável pela avaliação uma expressão lógica e direcionamento da execução do programa. Quando o bloco possuir mais de uma instrução deverá ser definido seu início e seu fim com begin...end.

Exemplo 1:
~~~sql
BEGIN
  DECLARE @NOTA1 DECIMAL(10,2)
  DECLARE @NOTA2 DECIMAL(10,2)
  DECLARE @MEDIA DECIMAL(10,2)
  SET @NOTA1 = 7
  SET @NOTA2 = 0
  SET @MEDIA = (@NOTA1+@NOTA2)/2
  IF @MEDIA >6.0
    PRINT 'APROVADO'
  ELSE IF @MEDIA >4.0
    PRINT 'EXAME'
  ELSE
    PRINT 'REPROVADO'
END;
~~~
**Comando Select Case**
Comando responsável pela escolha de uma opção entre N opções. Tem como característica a definição de uma expressão e opções de valores que são comparadas e utilizadas na comparação.
Exemplo 1:
~~~sqL
SELECT DESCRICAO,
       SALDO,
       CASE WHEIN SITUACAO='A' THEN 
'ATIVO'
       CASE WHEIN SITUACAO='I' THEN 
'INATIVO'
       ELSE
         'ERRO'
       END AS SITUACAO
FROM PRODUTOS
~~~
Estrutura de Decisão
São estruturas que podem ser utilizadas no código para que um bloco seja repetido N vezes.

while
Possui a característica de avaliar a condição antes da execução do bloco. Caso a condição não seja verdadeira. Não será possível executar o bloco definido no laço. Para essa estrutura o controle de interações é feito através de uma condição.

Exemplo 1:
~~~sql
Declare @v1 as integer = 0
WHILE @V1 <=10
BEGIN
  PRINT @V1
  SET @V1 = @V1+1
END
~~~
### Tipos complexos
Para a linguagem T-SQL temos basicamente os tipos de dados utilizados pelo banco SqlServer. Porem existem pequenas variações. Exemplo: Table, Cursor.

#### Cursores
O cursor é uma estrutura que contém um select e será utilizado através de um laço para que sejam percorridas todas as linhas do select.

Comandos de Navegação
São comandos que permitem que seja feita a navegação entre os registros.

FETCH NEXT: Avança a próxima linha.
FETCH PRIOR: Retorna ao anterior.
FETCH FIRST: Vai ao primeiro registro.
FETCH LAST: Vai ao último registro.

* Outros comandos
OPEN
Abre o cursor.

CLOSE
Fecha o cursor.

DEALLOCATE
Elimina o cursor da memória.

@@FETCH_STATUS
É uma função de cursor que armazena 0(zero) caso o último comando tenha sido executado com sucesso, e -1 caso não tenha mais linhas.

Estudo de Caso 1: Ajuste de uma casa decimal no número do telefone.
~~~sql
CREATE TABLE TELEFONE
(
ID 		INTEGER IDENTITY,
PESSOA_ID 	INTEGER,
DDD		VARCHAR(2),
NUMERO 	VARCHAR(9),
TIPO 	    	TINYINT
)

INSERT INTO TELEFONE
VALUES
(11,43,'3967-5444',1),
(11,43,'9387-2234',2),
(12,43,'3323-5434',3),
(12,43,'3967-4377',1),
(12,43,'8865-9764',2),
(13,43,'3323-3471',3),
(13,43,'8866-6566',1),
(14,43,'3323-5777',2),
(14,43,'3967-7654',3),
(14,11,'9956-2312',1),
(15,11,'3323-5256',2),
(15,11,'3967-9088',3),
(15,21,'8999-8754',1),
(16,21,'3967-0053',2),
(16,21,'9135-6755',3),
(16,11,'3323-4372',1),
(17,11,'8298-0075',2),
(17,11,'3332-4532',3),
(17,21,'3247-5736',1),
(18,21,'9947-5690',2),
(18,21,'3332-4667',3),
(19,21,'3286-5776',1),
(19,21,'9961-5850',2),
(19,21,'3344-4532',3)

ALTER TABLE TELEFONE
   ALTER COLUMN NUMERO VARCHAR(10)
~~~

Considere o cursor implementado através de um bloco anônimo.

~~~sql
DECLARE @TEL VARCHAR(10)
DECLARE @ID INTEGER
DECLARE CURSOR_TELEFONE CURSOR FOR
	SELECT ID, NUMERO 
	  FROM TELEFONE

OPEN CURSOR_TELEFONE
FETCH NEXT FROM CURSOR_TELEFONE INTO @ID, @TEL

WHILE @@FETCH_STATUS = 0
BEGIN
  UPDATE TELEFONE SET NUMERO = '9'+ @TEL WHERE ID = @ID 
  FETCH NEXT FROM CURSOR_TELEFONE INTO @ID, @TEL
END
CLOSE CURSOR_TELEFONE
DEALLOCATE CURSOR_TELEFONE

~~~

Estudo de caso 2: ajuste de preço.
~~~sql
CREATE TABLE PRODUTO
(
	CODIGO 	INTEGER IDENTITY,
	DESCRICAO 	VARCHAR(50),
	SALDO 	INTEGER,
	PRECO 	DECIMAL (15,2)
)
INSERT INTO PRODUTO
VALUES
('ARROZ',9,7.56),
('FEIJÃO',3,7.15),
('MACARRÃO',94,2.56),
('FARINHA',22,1.2),
('CAFÉ',569,0.96)
~~~

Considere o cursor Implementado
~~~sql
DECLARE @PRECO DECIMAL (10,5)
DECLARE @NOVO_PRECO DECIMAL(10,2)
DECLARE @CODIGO INTEGER
DECLARE CURSOR_PRODUTO CURSOR FOR
  SELECT CODIGO, PRECO FROM PRODUTO FOR 
OPEN CURSOR_PRODUTO
FETCH NEXT FROM CURSOR_PRODUTO INTO @CODIGO, @PRECO
WHILE @@FETCH_STATUS = 0
BEGIN
  SET @NOVO_PRECO = @PRECO * @COEFICIENTE
      UPDATE PRODUTO  
         SET PRECO = @NOVO_PRECO 
       WHERE CODIGO = @CODIGO
      FETCH NEXT FROM CURSOR_PRODUTO INTO @CODIGO, @PRECO
    END
    CLOSE CURSOR_PRODUTO
    DEALLOCATE CURSOR_PRODUTO

~~~

### Procedures
São códigos armazenados no banco de dados através objetos que poderão ser executados a qualquer momento em uma interface nativa com banco ou chamada através de um software.

#### Criando uma procedure

Exemplo 1: Abaixo temos uma procedure simples e sem utilização de parâmetros.
~~~sql
CREATE PROCEDURE sp_ImprimirHora
as
begin
   print convert(varchar(10), getdate(),103)
end
~~~
Executando uma procedure
Para executar a procedure será utilizado o comando execute ou a abreviação exec.

Exemplo 1:
~~~sql
Execute sp_ImprimirHora
~~~
Exemplo 2:
~~~sql
exec sp_ImprimirHora
~~~
Procedure com parâmetros de entrada
É possível criar procedures que executarão recebendo valores através de parâmetros.

Exemplo 1: Atualização de preço.
~~~sql
CREATE PROCEDURE SP_AJUSTEPRECO (@INDICE AS INTEGER)
AS
BEGIN
  UPDATE PRODUTO 
     SET PRECO = PRECO*@INDICE/100+PRECO
END
~~~
Exemplo 2: Executando a procedure
~~~sql
Exec sp_ajustepreco 30
~~~
Procedure com parâmetro de saída
É possível criar procedures que executarão e devolvem um determinado resultado.

Exemplo 1: Atualiza o preço e retorna o saldo total de produtos.
~~~sql
create procedure sp_atualiza(@preco decimal(18,2), @total decimal(18,2) output)
as
begin
  update produto
     set preco = @preco
  set @total = (select count(*) from produto)
end
~~~
Exemplo 2: Utilizando a procedure
~~~sql
Declare @valor as decimal(18,2)
Execute sp_atualiza 10, @valor
Print @valor
~~~

Triggers
Uma trigger é um recurso vinculado a uma tabela que implementa um código a ser disparado caso algum evento ocorra. Os eventos podem ser: Inserção, Atualização e Deleção.

Características:
* Possui sua execução automática, não podendo ser executado manualmente.
* Não possuem parâmetros como as procedures.
* Garante maior integridade dos dados, visto que alguns dados podem ser gerados diretamente através do banco.

Onde aplicamos:
* Geração de histórico de manipulação dos dados, afim de uma auditoria nas tabelas.
* Propagação de Atualização de dados. Ex: Atualização de saldo do produto.
* Inserção de Dados. Ex: disparar as parcelas de um contas à pagar quando efetuar uma venda.
* Deleção em Cascata de Dados. Ao excluir o aluno excluir automaticamente todo seu histórico.

Tabelas temporárias:
* Para cada evento será(ão) utilizada(s) a(s) tabela(s) temporária(s) que mantem informações que foram manipuladas, essas informações poderão ser utilizadas.
* Eventos:
Inserção: Tabela inserted.
Exclusão: Tabela deleted.
Atualização: tabela deleted e inserted respectivamente.

Considere as tabelas:
~~~sql
CREATE TABLE PRODUTO
(
  CODIGO INT,
  DESCRICAO VARCHAR(50),
  SALDO INT
)

CREATE TABLE HISTORICO 
(
CODIGO INTEGER IDENTITY,
DESCRICAO VARCHAR(400)
)
~~~
Exemplo 1: Imprime o total de registros inseridos.
~~~sql
CREATE TRIGGER TG_PRODUTO ON PRODUTO
FOR INSERT
AS
BEGIN
  IF (SELECT COUNT(*) FROM INSERTED) = 1
PRINT 'O REGISTRO FOI CRIADO COM SUCESSO'
END
~~~
Exemplo 2: Gerar histórico quando o registro é atualizado.
~~~sql
CREATE TRIGGER TG_PRODUTO_hISTORICO ON PRODUTO
	FOR UPDATE
	AS
	BEGIN
          DECLARE @INSERIU INTEGER
          DECLARE @APAGOU INTEGER
          DECLARE @PRODUTO VARCHAR(50)
          SET @INSERIU = (SELECT COUNT(*) FROM INSERTED)
          SET @APAGOU =  (SELECT COUNT(*) FROM DELETED)
          SET @PRODUTO = (SELECT DESCRICAO FROM INSERTED)

	  IF (@INSERIU >0 AND @APAGOU>0)
	     INSERT INTO HISTORICO
	VALUES
           ('O PRODUTO '+@PRODUTO+' FOI ATUALIZADO COM SUCESSO!')
	END
~~~

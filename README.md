# SQLServer
Repositório destinado a conteúdos e Scripts de SQLSERVER.

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

#### Cláusula Where
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

#### Cláusula Order By
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

#### Cláusula Distinct
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

####Cláusula Top
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

#### Update
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


#### Delete
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












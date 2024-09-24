# Insert
O INSERT é um comando DML (Data Manipulation Language) utilizado para executar inclusão de dados em uma tabela. Os valores podem ser informados exclusivamente ou em conjunto, resultado de um comando SELECT.

Considere a tabela abaixo:
```
CREATE TABLE PRODUTOS
(
  ID INTEGER,
  DESCRICAO VARCHAR(50),
  CADASTRO  DATE, 
  SALDO INTEGER, 
  PRECO DECIMAL(15,2),
  SITUACAO  CHAR(1)
)
```

#### Exemplo 1: Inserindo dados em todos os campos especificando todas as colunas e todos os valores.
```
INSERT INTO PRODUTOS  
(ID, DESCRICAO, CADASTRO, SALDO, PRECO, SITUACAO)  
VALUES  
(1,'MACARRÃO','01/01/1997',385,3.76, 'A')  
```

#### Exemplo 2: Inserindo dados em todos os campos especificando apenas os valores
Obs: Só poderá ser omitido o nome dos campos pois todos os valores estão sendo informados respectivamente segundo a ordem definida na tabela.
```
INSERT INTO PRODUTOS  
VALUES  
(1,'FEIJÃO','01/01/1997',350,1.02, 'A')  
```

#### Exemplo 3: Inserindo dados em parte dos campos especificando campos e seus respectivos valores
```
INSERT INTO PRODUTOS  
(ID, DESCRICAO, PRECO)  
VALUES  
(1,'ARROZ',5.14)  
```

#### Exemplo 4: Inserindo dados em todos os campos especificando alguns valores nulos
```
INSERT INTO PRODUTOS  
(ID, DESCRICAO, CADASTRO, SALDO, PRECO)  
VALUES  
(1,'FARINHA', NULL, NULL, NULL) 
```
 
#### Exemplo 5: Inserindo múltiplos registros em apenas insert
```
INSERT INTO PRODUTOS
(ID, DESCRICAO, CADASTRO, SALDO, PRECO)  
VALUES  
(1,'ARROZ','01/01/1997',10,13.76),
(2,'FEIJÃO','01/01/2000',11,3.11),
(3,'MACARRÃO','01/01/2000',34,7.88),
(4,'OLEO','01/01/1996',69,3.33),
(5,'SAL','01/01/1994',73,1.70),
(6,'AÇUCAR','01/01/1997',35,6.92)
```

#### Observações
* Os tipos que representam texto deverão ser informados entre aspas simples(').
* Os tipos que representam data deverão ser informados entre aspas simples('). A data informada deverá ser uma data válida, caso não seja o banco irá disparar um erro.

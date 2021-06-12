# Alter Table
Comando que permite que seja alterado uma tabela. O comando será utilizado juntamente com outra definição, por exemplo a de inserir uma coluna. 

#### Considere a tabela:
```
CREATE TABLE PRODUTOS
(
	ID INTEGER IDENTITY,
	DESCRICAO VARCHAR(50),
	SALDO INTEGER, 
	PRECO DECIMAL(15,2),
	SITUACAO CHAR(1)
)
```

#### Inserindo uma coluna
Para inserir uma coluna deverá ser utilizado a operação add. Poderá ser utilizado um valor default.

#### Exemplo 1:
```
ALTER TABLE PRODUTOS ADD VALIDADE DATE DEFAULT GETDATE()
```
#### Exemplo 2:
```
ALTER TABLE PRODUTOS ADD GRUPO VARCHAR(50)
```

#### Alterando uma coluna
Para alterar uma coluna basta utilizar o comando altercolumn.

#### Exemplo 1: 
```
ALTER TABLE PRODUTOS ALTER COLUMN PRECO DECIMAL(15,3) 
```

#### Excluindo uma coluna
Para Excluir uma coluna deverá ser utilizado a operação drop.

#### Exemplo 1:
```
ALTER TABLE PRODUTOS DROP COLUMN SITUACAO
```

#### Alterando uma coluna Identity
Para alterar o valor do identificador deverá ser utilizado um comando DBCC. Vejamos.

#### Exemplo 1:
```
DBCC CHECKIDENT ('PRODUTOS', RESEED, 10);
```

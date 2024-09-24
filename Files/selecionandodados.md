# Select
O SELECT é um comando DQL (Data Query Language) utilizado para executar consultas de dados no banco de dados. É possível consultar uma ou várias tabelas e listar uma ou várias colunas. O Caractere (*) representa todas as colunas. Todas as linhas serão exibidas naturalmente. A cláusula FROM determina a tabela de origem.

#### Exemplo 1: Selecionando todas as colunas
```
SELECT * 
  FROM PRODUTOS
```
#### Exemplo 2: Selecionando parte das colunas
```SELECT DESCRICAO, 
  PRECO
  FROM PRODUTOS
```
#### Exemplo 3: Selecionando colunas e montando expressões
```
SELECT SALDO, 
  PRECO, 
  SALDO * PRECO
  FROM PRODUTOS
```
#### Exemplo 4: Selecionando colunas e montando expressões com valores fixo
```
SELECT SALDO, 
  PRECO, 
  SALDO * 1.5
  FROM PRODUTOS
```
## Alias
O alias é um rotulo que poderá ser definido para uma coluna ou uma expressão.

#### Exemplo 1: Rótulo com uma palavra sem espaços
```
SELECT SALDO AS QTD, PRECO, SALDO * PRECO AS PRECO_VENDA
  FROM PRODUTOS
```
#### Exemplo 2: Rótulo com duas ou mais palavras
```
SELECT SALDO, PRECO AS 'PREÇO', SALDO * PRECO AS [PRECO DE VENDA
  FROM PRODUTOS
```

## Inserindo dados de uma consulta
Com o resultado de um comando SELECT é possível inserir os dados em uma tabela.

#### Exemplo:
```
INSERT INTO PRODUTOS  
(DESCRICAO, CADASTRO, PRECO)  
SELECT NOME, 
  CADASTRO, 
  PRECO*1.4
  FROM MERCADORIA
```

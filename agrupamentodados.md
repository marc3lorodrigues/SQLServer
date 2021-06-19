# Agrupamento de Dados e funções de Agregação
A Cláusula group by do comando SELECT é utilizado para agrupar dados resultantes da consulta. Serão agrupados os valores iguais de uma determinada coluna. A coluna a ser agrupada deverá estar presente na lista de colunas a serem exibidas ou uma função de agregação deverá ser exibida.

#### Exemplo 1: 
```
SELECT DESCRICAO
FROM PRODUTO
GROUP BY DESCRICAO
```
Exemplo 2: 
```
SELECT DESCRICAO
FROM PRODUTO
GROUP BY DESCRICAO
```

## Funções de Agregação
São funções que podem ser utilizadas juntamente como o group by e produzir algum tipo de cálculo. Vejamos:

### AVG
Calcula a Média dos valores não nulos de uma coluna numérica.

#### Exemplo 1:Irá exibir um único valor com a média geral do saldo.
```
SELECT AVG(SALDO) AS MEDIA  
FROM PRODUTO  
```
#### Exemplo 2: Irá calcular a média do preço agrupado por situação.
```
SELECT SITUACAO, AVG(PRECO) AS MEDIA  
FROM PRODUTO  
GROUP BY SITUACAO 
```

### SUM
Soma os valores não nulos de uma coluna numérica.

#### Exemplo 1:Irá exibir um único valor com a soma geral do saldo.
```
SELECT SUM(SALDO) AS SOMA
FROM PRODUTO  
```

#### Exemplo 2: Irá calcular a soma do preço agrupado por situação.
```
SELECT SITUACAO, SUM(PRECO) AS SOMA
FROM PRODUTO  
GROUP BY SITUACAO 
```

### MAX
Encontra o maior valor de uma coluna.

#### Exemplo 1:Irá exibir o maior valor da coluna
```
SELECT MAX(SALDO) AS MAIOR
FROM PRODUTO  
```

#### Exemplo 2: Irá exibir o maior valor da coluna agrupado por situação
```
SELECT SITUACAO, MAX(PRECO) AS MAIOR
FROM PRODUTO  
GROUP BY SITUACAO 
```

### MIN
Encontra a menor valor de uma coluna.

#### Exemplo 1: Irá exibir o menor valor da coluna
```
SELECT MAX(SALDO) AS MAIOR
FROM PRODUTO  
```
#### Exemplo 2: Irá exibir o menor valor da coluna agrupado por situação
```
SELECT SITUACAO, MAX(PRECO) AS MAIOR
FROM PRODUTO  
GROUP BY SITUACAO 
```

### COUNT
Conta a quantidade de ocorrências não nulas de uma coluna. Quando for utilizado o (*) ele irá considerar todas as colunas da tabela.

#### Exemplo 1:Conta a quantidade de registros da tabela
```
SELECT COUNT (*) AS QTD
FROM PRODUTO
```

#### Exemplo 2: Seleciona apenas na coluna descrição os valores não nulos.
```
SELECT COUNT (DESCRICAO) AS QTD
FROM PRODUTO
```

#### Exemplo 3: Seleciona apenas na coluna descrição os valores não nulos agrupados por situação.
```
SELECT SITUACAO, COUNT (DESCRICAO) AS QTD
FROM PRODUTO
GROUP BY SITUACAO
```

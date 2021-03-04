# Cláusula Distinct
Cláusula do comando SELECT utilizada distinguir os valores uns dos outros, fazendo assim a exibição de um valor uma única vez. Devemos observar que ele considera para a distinção os valores exibidos pelas colunas do select.

## Exemplo 1: O exemplo irá trazer apenas uma ocorrência de cada valor da coluna
SELECT DISTINCT SITUACAO 
  FROM PRODUTOS

## Exemplo 2: O exemplo irá trazer apenas uma ocorrência de cada par de valores das respectivas colunas
SELECT DISTINCT SITUACAO, SALDO
  FROM PRODUTOS

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

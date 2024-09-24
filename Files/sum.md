
### SUM
Soma os valores não nulos de uma coluna numérica.

#### Exemplo 1: Irá exibir um único valor com a soma geral do saldo.
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

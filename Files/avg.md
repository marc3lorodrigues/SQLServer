### AVG
Calcula a Média dos valores não nulos de uma coluna numérica.

#### Exemplo 1: Irá exibir um único valor com a média geral do saldo.
```
SELECT AVG(SALDO) AS MEDIA  
FROM PRODUTO  
```
#### Exemplo 2: Irá calcular a média do preço agrupado por situação.
```
SELECT SITUACAO, AVG(PRECO) AS MEDIA  
FROM PRODUTO  
GROUP BY SITUACAO 


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

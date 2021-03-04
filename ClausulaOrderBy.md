# Cláusula Order By
O ORDER BY da instrução SELECT indica que o resultado de uma instrução SELECT deve ser ordenado através das colunas no sentido informado. Sentido = direção da ordenação. Pode ser Ascendente e Descendente. Quando não informado o sentido o mesmo será ascendente. Também poderá ser informado o número da coluna na consulta.

## Exemplo 1: 
```
SELECT * 
  FROM PRODUTOS ORDER BY CODIGO
```

## Exemplo 2: 
```
SELECT * 
  FROM PRODUTOS 
 ORDER BY SITUACAO, DESCRICAO DESC
```

## Exemplo 3: 
```
SELECT * 
  FROM PRODUTOS ORDER BY 3,2
```

# Junção Horizontal
Junções Horizontais em que o registro de uma tabela e de outra se complementam, tornando-se um só registro com a quantidade somada de suas colunas, tais como: Cross Join, Inner Join e Outer Join. Para execução dos códigos abaixo execute o script do arquivo

### Cross Join
O comando irá trazer todos os registros. Irá listar pra cada registro da tabela da esquerda todos os registros da tabela da direita, formando um produto cartesiano. 

#### Exemplo 1: 
```
SELECT *  
FROM MARCA CROSS JOIN MODELO 
```
### Inner Join
Permite trazer um conjunto de dados de tabelas onde os campos estão relacionados através de igualdade. O comando impõe obrigatoriedade, ou seja trará apenas registros onde os valores de comparação são iguais nas duas tabelas da relação.

#### Exemplo 1: 
```
SELECT *  
  FROM MARCA  
	INNER JOIN MODELO  
       ON MARCA.MARCA_ID = MODELO.MARCA_ID 
```

### Outer Join
Permite trazer um conjunto de dados de tabelas onde os campos estão relacionados através de igualdade. O comando não impõe obrigatoriedade, ou seja, trará registros onde os valores de comparação são iguais nas duas tabelas da relação, e os registros onde os valores de comparação não são iguais nas duas tabelas da relação. A cláusula OUTER JOIN possui os tipos: Left, Right e Full.

### Left
Considera a tabela da esquerda, ou seja, considerará todos os registros da tabela da esquerda mesmo que a mesma não possua registros de referência na tabela da direita.

#### Exemplo 1: 
```
SELECT *  
  FROM MARCA  
       LEFT OUTER JOIN MODELO ON 
MARCA.MARCA_ID = MODELO.MARCA_ID 
```
### Right
Considera a tabela da direita, ou seja, considerará todos os registros da tabela da direita mesmo que a mesma não possua registros de referência na tabela da esquerda. 

#### Exemplo 1:
```
SELECT *  
  FROM MARCA  
       RIGHT OUTER JOIN MODELO ON
MARCA.MARCA_ID = MODELO.MARCA_ID 
```
### Full
Considerará todos os registros das duas tabelas, ou seja, considera todos os registros que possuem relação e os que não possuem relação.

#### Exemplo 1:
```
SELECT *  
  FROM MARCA  
  FULL OUTER JOIN MODELO ON
       MARCA.MARCA_ID = MODELO.MARCA_ID
```

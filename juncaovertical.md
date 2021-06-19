# Junção Vertical
Junções Verticais em que o registro de uma tabela se junta totalizando o número de registro dependendo do operador de conjunto utilizado. 

## Conjunto Regulares
Conjuntos regulares são resultados de instruções SELECT. Que têm a mesma quantidade de colunas, não precisando ter o mesmo nome Cujas colunas têm os mesmos tipos de dados, entretanto, se o tipo de dado for CHAR ou VARCHAR, o tamanho também tem que ser o mesmo.

Considere  as imagens abaixo: <br>
- Ingrediente <br>
![ingrediente](https://github.com/marc3lorodrigues/SQLServer/blob/main/Ingredientes.png?raw=true "Tabela de ingredientes") <br>

- Produto <br>
![produto](https://github.com/marc3lorodrigues/SQLServer/blob/main/Produto.png?raw=true "Tabela de Produtos") <br>


### Union All
Une dos conjuntos regulares mostrando todas as linhas das duas tabelas, mesmo que uma linha já tenha sido mostrada.

#### Exemplo 1: 
``` 
SELECT ING_ID, ING_DESCRICAO  
  FROM INGREDIENTE  
 UNION ALL  
SELECT PRO_ID, PRO_DESCRICAO  
  FROM PRODUTO 
``` 

### Union
Une dos conjuntos regulares mostrando todas não coincidentes e as que são coincidentes será exibida uma única vez.

#### Exemplo 1:
``` 
SELECT ING_ID, ING_DESCRICAO  
  FROM INGREDIENTE  
 UNION  
SELECT PRO_ID, PRO_DESCRICAO  
  FROM PRODUTO 
``` 

### Intersect
Apresenta apenas as linhas que onde os conteúdos são coincidentes e apenas os coincidentes, ou seja, possuem nas duas tabelas.

#### Exemplo 1: 
``` 
SELECT ING_ID, ING_DESCRICAO  
  FROM INGREDIENTE  
 INTERSECT  
SELECT PRO_ID, PRO_DESCRICAO  
  FROM PRODUTO  
``` 

### Except
Apresenta apenas as linhas do primeiro conjunto regular, e os conteúdos que não são coincidentes.

#### Exemplo 1:
``` 
SELECT ING_ID, ING_DESCRICAO  
  FROM INGREDIENTE  
EXCEPT  
SELECT PRO_ID, PRO_DESCRICAO  
  FROM PRODUTO  
``` 




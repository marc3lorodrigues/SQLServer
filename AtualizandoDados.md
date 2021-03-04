# Update
O UPDATE é um comando DML (Data Manipulation Language) utilizado para executar alteração de dados em uma tabela. Os campos a serem alterados deverão ser especificados pela cláusula SET. Deve-se ter cuidado pois quando não utilizado a cláusula where todos os registros serão atualizados.

## Exemplo 1: Atualizando uma coluna nos registros que atendem o critério da situação
```
UPDATE PRODUTOS 
   SET SALDO = 0  
 WHERE SITUACAO='I'  
```
## Exemplo 2: Atualizando mais de uma coluna
```
UPDATE PRODUTOS 
   SET SALDO = 10,  
       PRECO = PRECO * 1.1  
 WHERE SITUACAO='I'  
```
## Exemplo 3: Atualizando todos os registros da tabela
```
UPDATE PRODUTOS
   SET SITUACAO='A'  
```

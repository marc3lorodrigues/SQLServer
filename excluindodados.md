#Delete
O DELETE é um comando DML (Data Manipulation Language) utilizado para executar exclusão de dados em uma tabela. Deve-se ter cuidado pois quando não utilizado a cláusula WHERE todos os registros serão excluídos.

####Exemplo 1: 
DELETE PRODUTOS
 WHERE SITUACAO='A'  

####Exemplo 2: 
DELETE PRODUTOS
 WHERE SITUACAO='A'  
   AND PRECO >3  

####Exemplo 3: 
DELETE PRODUTOS
 WHERE SITUACAO='A'  
    OR DESCRICAO NOT LIKE '%E%' 

####Exemplo 4: 
DELETE PRODUTOS

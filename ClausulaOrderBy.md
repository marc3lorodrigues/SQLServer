# Cláusula Where
Cláusula do comando SELECT utilizado para determinar uma condição que será uma Expressão lógica. A Expressão poderá possuir operadores lógicos, de conjunto, Aritméticos, e relacionais. Será utilizada principalmente para determinar um filtro a consulta.

## Exemplo 1: Apenas os maiores de 2.
SELECT *  
  FROM PRODUTOS
 WHERE PRECO >2  

## Exemplo 2: Apenas os maiores de 5.78.
SELECT *  
  FROM PRODUTOS
 WHERE PRECO >=5.78 

## Exemplo 3: Exatamente os 3 itens.
SELECT *  
  FROM PRODUTOS
 WHERE CODIGO IN (4,2,9)  

## Exemplo 4: Quando as 2 condições forem verdadeiras.
SELECT *  
  FROM PRODUTOS
 WHERE CODIGO BETWEEN 5 AND 8  
   AND PRECO >=5.78  

## Exemplo 5: Quando as 2 condições forem verdadeiras.
SELECT *  
  FROM PRODUTOS
 WHERE DESCRICAO LIKE 'A%'  
   AND CODIGO IN (4,2,9)  

## Exemplo 6: Quando a Descrição possui a letra a.
SELECT *  
  FROM PRODUTOS
 WHERE DESCRICAO LIKE '%A%'  

## Exemplo 7: Quando a descrição termina com a.
SELECT *  
  FROM PRODUTOS
 WHERE DESCRICAO LIKE '%A' 

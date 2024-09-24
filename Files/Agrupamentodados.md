# Agrupamento de Dados e funções de Agregação
A Cláusula group by do comando SELECT é utilizado para agrupar dados resultantes da consulta. Serão agrupados os valores iguais de uma determinada coluna. A coluna a ser agrupada deverá estar presente na lista de colunas a serem exibidas ou uma função de agregação deverá ser exibida.

#### Exemplo 1: 
```
SELECT DESCRICAO
FROM PRODUTO
GROUP BY DESCRICAO
```


#### Funções de Agregação
São funções que podem ser utilizadas juntamente como o group by e produzir algum tipo de cálculo. Vejamos:
 * [AVG](avg.md) <br>
 * [SUM](sum.md) <br>
 * [MAX](max.md) <br>
 * [MIN](min.md) <br>
 * [COUNT](count.md) <br>

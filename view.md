# Visões
É uma estrutura que armazena uma instrução Select e simula outra tabela a partir do conjunto de registros resultante dessa instrução. Tem seu funcionamento semelhante a uma tabela, mas não é uma. Permite fornecer subconjuntos e super-conjuntos de dados de uma ou mais tabelas. Permite que seja montado uma consulta baseada em um cenário. OBS: A cláusula ORDER BY é proibida na instrução <select> da visão, sendo permitido ordenar o resultado de um select na visão.

#### Exemplo 1: Criando uma view de clientes e notas.
``` 
CREATE VIEW VWVENDAS_CLIENTE 
AS
SELECT CLIENTE.NOME, NOTA.VALORTOTAL
  FROM NOTAFISCAL
  	  INNER JOIN CLIENTE 
     ON CLIENTE.ID = NOTA.CLIENTE_ID
``` 
#### Exemplo 2: Usando uma view.
SELECT * 
  FROM VENDAS_CLIENTE 
 WHERE VALORTOTAL >1000

#### Exemplo 3: Criando uma views de marcas ativas
CREATE VIEW VWMARCAS_ATIVAS
AS
	SELECT MARCA_ID, NOME 
  FROM MARCA 
 WHERE SITUACAO='A'

#### Exemplo 4: Usando a view.
SELECT * FROM VW_MARCAS_ATIVAS ORDER BY NOME

#### Exemplo 5: Alterando uma visão.
ALTER VIEW VWMARCAS_ATIVAS
AS
     SELECT MARCA_ID, NOME 
  FROM MARCA 
 WHERE SITUACAO='I'

#### Exemplo 6: Excluindo uma visão.
``` DROP VIEW VWMARCAS_ATIVAS
``` 


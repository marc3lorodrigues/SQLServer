### COUNT
Conta a quantidade de ocorrências não nulas de uma coluna. Quando for utilizado o (*) ele irá considerar todas as colunas da tabela.

#### Exemplo 1:Conta a quantidade de registros da tabela
```
SELECT COUNT (*) AS QTD
FROM PRODUTO
```

#### Exemplo 2: Seleciona apenas na coluna descrição os valores não nulos.
```
SELECT COUNT (DESCRICAO) AS QTD
FROM PRODUTO
```

#### Exemplo 3: Seleciona apenas na coluna descrição os valores não nulos agrupados por situação.
```
SELECT SITUACAO, COUNT (DESCRICAO) AS QTD
FROM PRODUTO
GROUP BY SITUACAO
```

# Criando Índice
O comando para criar um Índice pode-se utilizar um comando DDL, o Create Index. 

#### Exemplo 1: Criando índice com 1 campo.
``` 
CREATE INDEX IX_PRODUTO_DESCRICAO ON PRODUTO (DESCRICAO)
``` 
#### Exemplo 2: Criando índice com 2 campo.
``` 
CREATE INDEX IX_PRODUTO_DESCRICAO ON PRODUTO (DESCRICAO, GRUPO)
``` 

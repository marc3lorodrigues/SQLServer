# CreateTable
Tabelas são os legítimos repositórios de dados de um banco de dados. Sua estrutura é definida como a de uma tabela do Modelo Relacional.
Exemplo:
```
CREATE TABLE CLIENTE
(
  CODIGO INTEGER NOT NULL,
  NOME VARCHAR(50),
  NASCIMENTO DATE,
  SEXO CHAR(1) NOT NULL,
  RENDAMENSAL DECIMAL(15,2)
)
```

## Coluna Identity
O SQLServer possui uma característica a colunas do tipo inteiro que permite que seja gerado um valor automaticamente. A coluna não poderá receber valor.

Exemplo:
```
CREATE TABLE CLIENTE
(
  CODIGO INTEGER IDENTITY(1,5),
  NOME VARCHAR(50)
)
```
#### Onde:	1 é o valor que a numeração deverá iniciar. 5 é o número que define a cada inserção feita na tabela.


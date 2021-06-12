# Constraint de Unique
Define que a coluna da tabela é única, não podendo possuir valores repetidos. OBS: um valor da coluna poderá ser nulo NULL.

#### Exemplo 1: Na criação da Tabela.
```
CREATE TABLE VEICULO
(
PLACA CHAR(7),
MARCA VARCHAR(30),
MODELO VARCHAR(30),
ANOMODELO INTEGER,
CONSTRAINT UNQ_PLACA UNIQUE (PLACA)
)
```
#### Exemplo 2: Na alteração da tabela.
```
ALTER TABLE VEICULO
ADD CONSTRAINT UNQ_PLACA UNIQUE (PLACA)
```


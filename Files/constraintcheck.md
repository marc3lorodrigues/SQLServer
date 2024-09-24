# Constraint de Check
Define que a coluna da tabela possui uma condição a ser respeitada. A condição é criada segundo uma expressão lógica. Tanto para inserir como para atualizar dados de uma tabela deverá ser respeitada a condição.

#### Exemplo 1: Na construção da tabela.
```
CREATE TABLE VEICULO
(
	PLACA CHAR(7) NOT NULL,
	MARCA VARCHAR(30),
	MODELO VARCHAR(30),
	ANOFABRICACAO INTEGER,
	ANOMODELO INTEGER,
	CONSTRAINT CHK_MARCA CHECK(MARCA IN('FIAT','VW')),
	CONSTRAINT CHK_ANOMODELO CHECK(ANOMODELO<> 2013)
)
```

#### Exemplo 2: Na Alteração.
```
ALTER TABLE VEICULO
ADD CONSTRAINT CHK_MARCA CHECK(VEI_MARCA IN('FIAT','VW'))
```
#### Exemplo 3: Na Alteração.
```
ALTER TABLE VEICULO
  ADD CONSTRAINT CHK_ANOMODELO CHECK(ANOMODELO<>2014)
```

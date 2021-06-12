# Constraint de primary Key
Chave primária é um recurso utilizado em bancos relacionais onde a sua definição irá permitir que uma ou mais colunas que identifique uma linha da tabela. Outra função da PRIMARY KEY é ser o campo de referência em outra tabela a fim de manter integridade referencial.

## Características:
* Não Pode ser Nulo.
*	Identificará a linha.
*	Terá um índice definido.
*	Poderá ser referenciada em outra tabela a fim de definir integridade referencial.
*	Pode ser simples (Possui um único campo) ou composta (possui dois ou mais campos).
*	Se a chave primária é composta, os valores de cada campo podem se repetir, mas não a combinação desses valores.
*	Toda chave primária irá criar um objeto chamado Constraint.

#### Exemplo 1: Na criação da tabela
```CREATE TABLE MARCA
(
ID INT NOT NULL,
DESCRICAO VARCHAR(50)
CONSTRAINT PK_MARCA PRIMARY KEY (ID)
)
```
#### Exemplo 2: Na criação da tabela
```ALTER TABLE MARCA
ADD CONSTRAINT PK_MARCA PRIMARY KEY (ID)
```

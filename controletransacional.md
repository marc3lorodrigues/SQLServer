# Controle Transacional
O controle transacional é um recurso disponível em vários SGBD’s e faz isso através de um recurso chamado transação. A transação É uma unidade lógica criada na memória a fim de trabalhar com dados temporariamente através de diversas operações. Caso a operação seja confirmada os dados serão confirmados no banco (COMMIT), Caso a operação não seja confirmada no banco (ROLLBACK) os dados não serão confirmados no banco. Para a criação de uma transação deverá ser utilizado os comandos BEGIN TRANSACTION, COMMIT e ROLLBACK. O controle de transações garante que se a transação executar atualizações e ocorrer uma falha antes de seu término então essas atualizações serão desfeitas.

### Características:
* As transações são atômicas (tudo ou nada).
* As transações são isoladas umas das outras.
* Um programa só pode executar uma instrução BEGIN TRANSACTION quando não tiver outra transação em andamento.

### Nível de Isolamento:
É a forma no qual os comandos, dados externos, e outras transações enxergam os dados trabalhados dentro de uma transação.

#### Exemplo 1: O Código Abaixo irá inserir um registro na tabela de produto e o mesmo será confirmado.
```
BEGIN TRANSACTION
INSERT INTO PRODUTO
VALUES 
(1,'SAPATO',3,151.0,1)
COMMIT
```
Exemplo 2: O Código Abaixo irá inserir um registro na tabela de produto e o mesmo não será confirmado.
```BEGIN TRANSACTION
INSERT INTO PRODUTO
VALUES 
(1,'SAPATO',3,151.0,1)
ROLLBACK
```
### Check Points
O comando permite que seja criado um ponto de restauração de forma que possa ser desfeitas todos os comandos executados após o ponto salvo. Vários pontos poderão ser criados e poderá ser restaurado a qualquer ponto também.

#### Exemplo 1: O Exemplo irá restaurar até o ponto t1 e gravará apenas o produto 1 e 2.
``` 
BEGIN TRANSACTION
INSERT INTO PRODUTO VALUES (1,'CAMISA',1,112.0)
INSERT INTO PRODUTO VALUES (2,'CALÇA',3,112.0)
SAVE TRANSACTION T1
INSERT INTO PRODUTO VALUES (3,'GRAVATA',2,112.0)
SAVE TRANSACTION T2
INSERT INTO PRODUTO VALUES (5,'MEIA',4,112.0)
SAVE TRANSACTION T3
INSERT INTO PRODUTO VALUES (6,'SAPATO',2,112.0)
ROLLBACK TRANSACTION T1
COMMIT
```
#### Exemplo 2: O exemplo irá restaurar até o ponto t3 e gravará apenas o produto 1 e 5.
```
BEGIN TRANSACTION
  INSERT INTO PRODUTO VALUES (1,'CAMISA',1,112.0)
  INSERT INTO PRODUTO VALUES (2,'CALÇA',3,112.0)
  SAVE TRANSACTION T1
  INSERT INTO PRODUTO VALUES (3,'GRAVATA',2,112.0)
  SAVE TRANSACTION T2
  
  INSERT INTO PRODUTO VALUES (5,'MEIA',4,112.0)
  SAVE TRANSACTION T3
  
  INSERT INTO PRODUTO VALUES (6,'SAPATO',2,112.0)
  ROLLBACK TRANSACTION T3
  COMMIT
``` 


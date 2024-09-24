# Variáveis
As variáveis são locais na memória que podem armazenar dados temporariamente. As variáveis podem ser utilizadas diretamente como comando, ou dentro de alguma estrutura de lote: exemplo: Procedures, triggers. Deverá ter como prefixo o caractere “@”. Para declaração de variáveis poderá ser utilizado o comando DECLARE.

## Definindo Variáveis:
#### Exemplo 1:
```
DECLARE @N1 AS INTEGER
DECLARE @N2 AS INTEGER
```

#### Exemplo 2:
```
DECLARE @NASCIMENTO DATE, @NOME VARCHAR(10) @FONE VARCHAR(9)
```

## Atribuindo valores
Para definir um valor a uma variável poderá ser utilizado o comando SET.

#### Exemplo 1:
```
SET @NASCIMENTO = '01/01/2012'
SET @NOME = (SELECT CLI_NOME FROM CLIENTE)
SET @FONE = '9998-2354'
```

## Atribuindo com Select
Uma variável pode receber um valor vindo de uma coluna em um select. Obs: o select deverá retornar apenas 1 linha.
#### Exemplo 1:
```
SELECT @TOTAL=TOTAL FROM NOTAFISCAL
PRINT @TOTAL
```



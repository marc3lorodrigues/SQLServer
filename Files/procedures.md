# Procedures
São códigos armazenados no banco de dados através objetos que poderão ser executados a qualquer momento em uma interface nativa com banco ou chamada através de um software.

### Criando uma procedure

#### Exemplo 1: Abaixo temos uma procedure simples e sem utilização de parâmetros.
```
CREATE PROCEDURE SP_IMPRIMIRHORA
AS
BEGIN
   PRINT CONVERT(VARCHAR(10), GETDATE(),103)
END
```
### Executando uma procedure
Para executar a procedure será utilizado o comando execute ou a abreviação exec.

#### Exemplo 1:
`
EXECUTE SP_IMPRIMIRHORA
`
#### Exemplo 2:
`
EXEC SP_IMPRIMIRHORA
`
### Procedure com parâmetros de entrada
É possível criar procedures que executarão recebendo valores através de parâmetros.

#### Exemplo 1: Atualização de preço.
```
CREATE PROCEDURE SP_AJUSTEPRECO (@INDICE AS INTEGER)
AS
BEGIN
  UPDATE PRODUTO 
     SET PRECO = PRECO*@INDICE/100+PRECO
END
```
#### Exemplo 2: Executando a procedure
```
EXEC SP_AJUSTEPRECO 30
```
### Procedure com parâmetro de saída
É possível criar procedures que executarão e devolvem um determinado resultado.

#### Exemplo 1: Atualiza o preço e retorna o saldo total de produtos.
```
CREATE PROCEDURE SP_ATUALIZA(@PRECO DECIMAL(18,2), @TOTAL DECIMAL(18,2) OUTPUT)
AS
BEGIN
  UPDATE PRODUTO
     SET PRECO = @PRECO
  SET @TOTAL = (SELECT COUNT(*) FROM PRODUTO)
END
```

#### Exemplo 2: Utilizando a procedure
```
DECLARE @VALOR AS DECIMAL(18,2)
EXECUTE SP_ATUALIZA 10, @VALOR
PRINT @VALOR
```


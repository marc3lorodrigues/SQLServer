# Estrutura de Decisão
São estruturas que podem ser utilizadas no código para que seja feita uma tomada de decisão.

## Comando if
Comando responsável pela avaliação uma expressão lógica e direcionamento da execução do programa. Quando o bloco possuir mais de uma instrução deverá ser definido seu início e seu fim com begin...end.

#### Exemplo 1:
```
BEGIN
  DECLARE @NOTA1 DECIMAL(10,2)
  DECLARE @NOTA2 DECIMAL(10,2)
  DECLARE @MEDIA DECIMAL(10,2)
  SET @NOTA1 = 7
  SET @NOTA2 = 0
  SET @MEDIA = (@NOTA1+@NOTA2)/2
  IF @MEDIA >6.0
		PRINT 'APROVADO'
  ELSE IF @MEDIA >4.0
	PRINT 'EXAME'
  ELSE
		PRINT 'REPROVADO'
END;
```

## Comando Select Case
Comando responsável pela escolha de uma opção entre N opções. Tem como característica a definição de uma expressão e opções de valores que são comparadas e utilizadas na comparação.

#### Exemplo 1:
```
SELECT DESCRICAO,
       SALDO,
       CASE WHEIN SITUACAO='A' THEN 
'ATIVO'
       CASE WHEIN SITUACAO='I' THEN 
'INATIVO'
       ELSE
         'ERRO'
       END AS SITUACAO
FROM PRODUTOS
```


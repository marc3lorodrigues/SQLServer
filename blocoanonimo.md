# Bloco Anônimo
Um bloco anônimo pode ser definido através dos comandos begin e end. O bloco pode ser definido por exemplo em alguma ferramenta que permite a execução de comandos TSQL. O código não ficará armazenado em um objeto no banco de dados. O comando PRINT poderá imprimir um conteúdo no console.

#### Exemplo 1:
```
BEGIN
DECLARE @NOTA1 DECIMAL(10,2)
DECLARE @NOTA2 DECIMAL(10,2)
DECLARE @MEDIA DECIMAL(10,2)

SET @NOTA1 = 7
SET @NOTA2 = 2
SET @MEDIA = (@NOTA1+@NOTA2)/2
PRINT @MEDIA
END;
```


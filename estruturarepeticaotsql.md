# Estrutura de Repetição
São estruturas que podem ser utilizadas no código para que um bloco seja repetido N vezes.

## while
Possui a característica de avaliar a condição antes da execução do bloco. Caso a condição não seja verdadeira. Não será possível executar o bloco definido no laço. Para essa estrutura o controle de interações é feito através de uma condição.

#### Exemplo 1:
```
DECLARE @V1 AS INTEGER = 0
WHILE @V1 <=10
BEGIN
	PRINT @V1
	SET @V1 = @V1+1
END
```



# Funções de Manipulação de Dados
São funções que tem como objetivo fazer manipulação de dados. São divididas em: Conversão de dados, Data, Nulo, texto e Outros.

## Funções de Conversão:
São funções que tem como objetivo fazer conversão de dados.

### CAST
Converte dados para um tipo determinado. Caso defina um valor menor a string será cortada.

#### Exemplo 1:
```
SELECT CAST(IDADE AS VARCHAR(10))+'-'+NOME AS PACIENTE
FROM PACIENTE
```
### CONVERT
Possui uma função similar ao cast porem poderá ser especificado um estilo para conversão.

#### Exemplo 1:
```
SELECT CONVERT(VARCHAR(10), DATA_INTERNAMENTO,103) +'-'+ NOME AS INTERNAMENTO 
FROM PACIENTE
```

## Funções de Null:
São funções que tem como objetivo fazer tratamento com valores nulos.

### ISNULL
Retorna um determinado valor caso a expressão seja nula.
Exemplo 1:
```
SELECT ISNULL(NOME,'NÃO EXISTE') AS NOME
   FROM PACIENTE
```

### COALESCE
Retorna a primeira expressão não NULL entre os seus argumentos.

Exemplo 1: 
```
SELECT COALESCE(	NOME, 
				CAST(DATA_INTERNAMENTO AS VARCHAR(10)),
			CAST(IDADE AS VARCHAR(10)),
		CAST(VLR_INTERNAMENTO AS VARCHAR(10))) 
		  AS 'NAO NULO'
  FROM PACIENTE
```


## Funções de String:
São funções que permite a manipulação de strings.

### CONCAT
Concatena duas ou mais string.

Exemplo 1:
```
SELECT CONCAT('BANCO', 'DE', 'DADOS')
```

### SUBSTRING
Recupera uma parte do input string.

Exemplo 1:
```
SELECT SUBSTRING(CONVERT(VARCHAR(10),GETDATE(),103),0,6) AS DIAMES
```

### UPPER
Converte os caracteres para maiúsculo.

Exemplo 1: 
```
SELECT UPPER(NOME) FROM CLIENTE
```

### LOWER
Converte os caracteres para minúsculo.

Exemplo 1: 
```
SELECT LOWER ('LINGUAGEM DE ACESSO BANCO DE DADOS') AS MINUSCULO
```

### LTRIM
Remove os espaços a esquerda de uma string.
Exemplo: 
```
SELECT LTRIM('                       REMOVE OS ESPAÇOS A ESQUERDA') AS ESQUERDA
```

### RTRIM
Remove os espaços a direita de uma string.
Exemplo: 
```
SelectLTRIM('remove os espaços a esquerda                                              ') as Direita
```


### REPLACE
Substitui todas as ocorrências de uma determinada string em uma determinada string.
Exemplo 1: 
```
SELECT REPLACE (NOME,'JOAO','MARIA') FROM CLIENTE
```

## Funções de Data:
São funções que permitem a manipulação de datas como por exemplo adicionar dias, meses ou anos em uma data.

### GETDATE
Função que retorna a data e hora do sistema.
Exemplo 1:
```
SELECT GETDATE()
```

### DATEDIFF
Função que retorna um valor considerando um período. Para isso é necessário informar o intervalo do valor.

Exemplo 1: 
```
SELECT DATEDIFF (YEAR, '01/01/2000', DTNASCIMENTO) FROM CLIENTE
```

### DATEADD
Retorna um valor adicionando um intervalo determinado.

Exemplo 1:
```
SELECT DATEADD(YEAR, -5,DTNASCIMENTO) FROM CLIENTE
```

### DATEPART
Retorna um valor particionado da data.

Exemplo 1: 
```
SELECT DATEPART(YEAR, DTNASCIMENTO) FROM CLIENTE
```

### YEAR
Retorna o valor numérico correspondente ao ano.

Exemplo 1:
```
SELECT YEAR(DTNASCIMENTO) FROM CLIENTE
```

### MONTH
Retorna o valor numérico correspondente ao mês.

Exemplo 1:
```
SELECT MONTH(DTNASCIMENTO) FROM CLIENTE
```

### DAY
Retorna o valor numérico correspondente ao dia.

Exemplo 1: 
```
SELECT DAY(DTNASCIMENTO) FROM CLIENTE
```



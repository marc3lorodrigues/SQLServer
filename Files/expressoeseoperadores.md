# Expressões & Operadores
É uma combinação de valores, operadores e símbolos que tem como objetivo encontrar um determinado valor. Abaixo veremos alguns tipos de expressões.

## Expressões lógicas
São Expressões cujo resultado pode ser apenas verdadeiro ou falso. Possui operandos de qualquer tipo de dado/Expressões e operadores: Relacionais, Lógicos, Conjunto, De Nulo.

### Operadores Relacionais
```
= Igual
Exemplo: cidade='Londrina'
```

```
< Menor
Exemplo: Salario <1000.00
```

```
> Maior
Exemplo: Qtd>10
```

```
<> Diferente
Exemplo: Modelo<>'fusca'
```

```
>= Maior igual
Exemplo: Nascimento>='01/01/2012'
```

```
<= Menor igual
Exemplo: Vencimento<='13/05/1979'
```

### Operadores Lógicos
```
AND = Operador E<br>
Exemplo: Idade >18 AND Idade<60
```

```
OR = Operador OU<br>
Exemplo:Profissao ='Analista' OR Profissao='DBA'
```

```
NOT = Operador Não (negação)<br>
Exemplo: not (valor =10)
```

### Operadores Conjunto
```
IN – Define valores de um conjunto<br> 
Exemplo: COR IN ('PRETA','BRANCA')
```
```
BETWEEN – Define uma faixa de valores<br>
Exemplo: ANOFABRICACAO BETWEEN 2000 AND 2012
```
```
LIKE – Define um coringa para a direção<br>
Exemplo 1: Busca todos os que começam com a letra 'F'.
NOME LIKE 'F%'.

Exemplo 2: Busca todos que o ultimo nome seja silva.
NOME LIKE '%SILVA'. 

Exemplo 3: Busca Todos que possui Oliveira em qualquer parte do nome.
NOME LIKE '%OLIVEIRA%'.
```

### Operador de Nulo
```
IS = Testa de o valor é nulo. 

Exemplo 1: Quando for nulo.
Nome is null

Exemplo 2: Quando não for nulo.
Nome is not null
```

### Operadores matemáticos
```
+ Soma
Exemplo: SELECT 10 + 3
```
```
- Subtração
Exemplo: SELECT 10 - 3
```
```
* Multiplicação
Exemplo: SELECT 10 * 3
```
```
/ Divisão
Exemplo: SELECT 10 / 3
```
```
% Resto da Divisão
Exemplo: SELECT 10 % 3
```







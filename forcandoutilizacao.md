# Forçando a utilização do Índice
Para forçar a utilização do índice basta o referenciar no nome da tabela. Veja o exemplo abaixo.

#### Exemplo 1: 
```
SELECT VEI_PLACA
FROM VEICULO WITH(INDEX = INDEX1 )
```

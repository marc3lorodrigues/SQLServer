# Excluindo Constraint
O comando Drop Constraint pode ser utilizada para apagar constraints de unique, check, primary key e foreign key. Para apagar uma primary key a mesma não pode possuir dependência em uma foreign key .

#### Exemplo 1: Apagando uma constraint de primary key. 
```
ALTER TABLE CLIENTE  
	DROP CONSTRAINT PK_CLIENTE
```

#### Exemplo 2: Apagando uma constraint de check.
```
ALTER TABLE VEICULO
	DROP CONSTRAINT CHK_VEI_ANOMODELO
```

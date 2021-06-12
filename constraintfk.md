# Constraint de Foreign key
Chave Estrangeira é um recurso utilizado em bancos relacionais onde a sua definição irá permitir que a tabela corrente tenha uma relação com outra tabela. A relação é imposta através de campos contidos nas duas tabelas.

## Características:
O campo de referência da tabela atual deverá ser chave primária na outra tabela.
As colunas de relação necessariamente precisam ser do mesmo tipo.
Uma chave estrangeira poderá compor uma chave primária.
Nem toda chave estrangeira será uma chave primária.
Pode ter o valor nulo.
Toda chave estrangeira irá criar um objeto chamado Constraint.

#### Exemplo 1: Na criação da tabela:
```
CREATE TABLE MODELO  
(  
     ID INT NOT NULL,  
     DESCRICAO VARCHAR(30),  
     MARCA_ID INT ,  
     CONSTRAINT PK_MODELO PRIMARY KEY (ID),  
     CONSTRAINT FK_MODELO_MARCA FOREIGN KEY (MARCA_ID)  
        REFERENCES MARCA (ID)  
) 
```
#### Exemplo 2:Na criação da tabela
```
ALTER TABLE MODELO
     ADD CONSTRAINT FK_MODELO_MARCA FOREIGN KEY (MARCA_ID) 
             REFERENCES MARCA (ID) 
```
## Ações de Restrição:
* São ações que podem ser definidas para fornecer uma alternativa a restrição. São executadas automaticamente na tabela Child, de acordo com um evento ocorrido na tabela Parent relacionada.

* São elas:
- Cascade: Executa a mesma ação nos registros da tabela Child relacionada.
- Set Null: Altera para null, o valor da(s) coluna(s) da chave estrangeira dos registros da tabela Child relacionada. 

## Eventos:
* Delete: Ao excluir um registro da tabela Parent.
* Update: Ao alterar os valores da chave primária de um registro da tabela Parent.

#### Exemplo 1:Na criação da Tabela
* Tabela Parent:
```
CREATE TABLE MARCA  
(  
     ID INT NOT NULL,  
     DESCRICAO VARCHAR(30),  
     CONSTRAINT PK_MARCA PRIMARY KEY (ID)
)  	
```

*	Tabela Child:
```
CREATE TABLE MODELO  
(  
     ID INT NOT NULL,  
     DESCRICAO VARCHAR(30),  
     MARCA_ID INT,  
     CONSTRAINT PK_MODELO PRIMARY KEY (ID),  
     CONSTRAINT FK_MODELO_MARCA FOREIGN KEY (MARCA_ID)  
        REFERENCES MARCA (ID) ON UPDATE SET NULL ON DELETE CASCADE
)  
```



# SQLServer
É um sistema Gerenciador de Banco de dados mantido pela Microsoft cujo função principal é o armazenamento de dados OLTP. Atualmente é um dos principais SGBD relacionais do mercado. Possui como linguagem de acesso nativo o Transaction SQL porem também é possível executar comandos padrão SQL-ANSI. Abaixo teremos temas aplicados ao SQLServer.

## Definindo Estrutura de Armazenamento de Dados
Em um sistema gerenciador de banco de dados baseado no modelo relacional as informações são armazenadas em estruturas chamadas Tabela. Uma tabela poderá possuir diversos recursos como: índices, gatilhos, constraints e etc. A seguir veremos o comando de definição de Tabela.
 * [Tipos de Dados](tipodedados.md) <br>
 * [Create Table](createtable.md) <br>
 
## Manipulando Dados
Visto que o repositório está definido poderá ser utilizado para armazenamento de dados e outras manipulações. Abaixo tempos alguns comandos de Manipulação de Dados.
 * [Inserindo Dados](inserindodados.md) <br>
 * [Selecionando Dados](selecionandodados.md) <br>
 * [Expressões e Operadores](expressoeseoperadores.md) <br>
 * [Cláusula Where](ClausulaWhere.md) <br>
 * [Cláusula Order By](ClausulaOrderBy.md) <br>
 * [Cláusula Distinct](ClausulaDistinct.md) <br>
 * [Cláusula Top](ClausulaTop.md) <br>
 * [Alterando Dados](AtualizandoDados.md) <br>
 * [Excluindo Dados](excluindodados.md) <br>

## Alterando estrutura de Armazenamento de Dados
Uma vez definido uma tabela a mesma poderá sofrer alterações, mesmo que já tenha sido inserido registros na mesma. Abaixo temos o comando que irá alterar uma tabela definindo alguns elementos.
 * [Alter Table](altertable.md) <br>


## Definindo Constraints
São restrições implementadas através de regras. Essas regras serão impostas aos comandos: INSERT, UPDATE, DELETE. As regras podem ser definidas na criação da tabela, através do comando CREATE TABLE, ou na alteração da tabela, através do comando ALTER TABLE. Caso a tabela já tenha o valor que está sendo restringido pela constraint, a constraint não será criada. Os tipos de constraints são: check, unique, primary key e foreign key.

OBS:
Caso haja alguma tentativa de manipulação de dados que contraria a regra será cancelada e o banco lançará um erro. Caso haja a tentativa de criação de uma regra que já esteja invalidada por uma informação gravada a regra será cancelada e o banco lançará um erro.
 * [Constraint de Check](constraintcheck.md) <br>
 * [Constraint de Unique](constraintunique.md) <br>
 * [Constraint de Primary Key](constraintpk.md) <br>
 * [Constraint de Foreign Key](constraintfk.md) <br>
 * 












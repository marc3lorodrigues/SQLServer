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
 * [Drop Table](droptable.md) <br>
 

## Constraints
São restrições implementadas através de regras. Essas regras serão impostas aos comandos: INSERT, UPDATE, DELETE. As regras podem ser definidas na criação da tabela, através do comando CREATE TABLE, ou na alteração da tabela, através do comando ALTER TABLE. Caso a tabela já tenha o valor que está sendo restringido pela constraint, a constraint não será criada. Os tipos de constraints são: check, unique, primary key e foreign key.

OBS:
Caso haja alguma tentativa de manipulação de dados que contraria a regra será cancelada e o banco lançará um erro. Caso haja a tentativa de criação de uma regra que já esteja invalidada por uma informação gravada a regra será cancelada e o banco lançará um erro.
 * [Constraint de Check](constraintcheck.md) <br>
 * [Constraint de Unique](constraintunique.md) <br>
 * [Constraint de Primary Key](constraintpk.md) <br>
 * [Constraint de Foreign Key](constraintfk.md) <br>


## Índices
Índices são estruturas que possibilitam uma forma mais rápida e eficiente de acessar os dados de uma tabela. Ocupam espaço físico para manter informações que serão utilizados para acessar os dados da tabela. As informações são formadas pelas colunas que serão utilizadas para formar o índice, bem como classificar a coluna da tabela.

### Características:
*	Aumentam a velocidade de:
*	Recuperação de dados.
*	Ordenação dos registros.
*	Funciona de maneira semelhante ao índice de um livro.
*	Antes da execução de uma instrução Select, o gerenciador sempre verifica a existência de índices.

### Necessidade de índices:
*	Motivos para se criar índices:
*	Os dados solicitados são solicitados ordenados com frequência.
*	Motivos para NÃO se criar índices:
*	As colunas já fazem parte de índices.
*	Dificilmente as colunas aparecerão na cláusula WHERE do SELECT.
*	As colunas têm alterações frequentes.
*	A coluna possuir poucos valores discretos, masculino ou feminino, por exemplo.

Criando Indices
 * [Criando Índice](criandoindice.md) <br>
 * [Excluíndo Índice](excluindoindice.md) <br>
 * [Forçando a utilização índice](forcandoindice.md) <br>
 














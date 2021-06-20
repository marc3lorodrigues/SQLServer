# Constraints
São restrições implementadas através de regras. Essas regras serão impostas aos comandos: INSERT, UPDATE, DELETE. As regras podem ser definidas na criação da tabela, através do comando CREATE TABLE, ou na alteração da tabela, através do comando ALTER TABLE. Caso a tabela já tenha o valor que está sendo restringido pela constraint, a constraint não será criada. Os tipos de constraints são: check, unique, primary key e foreign key.

OBS:
Caso haja alguma tentativa de manipulação de dados que contraria a regra será cancelada e o banco lançará um erro. Caso haja a tentativa de criação de uma regra que já esteja invalidada por uma informação gravada a regra será cancelada e o banco lançará um erro.
 * [Constraint de Check](constraintcheck.md) <br>
 * [Constraint de Unique](constraintunique.md) <br>
 * [Constraint de Primary Key](constraintpk.md) <br>
 * [Constraint de Foreign Key](constraintfk.md) <br>

# Introdução a linguagem SQL
Structured Query Language – Linguagem de Consulta Estruturada. É uma linguagem padrão para bancos de dados relacionais que permite acessar e manipular informações bem como outros objetos do banco de dados.

## Características
*	Foi desenvolvida pela IBM em meados de 1970.
*	Possui recursos para definição das estruturas de dados, modificar dados e especificar restrições de segurança e integridade.
*	Estabeleceu-se como a linguagem padrão dos BDR.
*	Padrão mantido pela ANSI e ISO.
*	Possui as versões SQL-86, SQL-87, SQL-92, SQL-99, SQL-2003e SQL-2008.

## Categorias
*	DDL - Data DefinitionLanguage:
*	Contém comandos que definem a estrutura dos objetos de dados (tabelas, visões, procedimentos, índices, gatilhos e funções).
*	DML - Data ManipulationLanguage:
*	Contém comandos que acrescentam ou eliminam linhas inteiras de tabelas, e que permite alterar os valores dos dados em colunas especificadas no interior das linhas e ainda recuperação/obtenção de dados de tabelas'e determinam como os resultados devem ser apresentados.
*	DCL - Data ControlLanguage:
*	Possui comandos para realizar funções administrativas os quais garantem e revogam privilégios para uso do banco de dados, adicionam e removem campos de uma tabela.
*	DTL – Data TransactionLanguage:
*	Possui comandos que dão suporte a transação.
*	DQL – Data Query Language:
*	Possui o comando que executa a consulta no banco de dados. O comando SELECT que também é DML.

## Extensões
São variações que alguns fabricantes de banco de dados criaram para seus produtos. Exemplo:
* PL/SQL - Procedural Language/Structured Query Language.
Linguagem SQL estendida para Banco Oracle.
* PGPL/SQL - Procedural Language/Structured Query Language.
Linguagem SQL estendida para Banco PostGres.
* T-SQL - Transaction SQL.
Linguagem SQL estendida para bancos Microsoft.


## Tipos de Dados
Permite definir quais caracteres e a quantidade deles a serem armazenados nos campos da tabela.
* Integer		= Para número inteiro.
* Numeric(i,d)	= Numero com valores decimal onde i define o valor de números inteiro, e d define o valor de casas decimais.
* Char(n)		= Para texto de tamanho fixo. Onde n define o comprimento em caracteres.
* Varchar(n)	= Para texto de tamanho variável. Ex: Nome. Onde n define o comprimento em caracteres.
* Date			= Para dados do tipo data.



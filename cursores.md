# Cursores
O cursor é uma estrutura que contém um select e será utilizado através de um laço para que sejam percorridas todas as linhas do select.

## Comandos de Navegação
São comandos que permitem que seja feita a navegação entre os registros.

FETCH NEXT: Avança a próxima linha.
FETCH PRIOR: Retorna ao anterior.
FETCH FIRST: Vai ao primeiro registro.
FETCH LAST: Vai ao último registro.
 	
## Outros comandos
OPEN
Abre o cursor.

CLOSE
Fecha o cursor.

DEALLOCATE
Elimina o cursor da memória.

@@FETCH_STATUS
É uma função de cursor que armazena 0(zero) caso o último comando tenha sido executado com sucesso, e -1 caso não tenha mais linhas.

Considere o [Script](https://github.com/marc3lorodrigues/SQLServer/blob/main/script_cursor.sql) para os estudos de caso [1](ec_cursor1.md) e [2](ec_cursor2.md)


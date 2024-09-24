# Índices
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
 * [Forçando a utilização índice](forcandoutilizacao.md) <br>

# Requisitos do Campo minado


Os requisitos da aplicação é o que define suas funcionalidades e o seu comportamento, com isso a partir do documento foi necessário extrair os requisitos e posteriormente elaborar casos de teste para os mesmos


## Requisitos
Os requisitos extrídos do documento foram:

* Nível do Tabuleiro:
    - Fácil
    - Médio
    - Difícil
* Tamanho do Tabuleiro por nível:
    - (8 x 8)
    - (10 x 16)
    - (24 x 24)
* Número de bombas por nível:
    - (8 x 8) = 10
    - (10 x 16) = 30
    - (24 x 24) = 100
* Zonas adjacentes as bombas possuem números que indicam a quantidade de bombas ao redor
* Ao iniciar o tabuleiro as zonas devem ser cobertas:
    - sem bomba
    - sem bandeira
* Zonas devem conter bombas
* Uma zona pode ter de 0 a 8 zonas com bombas adjacentes a ela
    * bombas no centro
    * bombas nas bordas do tabuleiro
    * Bombas nos cantos
* Zonas limpas fazem fronteira com as zonas com bombas e contém números indicando a quantidade de bombas.
* Um jogador tem três opções de jogada:
    * Descobrir zona
    * Marcar zona como Bandeira
    * Desmarcar zona com Bandeira
* Jogador não pode abrir uma zona com bandeira
* Jogador não pode cobrir uma zona já descoberta
* Jogador deve remover uma bandeira antes de revelar uma bomba já marcada.
* Jogador vence se não explodir nenhuma bomba
Jogador vence se marcar todas as zonas que contém mina com bandeira.
* O Jogo deve manter um histórico de partidas
    * Salvar partida no histórico
    * Pode consultar o histórico
* No histórico deve conter:
    * Pontuação
    * Tempo da partida
    * Nível jogado
* A pontuação deve ser o tempo

Aos quais foram divididos em duas categorias durante a implementação:
* Requisitos Funcionais
* Requisitos não Funcionais
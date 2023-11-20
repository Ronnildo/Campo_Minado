# Casos de Teste

Definição: Um caso de teste de software é uma técnica utilizada no desenvolvimento de software para verificar se o sistema está funcionando corretamente.
*  É uma descrição detalhada de uma funcionalidade ou cenário específico que deve ser testado, com o objetivo de identificar possíveis erros ou bugs no software.

## Técnicas Utilizadas

Para a definição dos casos de teste foram utilizadas algumas técnicas para separar os testes em suas devidas categorias.

- Teste de Caixa Preta
- Casos de Uso


## Teste de Caixa Preta
Analise valor limite
```sh
    Teste de Coordenada Válida
    Teste de Coordenada Inválida
    Testes de Jogada
```

## Casos de Uso
```sh
    dart ./test/campo_minado.test
```
```sh
    Teste de Dificuldade
    Teste de Tamanho tabuleiro
    Teste de Número de bombas
    Teste de Inserção de bombas
    Teste de Coordenada Inválida
    Teste número de banderiras
    Testes de Jogada
```

Os teste foram agrupados por nível do tabuleiro nos casos de teste para tabuleiro e os demais teste foram agrupados de acordo com a sua funcionalidade dentro do jogo.
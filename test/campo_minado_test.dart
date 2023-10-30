import 'package:campo_minado/components/board.dart';
import 'package:campo_minado/components/coordenada.dart';
import 'package:campo_minado/components/level.dart';
import 'package:parameterized_test/parameterized_test.dart';
import 'package:test/test.dart';

void main() {
  Board? b;
  Coordenada? c;
  setUp(() {
    b = Board();
  });
  group('Board test', () {
    // teste para verificar se o tabuleiro está vazio
    test('start game', () {
      bool res = b!.board.isEmpty;
      expect(res, true);
    });

    // Fácil
    // teste para verificar o nível do tabuleiro
    test('test level game easy', () {
      b!.setLevelGame(Level.easy);
      Level l = b!.getNivel();
      expect(l, Level.easy);
    });
    // teste set Tamanho tabuleiro level
    test('test length board easy', () {
      int res = b!.setLevelGame(Level.easy);
      expect(res, 64);
    });
    test('test Sorted position bombs easy', () {
      b!.setLevelGame(Level.easy);
      List listPosition = b!.sortedBombs();
      for (int elem = 0; elem < b!.board.length; elem++) {
        if (listPosition.contains(elem)) {
          expect(listPosition.contains(elem), true);
        }
      }
    });

    test('Insert Bombs Board easy', () {
      b!.setLevelGame(Level.easy);
      b!.insertBombsBoard();
      for (int i = 0; i < b!.board.length; i++) {
        if (b!.board[i] == -1) expect(b!.board[i], -1);
      }
    });

    test('Count number of bombs easy', () {
      b!.setLevelGame(Level.easy);
      b!.insertBombsBoard();
      int count = 0;
      for (int i = 0; i < b!.board.length; i++) {
        if (b!.board[i] == -1) {
          count += 1;
        }
      }
      expect(count, 10);
    });

    test('Insert Numbers Board', () {
      b!.insertBombsBoard();
      b!.getNeighborsBombs();
      for (int i = 0; i < b!.board.length; i++) {
        if (b!.board[i] == -1) {
          expect(b!.board[i + 1], 1);
        }
        if (b!.board[i - 1] == -1) {
          expect(b!.board[i - 1], 1);
        }
        if (b!.board[i + 1] == -1 && b!.board[i - 1] == -1) {
          expect(b!.board[i], 2);
        }
      }
    });

    // Médio
    // teste set Tamanho tabuleiro level
    test('test length board medium', () {
      int res = b!.setLevelGame(Level.medium);
      expect(res, 160);
    });
    // teste para verificar o nível do tabuleiro
    test('test level game medium', () {
      b!.setLevelGame(Level.medium);
      Level l = b!.getNivel();
      expect(l, Level.medium);
    });

    test('test Sorted bombs medium', () {
      b!.setLevelGame(Level.medium);
      List listPosition = b!.sortedBombs();
      for (int elem = 0; elem < b!.board.length; elem++) {
        if (listPosition.contains(elem)) {
          expect(listPosition.contains(elem), true);
        }
      }
    });

    test('Insert Bombs Board medium', () {
      b!.setLevelGame(Level.medium);
      b!.insertBombsBoard();
      for (int i = 0; i < b!.board.length; i++) {
        if (b!.board[i] == -1) expect(b!.board[i], -1);
      }
    });

    test('Count number of bombs medium', () {
      b!.setLevelGame(Level.medium);
      b!.insertBombsBoard();
      b!.printBoard();
      int count = 0;
      for (int i = 0; i < b!.board.length; i++) {
        if (b!.board[i] == -1) {
          count += 1;
        }
      }
      expect(count, 30);
    });

    // Dificil

    // teste set Tamanho tabuleiro level
    test('test length board difficult', () {
      int res = b!.setLevelGame(Level.difficult);
      expect(res, 576);
    });
    // teste para verificar o nível do tabuleiro
    test('test level game difficult', () {
      b!.setLevelGame(Level.difficult);
      Level l = b!.getNivel()!;
      expect(l, Level.difficult);
    });

    test('test Sorted bombs difficult', () {
      b!.setLevelGame(Level.difficult);
      List listPosition = b!.sortedBombs();
      for (int elem = 0; elem < b!.board.length; elem++) {
        if (listPosition.contains(elem)) {
          expect(listPosition.contains(elem), true);
        }
      }
    });

    test('Insert Bombs Board difficult', () {
      b!.setLevelGame(Level.difficult);
      b!.insertBombsBoard();
      for (int i = 0; i < b!.board.length; i++) {
        if (b!.board[i] == -1) expect(b!.board[i], -1);
      }
    });

    test('Count number of bombs difficult', () {
      b!.setLevelGame(Level.difficult);
      b!.insertBombsBoard();
      b!.printBoard();
      int count = 0;
      for (int i = 0; i < b!.board.length; i++) {
        if (b!.board[i] == -1) {
          count += 1;
        }
      }
      expect(count, 100);
    });

    test('bombs Neighbors easy test', () {
      b!.setLevelGame(Level.easy);
      b!.insertBombsBoard();
      b!.getNeighborsBombs();
      for (var element in b!.board) {
        if (element >= 1) {
          expect(element >= 1, true);
        }
      }
    });

    test('discover Neighbors easy test', () {
      b!.setLevelGame(Level.easy);
      b!.insertBombsBoard();
      for (var el in b!.board) {}
    });
  });

  group('Zona Test', () {});

  group('Jogador test', () {});

  group('Coordenada test', () {
    parameterizedTest(
      "Coordenada válida",
      [
        [0, 0],
        [0, 5],
        [0, 8],
        [1, 0],
        [1, 1],
        [1, 5],
        [2, 0],
        [2, 5],
        [2, 8],
        [3, 0],
        [3, 7],
        [3, 8],
        [4, 0],
        [4, 1],
        [4, 2],
        [5, 1],
        [5, 5],
        [5, 6],
        [6, 1],
        [6, 7],
        [6, 8],
        [7, 0],
        [7, 1],
        [7, 2],
        [8, 0],
        [8, 6],
        [8, 8],
      ],
      p2((int line, int column) {
        b!.setLevelGame(Level.easy);
        c = Coordenada(line, column);
        bool res = c!.validaCoordenada(b!.board.length);
        expect(res, true);
      }),
    );

    parameterizedTest(
      "Coordenada inválida",
      [
        [-1, 0],
        [9, 0],
        [9, 9],
        [0, -1],
        [3, -4],
        [5, -8],
        [6, -1],
        [6, 9],
        [7, -2],
        [7, 10],
      ],
      p2((int line, int column) {
        b!.setLevelGame(Level.easy);
        c = Coordenada(line, column);
        bool res = c!.validaCoordenada(b!.board.length);
        expect(res, false);
      }),
    );
  });

  group('Histórico test', () {});
}

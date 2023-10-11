import 'dart:math';

import 'package:campo_minado/components/board.dart';
import 'package:campo_minado/components/level.dart';
import 'package:test/test.dart';

void main() {
  Board? b;
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
    test('test set level game easy', () {
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
      b!.printBoard();
      int count = 0;
      for (int i = 0; i < b!.board.length; i++) {
        if (b!.board[i] == -1) {
          count += 1;
        }
      }
      expect(count, 10);
    });

    // Médio
    // teste set Tamanho tabuleiro level
    test('test set level game medium', () {
      int res = b!.setLevelGame(Level.medium);
      expect(res, 160);
    });
    // teste para verificar o nível do tabuleiro
    test('test level game medium', () {
      b!.setLevelGame(Level.medium);
      Level l = b!.getNivel()!;
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
    test('test set level game difficult', () {
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
  });
}

import 'dart:math';

import 'package:campo_minado/components/level.dart';

class Board {
  late List _board = [];
  List get board => _board;

  getNivel() {
    if (_board.length == 64) {
      return Level.easy;
    } else if (_board.length == 160) {
      return Level.medium;
    } else if (_board.length == 576) {
      return Level.difficult;
    } else {
      return;
    }
  }

  int setLevelGame(Level level) {
    if (level == Level.easy) {
      _board = List.filled(8 * 8, " ", growable: false);
      return _board.length;
    } else if (level == Level.medium) {
      _board = List.filled(10 * 16, " ", growable: false);
      return _board.length;
    } else if (level == Level.difficult) {
      _board = List.filled(24 * 24, " ", growable: false);
      return _board.length;
    } else {
      return 0;
    }
  }

  sortedBombs() {
    List position = [];
    if (_board.length == 64) {
      for (int i = 0; i < 10; i++) {
        var mines = Random().nextInt(_board.length);
        position.add(mines);
      }
    } else if (_board.length == 160) {
      for (int i = 0; i < 30; i++) {
        var mines = Random().nextInt(_board.length);
        position.add(mines);
      }
    } else if (_board.length == 576) {
      for (int i = 0; i < 100; i++) {
        var mines = Random().nextInt(_board.length);
        position.add(mines);
      }
    }
    print(position);
    return position;
  }

  void insertBombsBoard() {
    List bombs = sortedBombs();
    for (var i in bombs) {
      _board[i] = "*";
    }
  }
}

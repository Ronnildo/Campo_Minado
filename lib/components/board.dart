import 'dart:io';
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
      _board = List.filled(8 * 8, 0, growable: false);
      return _board.length;
    } else if (level == Level.medium) {
      _board = List.filled(10 * 16, 0, growable: false);
      return _board.length;
    } else if (level == Level.difficult) {
      _board = List.filled(24 * 24, 0, growable: false);
      return _board.length;
    } else {
      return 0;
    }
  }

  sortedBombs() {
    List position = [];
    if (_board.length == 64) {
      while (position.length < 10) {
        var randomNumber = Random().nextInt(_board.length);
        if (!position.contains(randomNumber)) {
          position.add(randomNumber);
        }
      }
    } else if (_board.length == 160) {
      while (position.length < 30) {
        var randomNumber = Random().nextInt(_board.length);
        if (!position.contains(randomNumber)) {
          position.add(randomNumber);
        }
      }
    } else if (_board.length == 576) {
      while (position.length < 100) {
        var randomNumber = Random().nextInt(_board.length);
        if (!position.contains(randomNumber)) {
          position.add(randomNumber);
        }
      }
    }
    return position;
  }

  void insertBombsBoard() {
    List bombs = sortedBombs();
    for (var i in bombs) {
      // print(i);
      _board[i] = -1;
    }
  }

  printBoard() {
    int i = 0;
    int passLine = 0;
    if (getNivel() == Level.easy) {
      passLine = 8;
    }
    if (getNivel() == Level.medium) {
      passLine = 16;
    }
    if (getNivel() == Level.difficult) {
      passLine = 24;
    }
    for (int a = 0; a <= passLine; a++) {
      stdout.write("  $a ");
    }
    print("\n");
    for (var elem in _board) {
      i += 1;
      stdout.write("| $elem |");
      if (i % passLine == 0) {
        print("\n");
      }
      // print(i);
    }
    print("\n");
  }
}

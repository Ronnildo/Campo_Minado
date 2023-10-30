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

  int newLineBoard() {
    int passLine = 0;
    if (getNivel() == Level.easy) {
      return passLine = 8;
    } else if (getNivel() == Level.medium) {
      return passLine = 16;
    } else if (getNivel() == Level.difficult) {
      return passLine = 24;
    } else {
      return passLine;
    }
  }

  printBoard() {
    int i = 0;
    int passLine = newLineBoard();

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

  void getNeighborsBombs() {
    int res = newLineBoard();
    //captura a posição que aparece a bomba
    List adj = [];
    List numbers = [];
    print(_board.length);
    for (int i = 0; i < _board.length; i++) {
      if (i == _board.length - 1 && _board[i] == -1 && _board[i - 1] == 0) {
        _board[i - 1] += 1;
      }
      if (_board[0] == -1 && _board[1] != -1) {
        _board[i] += 1;
      }
      if (i != _board.length - 1 &&
          i > 1 &&
          i % res != 0 &&
          _board[i] == -1 &&
          _board[i + 1] != -1) {
        _board[i + 1] += 1;
      }
      if (i != _board.length - 1 &&
          i > 1 &&
          i == res &&
          _board[i] == -1 &&
          _board[i + 1] != -1) {
        _board[i + 1] += 1;
      }
      if (i != _board.length - 1 &&
          i > 1 &&
          i % res != 0 &&
          _board[i] == -1 &&
          _board[i + 1] == -1 &&
          _board[i + 2] == -1) {
        _board[i + 3] += 1;
      }
      if (i != _board.length - 1 && i > 1 && i % res != 0 && _board[i] == -1) {
        _board[i + 1] += 1;
      }
      if (i != _board.length - 1 &&
          i > 1 &&
          i % res != 0 &&
          _board[i] == -1 &&
          _board[i - 1] != -1) {
        _board[i - 1] += 1;
      }
      if (i != _board.length - 1 &&
          i > 1 &&
          i % res == 0 &&
          _board[i] > 0 &&
          _board[i + 1] == -1) {
        _board[i] += 1;
      }
      if (i != _board.length - 1 &&
          i > 1 &&
          i % res == 0 &&
          _board[i] > 0 &&
          _board[i - 1] == -1) {
        _board[i] -= 1;
      }
      if (i != _board.length - 1 &&
          i % res == 0 &&
          _board[i + 1] == -1 &&
          i > 0 &&
          _board[i - 1] == -1) {
        _board[i - 1] -= 1;
      }
      // Verificar as adjacencias
      if (_board[i] == -1) {
        adj.add(i);
      }
      if (_board[i] > 0) {
        numbers.add(i);
      }
    }
    print("Bombas: $adj");
    print("Números: $numbers");
    printBoard();
  }

  // void neighbors(){
  //   for(var  in _board){
  //     for(var nei in _board)
  //   }
  // }
}

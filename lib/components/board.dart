import 'dart:io';
import 'dart:math';

import 'package:campo_minado/components/level.dart';
import 'package:campo_minado/components/zona.dart';

class Board {
  Level difficulty;
  late List<Zona> _board = [];

  Board(this.difficulty) {
    _setLegthBoard();
    _listNeighbors();
    insertBombs();
    boardInit();
  }

  get board => _board;

  _listNeighbors() {
    for (var zone in _board) {
      for (var neighbor in _board) {
        zone.pumpsAdjacent(neighbor);
      }
    }
  }

  void boardInit() {
    int i = 0;
    int passLine = newLineBoard();

    print("\n");
    for (var elem in _board) {
      i += 1;
      stdout.write(" [ ] ");
      if (i % passLine == 0) {
        print("\n");
      }
      // print(i);
    }
    print("\n");
  }

  int newLineBoard() {
    int passLine = 0;
    if (getLevel() == "EASY") {
      return passLine = 8;
    } else if (getLevel() == "MEDIUM") {
      return passLine = 16;
    } else if (getLevel() == "DIFFICULT") {
      return passLine = 24;
    } else {
      return passLine;
    }
  }

  void _setLegthBoard() {
    if (difficulty.name == "easy") {
      for (int i = 0; i < 8; i++) {
        for (int j = 0; j < 8; j++) {
          _board.add(Zona(i, j));
        }
      }
    } else if (difficulty.name == "medium") {
      for (int i = 0; i < 10; i++) {
        for (int j = 0; j < 16; j++) {
          _board.add(Zona(i, j));
        }
      }
    } else if (difficulty.name == "difficult") {
      for (int i = 0; i < 24; i++) {
        for (int j = 0; j < 24; j++) {
          _board.add(Zona(i, j));
        }
      }
    } else {
      throw ArgumentError("Invalid level");
    }
  }

  String getLevel() {
    if (_board.length == (8 * 8)) {
      return "EASY";
    } else if (_board.length == (10 * 16)) {
      return "MEDIUM";
    } else if (_board.length == (24 * 24)) {
      return "DIFFICULT";
    }
    return "EASY";
  }

  List sortedBombs() {
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

  void insertBombs() {
    List bombs = sortedBombs();
    for (var i in bombs) {
      _board[i].bombInPosition();
    }
  }
}

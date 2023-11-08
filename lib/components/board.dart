import 'dart:io';
import 'dart:math';

import 'package:campo_minado/components/level.dart';
import 'package:campo_minado/components/zona.dart';

class Board {
  final Level difficulty;
  List<Zona> _board = [];
  Board({required this.difficulty}) {
    _setLegthBoard();
    insertMines();
    _listNeighbors();
    printBoard(board);
  }

  get board => _board;

  _listNeighbors() {
    for (var zone in _board) {
      for (var neighbor in _board) {
        zone.calcularAdjacentes(neighbor);
      }
    }
  }

  void _setLegthBoard() {
    if (difficulty == Level.easy) {
      for (int i = 0; i < 8; i++) {
        for (int j = 0; j < 8; j++) {
          _board.add(Zona(line: i, column: j, marca: "_"));
        }
      }
    } else if (difficulty == Level.medium) {
      for (int i = 0; i < 16; i++) {
        for (int j = 0; j < 10; j++) {
          _board.add(Zona(line: i, column: j, marca: "_"));
        }
      }
    } else if (difficulty == Level.difficult) {
      for (int i = 0; i < 24; i++) {
        for (int j = 0; j < 24; j++) {
          _board.add(Zona(line: i, column: j, marca: "_"));
        }
      }
    }
  }

  int getLength() {
    if (difficulty == Level.easy) {
      return 8 * 8;
    } else if (difficulty == Level.medium) {
      return 10 * 16;
    } else if (difficulty == Level.difficult) {
      return 24 * 24;
    } else {
      return 8 * 8;
    }
  }

  int newLine() {
    if (getLength() == 8 * 8) {
      return 8;
    } else if (getLength() == 10 * 16) {
      return 16;
    } else if (getLength() == 24 * 24) {
      return 24;
    }
    return 8;
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

  printBoard(List board) {
    int a = 0;
    int pass = newLine();
    for (var element in board) {
      a += 1;
      if (element.marca == "*") {
        stdout.write(" [ _ ] ");
      } else {
        stdout.write(" [ ${element.marca} ] ");
      }
      if (a % pass == 0) {
        print("\n");
      }
    }
  }

  statusZone(Zona z) {
    int a = 0;
    int pass = newLine();
    for (var element in board) {
      a += 1;
      if (element.marca == "*") {
        stdout.write(" [ _ ] ");
      } else if (element.marca == " " && element.qtdeMinasVizinhas > 0) {
        stdout.write(" [ ${element.qtdeMinasVizinhas} ] ");
      } else if (element.aberto()) {
        stdout.write(" [ ${element.marca} ] ");
      } else if (element.comBandeira()) {
        stdout.write(" [ ${element.marca} ] ");
      } else {
        stdout.write(" [ ${element.marca} ] ");
      }
      if (a % pass == 0) {
        print("\n");
      }
    }
  }

  List sortedPositions() {
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

  void reset() {
    _board.forEach((element) => element.resetGame());
  }

  void revealBombs() {
    _board.forEach((element) => element.revealBombs());
  }

  contagemNumeroDeBandeiras() {
    int count = 0;
    for (var element in _board) {
      if (element.comBandeira()) {
        count += 1;
      }
    }
    return count;
  }

  insertMines() {
    List positions = sortedPositions();
    for (var element in positions) {
      _board[element].minar();
    }
    return positions.length;
  }
}

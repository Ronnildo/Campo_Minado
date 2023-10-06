import 'dart:io';

import 'package:campo_minado/components/coordenada.dart';
import 'package:campo_minado/components/jogada.dart';

class Board {
  late Map<Coordenada, Jogada> _board = {};
  late List _matrix;

  Map<Coordenada, Jogada> get board => _board;

  setSizeBoard(int value) {
    _matrix = List.filled(value, {}, growable: false);
  }

  List get matrix => _matrix;

  insertBombs(String nivel) {
    if (nivel == "facil") {}
  }

  printBoard() {
    int passLine = 1;
    if (_matrix.length == 65) {
      passLine = 8;
    } else if (_matrix.length == 161) {
      passLine = 16;
    } else if (_matrix.length == 577) {
      passLine = 24;
    }
    // print(_matrix.length);
    for (var i = 1; i < passLine + 1; i++) {
      stdout.write(
        "    $i  ",
      );
    }
    print("");
    int a = 1;
    for (var i = 1; i < _matrix.length; i++) {
      // print(i);
      if (i == 1 || i % passLine + 1 == 0) {
        stdout.write("$a");
      }
      stdout.write(" | ${_matrix[i]} |");
      if (i % passLine == 0) {
        a = a + 1;
        print("\n");
        if (passLine == 16) {
          print("-" * (_matrix.length - (passLine * 3)));
        }
        if (passLine == 8) {
          print("-" * (passLine * passLine - 7));
        }
        if (passLine == 24) {
          print("-" * (passLine * 7 - 9));
        }
        if (a <= passLine || i % a == 0) {
          stdout.write("$a");
        }
      }
    }
    print("\n");
  }
}

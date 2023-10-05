import 'dart:io';

import 'package:campo_minado/components/coordenada.dart';
import 'package:campo_minado/components/jogada.dart';

class Board {
  late Map<Coordenada, Jogada> _board = {};
  late List<Map<Coordenada, Jogada>> _matrix;

  Map<Coordenada, Jogada> get board => _board;

  setSizeBoard(int value) {
    _matrix = List.filled(value, {}, growable: false);
  }

  List<Map<Coordenada, Jogada>> get matrix => _matrix;

  // setDataMatrix() {
  //   _board.values.forEach((element) { })
  //   _matrix.add()
  // }

  printBoard() {
    int pass_line = 0;
    if (_matrix.length == 65) {
      pass_line = 8;
    } else if (_matrix.length == 171) {
      pass_line = 16;
    } else if (_matrix.length == 577) {
      pass_line = 24;
    }
    for (var i = 1; i < pass_line + 1; i++) {
      stdout.write("   $i   ");
    }
    print("");
    int a = 1;
    for (var i = 1; i < _matrix.length; i++) {
      // print(i);
      if (i == 1 || i % pass_line + 1 == 0) {
        stdout.write("$a");
      }
      stdout.write(" | ${_matrix[i]} |");
      if (i % pass_line == 0) {
        a = a + 1;
        print("\n");
        print("-" * (pass_line * pass_line - 7));
        if (a <= pass_line) {
          stdout.write("$a");
        }
      }
    }
    print("\n");
  }
}

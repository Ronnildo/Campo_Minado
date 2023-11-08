import 'dart:io';

import 'package:campo_minado/components/board.dart';
import 'package:campo_minado/components/zona.dart';

class Game {
  Board board;

  Game(this.board);

  init() {
    board.printBoard(board.board);
  }

  acoes(String op, Zona zona) {
    print("\n");

    switch (op) {
      case "1":
        for (var element in board.board) {
          if (element.line == zona.line && element.column == zona.column) {
            if (!element.comBomba() &&
                !element.aberto() &&
                !element.comBandeira()) {
              element.abrirZona();
            } else if (element.comBomba()) {
              print("Não foi dessa vez!!");
              return;
            }
          }
        }
        break;
      case "2":
        for (var element in board.board) {
          if (element.line == zona.line && element.column == zona.column) {
            if (!element.aberto() && !element.comBandeira()) {
              element.marcarComBandeira();
            }
          }
        }
        // board.statusZone(zona);

        break;
      case "3":
        for (var element in board.board) {
          if (element.line == zona.line &&
              element.column == zona.column &&
              element.comBandeira()) {
            element.desmarcarZonaComBandeira();
          }
        }
        // board.statusZone(zona);

        break;
    }

    board.statusZone(zona);
  }

  bool validaCoordenada(Zona z) {
    if (board.getLevel() == "EASY") {
      if (z.line >= 0 && z.line < 8) {
        if (z.column >= 0 && z.column < 8) {
          return true;
        }
      } else {
        return false;
      }
    } else if (board.getLevel() == "MEDIUM") {
      if (z.line >= 0 && z.line < 16) {
        if (z.column >= 0 && z.column < 10) {
          return true;
        }
      }
    } else if (board.getLevel() == "DIFFICULT") {
      if (z.line >= 0 && z.line < 24) {
        if (z.column >= 0 && z.column < 24) {
          return true;
        }
      }
    }
    return false;
  }

  gameOver(Zona zona) {
    for (var element in board.board) {
      if (element.line == zona.line && element.column == zona.column) {
        if (element.comBomba() && !element.comBandeira()) {
          return true;
        }
        return false;
      }
    }
    return false;
  }

  vitoria(Zona zona) {
    for (var element in board.board) {
      if (element.line == zona.line && element.column == zona.column) {
        if (element.comBomba()) {
          return true;
        }
        return false;
      }
    }
    return false;
  }
}

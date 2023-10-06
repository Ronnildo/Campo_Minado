import 'package:campo_minado/components/board.dart';
import 'package:campo_minado/components/coordenada.dart';
import 'package:campo_minado/components/jogada.dart';
import 'package:campo_minado/exceptions/exception_nivel_game.dart';

class Game {
  Board b = Board();
  void init() {}

  Map<Coordenada, Jogada> getBoard() {
    return b.board;
  }

  String? setNivel(String s) {
    switch (s) {
      case "facil":
        b.setSizeBoard(65);
        return "facil";
      case "medio":
        b.setSizeBoard(161);
        return "medio";
      case "dificil":
        b.setSizeBoard(577);
        return "dificil";
      case "":
        throw ExceptionNivelGame("Error Null value");
      default:
        return "";
    }
  }

  int getNivelSize(String s) {
    return b.matrix.length;
  }

  printGame() {
    b.printBoard();
  }

  int getBombs(String s) {
    switch (s) {
      case "facil":
        return 10;
      case "medio":
        return 30;
      case "dificil":
        return 100;
      case "":
        throw ExceptionNivelGame("Error Null value");
      default:
        return 0;
    }
  }
}

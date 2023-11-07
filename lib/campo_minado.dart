import 'dart:io';

import 'package:campo_minado/components/board.dart';
import 'package:campo_minado/components/historico.dart';
import 'package:campo_minado/components/jogada.dart';
import 'package:campo_minado/components/jogador.dart';
import 'package:campo_minado/components/level.dart';
import 'package:campo_minado/components/zona.dart';

class Game {
  late Board b;
  late Zona z;
  late Jogador player;
  late Historico h;

  Game(Level l, Jogador j) {
    b = Board(l);
    h = Historico(j);
  }

  init() {
    b.boardInit();
  }

  suaJogada() {
    stdout.write("Sua jogada (0,0): ");
    var jogada = stdin.readLineSync();

    switch (jogada!) {
      case "1":
        break;
      case "2":
        break;
      case "3":
        break;
      default:
    }
  }

  menuJogada() {
    print("1 - revelar zona");
    print("2 - marcar com bandeira");
    print("3 - desmarcar zona");
  }
}

import 'dart:io';

import 'package:campo_minado/campo_minado.dart';
import 'package:campo_minado/components/board.dart';
import 'package:campo_minado/components/historico.dart';
import 'package:campo_minado/components/jogador.dart';
import 'package:campo_minado/components/level.dart';
import 'package:campo_minado/components/zona.dart';

void main(List<String> arguments) {
  print("*********************");
  print("*   CAMPO MINADO    *");
  print("*********************");

  print("\n");

  campoMinadoGame();
}

campoMinadoGame() {
  stdout.write("Seu Nome: ");
  var name = stdin.readLineSync();
  Jogador j = Jogador(name: name!);

  menuNivel();
  var level = stdin.readLineSync();
  Level sel = select(level!);
  print("\n");

  Board b = Board(difficulty: sel);
  Historico h = Historico(j, DateTime.now());
  //Uma Jogada
  Game game = Game(b);
  Zona zona;
  while (true) {
    menuJogada();
    var jogada = stdin.readLineSync();

    stdout.write("Coordenada (0,0): ");
    var coord = stdin.readLineSync();
    zona = Zona(
        line: int.parse(coord![0]), column: int.parse(coord[2]), marca: "_");
    // if (game.gameOver(zona)) {
    // return false;
    // }
    game.acoes(jogada!, zona);

    print("\n");
  }
}

menuJogada() {
  print("Sua Jogada:");
  print("1 - Revelar Zona");
  print("2 - Marcar com Bandira");
  print("3 - Desmarcar Zona com Bandeira");
  stdout.write("Opção: ");
}

menuNivel() {
  print("Qual nível:");
  print("1 - Nível fácil (8x8)");
  print("2 - Nível médio (10x16)");
  print("3 - Nível difícil (24x24)");
  stdout.write("Escolha o nível: ");
}

Level select(String op) {
  if (op == "1") {
    return Level.easy;
  } else if (op == "2") {
    return Level.medium;
  } else if (op == "3") {
    return Level.difficult;
  }
  return Level.easy;
}

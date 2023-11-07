import 'dart:io';

import 'package:campo_minado/campo_minado.dart';
import 'package:campo_minado/components/jogador.dart';
import 'package:campo_minado/components/level.dart';

void main(List<String> arguments) {
  Game? g;
  Jogador? j;
  print("************************");
  print("*     CAMPO MINADO     *");
  print("************************");

  stdout.write("Seu nome: ");
  var name = stdin.readLineSync();
  print("\n");
  menu();
  var op = stdin.readLineSync();
  g = selectedLevel(op!, name!);
  print("\n");

  g!.init();
}

selectedLevel(String op, String name) {
  Game g;
  Jogador j = Jogador(name, DateTime.now());
  switch (op) {
    case "1":
      g = Game(Level.easy, j);
      return g;
    case "2":
      g = Game(Level.medium, j);
      return g;
    case "3":
      g = Game(Level.difficult, j);
      return g;
    default:
      g = Game(Level.easy, j);
      return g;
  }
}

void menu() {
  print("Bem-Vindo ao Campo Minado");
  print("Escolha o nível de dificuldade: ");
  print("1 - Nível fácil (8x8)");
  print("2 - Nível médio (10x16)");
  print("1 - Nível difícil (24x24)");
  stdout.write("Sua escolha: ");
}

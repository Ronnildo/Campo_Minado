import 'package:campo_minado/campo_minado.dart';
import 'dart:io';

import 'package:campo_minado/exceptions/exception_nivel_game.dart';

void main(List<String> arguments) {
  Game g = Game();

  g.init();

  try {
    String? input = stdin.readLineSync();

    print(g.getNivelSize(g.setNivel(input!)!));
    g.printGame();
  } on ExceptionNivelGame catch (e) {
    print(e.message);
  }
}

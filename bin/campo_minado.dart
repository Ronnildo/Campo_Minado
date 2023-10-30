import 'package:campo_minado/campo_minado.dart';
import 'package:campo_minado/components/board.dart';
import 'package:campo_minado/components/level.dart';
import 'dart:io';

import 'package:campo_minado/exceptions/exception_nivel_game.dart';

void main(List<String> arguments) {
  Board g = Board();

  g.setLevelGame(Level.easy);
  g.insertBombsBoard();
  g.printBoard();
  g.getNeighborsBombs();
  // try {
  //   String? input = stdin.readLineSync();

  //   print(g.getNivelSize(g.setNivel(input!)!));
  //   g.printGame();
  // } on ExceptionNivelGame catch (e) {
  //   print(e.message);
  // }
}

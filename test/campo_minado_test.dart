import 'package:campo_minado/campo_minado.dart';
import 'package:campo_minado/exceptions/exception_nivel_game.dart';
import 'package:test/test.dart';

void main() {
  group('Tabuleiro teste', () {
    Game? g;
    setUp(() {
      g = Game();
      g!.init();
    });
    test('Iniciar Jogo Test', () {
      bool res = g!.getBoard().isEmpty;
      expect(res, true);
    });

    test('Nível Fácil Test 8x8', () {
      String? res = g!.setNivel("facil");
      expect(res, "facil");
    });

    test('Nível Fácil Test 8x8 Size Table', () {
      String? nivel = g!.setNivel("facil");
      int res = g!.getNivelSize(nivel!);
      expect(res, 64);
    });

    test('Nível Fácil Test 10x16', () {
      String? res = g!.setNivel("medio");
      expect(res, "medio");
    });

    test('Nível Fácil Test 10x16 Size Table', () {
      String? nivel = g!.setNivel("medio");
      int res = g!.getNivelSize(nivel!);
      expect(res, 161);
    });
    test('Nível Fácil Test 24x24', () {
      String? res = g!.setNivel("dificil");
      expect(res, "dificil");
    });

    test('Nível Fácil Test 8x8 Size Table', () {
      String? nivel = g!.setNivel("dificil");
      int res = g!.getNivelSize(nivel!);
      expect(res, 577);
    });

    test('Nível Fácil Test Null', () {
      try {
        String? res = g!.setNivel("");
        expect(res, "");
      } on ExceptionNivelGame catch (e) {
        print("$e");
      }
    });
  });
}

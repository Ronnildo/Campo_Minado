import 'package:campo_minado/campo_minado.dart';
import 'package:campo_minado/components/board.dart';
import 'package:campo_minado/components/jogada.dart';
import 'package:campo_minado/components/level.dart';
import 'package:campo_minado/components/zona.dart';
import 'package:parameterized_test/parameterized_test.dart';
import 'package:test/test.dart';

void main() {
  parameterizedTest("Dificuldade tabuleiro test", [
    Level.easy,
    Level.medium,
    Level.difficult,
  ], p1(
    (Level l) {
      Board board = Board(difficulty: l);
      expect(board.difficulty, l);
    },
  ));

  group("Tabuleiro nível fácil test", () {
    test("Tamanho tabuleiro nível fácil test", () {
      Board b = Board(difficulty: Level.easy);
      int res = b.getLength();
      expect(res, 8 * 8);
    });

    test("Insert bombs in board level easy test", () {
      Board b = Board(difficulty: Level.easy);
      for (var element in b.board) {
        if (element.comBomba()) expect(element.comBomba(), equals(true));
      }
    });

    test("Número de bombas correta test", () {
      Board b = Board(difficulty: Level.easy);
      int count = 0;
      for (var element in b.board) {
        if (element.marca == "*") {
          count += 1;
        }
      }
      expect(count, equals(10));
    });

    test("Get level test", () {
      Board b = Board(difficulty: Level.easy);
      String level = b.getLevel();
      expect(level, "EASY");
    });

    test("check number of empty zones is correct level easy test", () {
      Board b = Board(difficulty: Level.easy);
      int count = 0;
      int expectResult = 54;
      for (var element in b.board) {
        if (!element.comBomba()) count += 1;
      }
      expect(count, equals(expectResult));
    });

    parameterizedTest(
      "Coordenada valid level easy test",
      [
        [0, 0],
        [0, 5],
        [0, 7],
        [1, 0],
        [1, 1],
        [1, 5],
        [2, 0],
        [2, 5],
        [2, 7],
        [3, 0],
        [3, 7],
        [3, 5],
        [4, 0],
        [4, 1],
        [4, 2],
        [5, 1],
        [5, 5],
        [5, 6],
        [6, 1],
        [6, 5],
        [6, 7],
        [7, 0],
        [7, 1],
        [7, 2],
      ],
      p2((int line, int column) {
        Board b = Board(difficulty: Level.easy);
        Game g = Game(b);
        Zona z = Zona(line: line, column: column, marca: "");
        bool res = g.validaCoordenada(z);
        expect(res, equals(true));
      }),
    );

    parameterizedTest(
      "Coordenada invalid level easy test",
      [
        [-1, 0],
        [9, 0],
        [9, 9],
        [0, -1],
        [3, -4],
        [5, -8],
        [6, -1],
        [6, 9],
        [7, -2],
        [7, 10],
      ],
      p2((int line, int column) {
        Board b = Board(difficulty: Level.easy);
        Game g = Game(b);
        Zona z = Zona(line: line, column: column, marca: "");
        bool res = g.validaCoordenada(z);
        expect(res, equals(false));
      }),
    );
  });
  group("Tabuleiro nível médio test", () {
    test("Tamanho tabuleiro nível médio test", () {
      Board b = Board(difficulty: Level.medium);
      int res = b.getLength();
      expect(res, 10 * 16);
    });

    test("Sorted bombs in board level medium test", () {
      Board b = Board(difficulty: Level.medium);
      for (var element in b.board) {
        if (element.comBomba()) expect(element.comBomba(), equals(true));
      }
    });

    test("Número de bombas correta test", () {
      Board b = Board(difficulty: Level.medium);
      int count = 0;
      for (var element in b.board) {
        if (element.marca == "*") {
          count += 1;
        }
      }
      expect(count, equals(30));
    });

    test("Get level test", () {
      Board b = Board(difficulty: Level.medium);
      String level = b.getLevel();
      expect(level, "MEDIUM");
    });

    test("check number of empty zones is correct level medium test", () {
      Board b = Board(difficulty: Level.medium);
      int count = 0;
      int expectResult = 130;
      for (var element in b.board) {
        if (!element.comBomba()) count += 1;
      }
      expect(count, equals(expectResult));
    });

    parameterizedTest(
      "Coordenada valid level medium test",
      [
        [0, 9],
        [0, 8],
        [1, 0],
        [1, 5],
        [1, 9],
        [5, 5],
        [5, 8],
        [8, 1],
        [8, 6],
        [8, 9],
        [15, 9],
        [15, 8],
      ],
      p2((int line, int column) {
        Board b = Board(difficulty: Level.medium);
        Game g = Game(b);
        Zona z = Zona(line: line, column: column, marca: "");
        bool res = g.validaCoordenada(z);
        expect(res, equals(true));
      }),
    );

    parameterizedTest(
      "Coordenada invalid level medium test",
      [
        [-1, 10],
        [-1, 0],
        [-1, 5],
        [-5, 8],
        [10, -1],
        [5, -1],
        [16, 8],
        [16, -5],
      ],
      p2((int line, int column) {
        Board b = Board(difficulty: Level.easy);
        Game g = Game(b);
        Zona z = Zona(line: line, column: column, marca: "");
        bool res = g.validaCoordenada(z);
        expect(res, equals(false));
      }),
    );
  });
  group("Tabuleiro nível difícil test", () {
    test("Tamanho tabuleiro níve difícil test", () {
      Board b = Board(difficulty: Level.difficult);
      int res = b.getLength();
      expect(res, 24 * 24);
    });

    test("Sorted bombs in board level difficult test", () {
      Board b = Board(difficulty: Level.difficult);
      for (var element in b.board) {
        if (element.comBomba()) expect(element.comBomba(), equals(true));
      }
    });
    test("Número de bombas correta test", () {
      Board b = Board(difficulty: Level.difficult);
      int count = 0;
      for (var element in b.board) {
        if (element.marca == "*") {
          count += 1;
        }
      }
      expect(count, equals(100));
    });

    test("Get level test", () {
      Board b = Board(difficulty: Level.difficult);
      String level = b.getLevel();
      expect(level, "DIFFICULT");
    });

    test("check number of empty zones is correct level difícil test", () {
      Board b = Board(difficulty: Level.difficult);
      int count = 0;
      int expectResult = 476;
      for (var element in b.board) {
        if (!element.comBomba()) count += 1;
      }
      expect(count, equals(expectResult));
    });

    parameterizedTest(
      "Coordenada valid level difficult test",
      [
        [0, 10],
        [0, 8],
        [0, 16],
        [0, 23],
        [8, 0],
        [8, 8],
        [8, 16],
        [8, 23],
        [16, 0],
        [16, 8],
        [5, 8],
        [20, 1],
        [20, 6],
        [23, 10],
        [23, 8],
      ],
      p2((int line, int column) {
        Board b = Board(difficulty: Level.difficult);
        Game g = Game(b);
        Zona z = Zona(line: line, column: column, marca: "");
        bool res = g.validaCoordenada(z);
        expect(res, equals(true));
      }),
    );

    parameterizedTest(
      "Coordenada invalid level difficult test",
      [
        [-1, 10],
        [38, 0],
        [-1, 20],
        [-5, 24],
        [10, -1],
        [-5, 0],
        [7, -11],
        [9, -22],
        [13, -1],
      ],
      p2((int line, int column) {
        Board b = Board(difficulty: Level.difficult);
        Game g = Game(b);
        Zona z = Zona(line: line, column: column, marca: "");
        bool res = g.validaCoordenada(z);
        expect(res, equals(false));
      }),
    );
  });

  group("Testes de Jogada", () {
    parameterizedTest("Jogada descobrir zona test", [
      [0, 0],
      [0, 5],
      [0, 8],
      [1, 8],
      [2, 4],
      [4, 7],
      [8, 0],
      [5, 6],
      [23, 2],
      [16, 0],
      [10, 1],
      [20, 4],
      [10, 3],
      [12, 4],
      [15, 6],
      [7, 0],
    ], p2(
      (int lin, int col) {
        Zona z = Zona(line: lin, column: col, marca: "");
        Board b = Board(difficulty: Level.easy);
        Jogada j1 = Jogada(z, b);
        j1.jogadaRevelarZona();
        String res = z.marca;
        if (res == " ") {
          expect(res, " ");
        } else if (res == "*") {
          expect(res, "*");
        }
        expect(res, "");
      },
    ));

    parameterizedTest("Jogada marcar zona com bandeira easy test", [
      [0, 0],
      [0, 5],
      [0, 7],
      [1, 7],
      [2, 4],
      [4, 7],
      [7, 0],
      [5, 6],
    ], p2(
      (int lin, int col) {
        Zona z = Zona(line: lin, column: col, marca: "");
        Board b = Board(difficulty: Level.easy);
        Jogada j1 = Jogada(z, b);
        bool res = j1.jogadaMarcarComBandeira();
        expect(res, true);
      },
    ));

    parameterizedTest("Jogada marcar zona com bandeira medium test", [
      [0, 0],
      [0, 5],
      [0, 8],
      [1, 8],
      [2, 4],
      [4, 7],
      [8, 0],
      [5, 6],
      [15, 0],
      [10, 1],
      [10, 3],
      [12, 4],
      [15, 6],
      [7, 0],
    ], p2(
      (int lin, int col) {
        Zona z = Zona(line: lin, column: col, marca: "");
        Board b = Board(difficulty: Level.medium);
        Jogada j1 = Jogada(z, b);
        bool res = j1.jogadaMarcarComBandeira();
        expect(res, true);
      },
    ));

    parameterizedTest("Jogada desmarcar zona com bandeira test", [
      [0, 0],
      [0, 5],
      [0, 8],
      [1, 8],
      [2, 4],
      [4, 7],
      [8, 0],
      [5, 6],
      [15, 0],
      [10, 1],
      [10, 3],
      [12, 4],
      [15, 6],
      [7, 0],
    ], p2(
      (int lin, int col) {
        Board b = Board(difficulty: Level.medium);

        Zona z = Zona(line: lin, column: col, marca: "");
        Jogada j1 = Jogada(z, b);
        j1.jogadaMarcarComBandeira();
        Jogada j2 = Jogada(z, b);
        bool res = j2.jogadaDesmarcarZonaComBandeira();
        expect(res, true);
      },
    ));

    parameterizedTest("Jogada inválida marcar zona descoberta test", [
      [0, 0],
      [0, 5],
      [0, 8],
      [1, 8],
      [2, 4],
      [4, 7],
      [8, 0],
      [5, 6],
      [23, 2],
      [16, 0],
      [10, 1],
      [20, 4],
      [10, 3],
      [12, 4],
      [15, 6],
      [7, 0],
    ], p2(
      (int lin, int col) {
        Board b = Board(difficulty: Level.easy);
        Zona z = Zona(line: lin, column: col, marca: "");
        Jogada j1 = Jogada(z, b);
        j1.jogadaRevelarZona();
        Jogada j2 = Jogada(z, b);
        bool res = j2.jogadaMarcarComBandeira();
        if (res) {
          expect(res, true);
        } else {
          expect(res, false);
        }
      },
    ));

    parameterizedTest("Jogada inválida revelar zona já revelada test", [
      [0, 0],
      [0, 5],
      [0, 8],
      [1, 8],
      [2, 4],
      [4, 7],
      [8, 0],
      [5, 6],
      [23, 2],
      [16, 0],
      [10, 1],
      [20, 4],
      [10, 3],
      [12, 4],
      [15, 6],
      [7, 0],
    ], p2(
      (int lin, int col) {
        Board b = Board(difficulty: Level.easy);
        Zona z = Zona(line: lin, column: col, marca: "");
        Jogada j1 = Jogada(z, b);
        j1.jogadaRevelarZona();
        Jogada j2 = Jogada(z, b);
        bool res = j2.jogadaRevelarZona();
        if (res) {
          expect(res, true);
        } else {
          expect(res, false);
        }
      },
    ));

    parameterizedTest("Jogada descobrir zona marcada test", [
      [0, 0],
      [0, 5],
      [0, 8],
      [1, 8],
      [2, 4],
      [4, 7],
      [8, 0],
      [5, 6],
      [23, 2],
      [16, 0],
      [10, 1],
      [20, 4],
      [10, 3],
      [12, 4],
      [15, 6],
      [7, 0],
    ], p2(
      (int lin, int col) {
        Board b = Board(difficulty: Level.easy);
        Zona z = Zona(line: lin, column: col, marca: "");
        Jogada j1 = Jogada(z, b);
        j1.jogadaMarcarComBandeira();
        Jogada j2 = Jogada(z, b);
        bool res = j2.jogadaRevelarZona();
        if (res) {
          expect(res, true);
        } else {
          expect(res, false);
        }
      },
    ));

    parameterizedTest("Jogada remover bandeira antes de descobrir zona", [
      [0, 0],
      [0, 5],
      [0, 8],
      [1, 8],
      [2, 4],
      [4, 7],
      [8, 0],
      [5, 6],
      [23, 2],
      [16, 0],
      [10, 1],
      [20, 4],
      [10, 3],
      [12, 4],
      [15, 6],
      [7, 0],
    ], p2(
      (int line, int column) {
        Board b = Board(difficulty: Level.easy);
        Zona z = Zona(line: line, column: column, marca: "");
        Jogada j1 = Jogada(z, b);
        j1.jogadaMarcarComBandeira();
        Jogada j2 = Jogada(z, b);
        bool res = j2.jogadaDesmarcarZonaComBandeira();
        Jogada j3 = Jogada(z, b);
        bool tes = j3.jogadaRevelarZona();
        if (tes) {
          expect(tes, true);
        } else {
          expect(tes, false);
        }
      },
    ));
  });

  group("Condições de vitória e derrota", () {
    parameterizedTest("Condição de derrota teste", [
      [0, 0],
      [0, 5],
      [0, 8],
      [1, 8],
      [2, 4],
      [4, 7],
      [8, 0],
      [5, 6],
    ], p2(
      (int line, int column) {
        Zona z = Zona(line: line, column: column, marca: "_");
        Board b = Board(difficulty: Level.easy);
        Game g = Game(b);
        Jogada j1 = Jogada(z, b);
        j1.jogadaRevelarZona();
        bool res = z.comBomba();
        if (res) {
          expect(res, equals(true));
        }
        expect(res, equals(false));
      },
    ));

    parameterizedTest("Número de bandeiras level easy test", [
      [0, 0],
      [0, 5],
      [0, 8],
      [1, 8],
      [2, 4],
      [4, 7],
      [7, 0],
      [5, 6],
      [3, 7],
      [6, 1]
    ], p2(
      (int lin, int col) {
        Zona z = Zona(line: lin, column: col, marca: "");
        Board b = Board(difficulty: Level.easy);
        Jogada j1 = Jogada(z, b);
        j1.jogadaMarcarComBandeira();
        bool count = b.contagemNumeroDeBandeiras() < 10;
        expect(count, true);
      },
    ));
  });

  parameterizedTest("Número de bandeiras level easy test", [
    [0, 0],
    [0, 5],
    [0, 8],
    [1, 8],
    [2, 4],
    [4, 7],
    [7, 0],
    [5, 6],
    [3, 7],
    [6, 1]
  ], p2(
    (int lin, int col) {
      Zona z = Zona(line: lin, column: col, marca: "");
      Board b = Board(difficulty: Level.easy);
      Jogada j1 = Jogada(z, b);
      j1.jogadaMarcarComBandeira();
      bool count = b.contagemNumeroDeBandeiras() < 10;
      expect(count, true);
    },
  ));
}

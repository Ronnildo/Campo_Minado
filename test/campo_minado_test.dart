import 'package:campo_minado/components/board.dart';
import 'package:campo_minado/components/coordenada.dart';
import 'package:campo_minado/components/jogada.dart';
import 'package:campo_minado/components/level.dart';
import 'package:campo_minado/components/zona.dart';
import 'package:parameterized_test/parameterized_test.dart';
import 'package:test/test.dart';

void main() {
  Coordenada c;
  setUp(() {});

  group("Start game test", () {
    // teste que verifica se todas as zonas estão vazias
    parameterizedTest(
      "Init game Start",
      [
        Level.easy,
        Level.medium,
        Level.difficult,
      ],
      p1(
        (Level l) {
          Board b = Board(l);
          String res = b.getLevel();
          expect(res, l.name.toUpperCase());
        },
      ),
    );

    parameterizedTest("Sorted Bombs por Level", [
      Level.easy,
      Level.medium,
      Level.difficult,
    ], p1(
      (Level l) {
        Board b = Board(l);
        List bombs = b.sortedBombs();
        for (int i = 0; i <= b.board.length; i++) {
          if (bombs.contains(i)) {
            expect(bombs.contains(i), true);
          }
        }
      },
    ));
  });
  group("Board level easy test", () {
    // teste tamanho do tabuleiro
    test("Set length easy test", () {
      Board b = Board(Level.easy);
      int res = b.board.length;
      expect(res, 64);
    });

    test("Get level test", () {
      Board b = Board(Level.easy);
      String level = b.getLevel();
      expect(level, "EASY");
    });

    test("Sorted bombs in board level easy", () {
      Board b = Board(Level.easy);
      for (var element in b.board) {
        if (element == -1) expect(element, -1);
      }
    });

    parameterizedTest(
      "Coordenada invalid level easy test",
      [
        [0, 0],
        [0, 5],
        [0, 8],
        [1, 0],
        [1, 1],
        [1, 5],
        [2, 0],
        [2, 5],
        [2, 8],
        [3, 0],
        [3, 7],
        [3, 8],
        [4, 0],
        [4, 1],
        [4, 2],
        [5, 1],
        [5, 5],
        [5, 6],
        [6, 1],
        [6, 7],
        [6, 8],
        [7, 0],
        [7, 1],
        [7, 2],
        [8, 0],
        [8, 6],
      ],
      p2((int line, int column) {
        Board b = Board(Level.easy);
        c = Coordenada(line, column);
        bool res = c.validaCoordenada(b.getLevel());
        expect(res, true);
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
        Board b = Board(Level.easy);
        c = Coordenada(line, column);
        bool res = c.validaCoordenada(b.getLevel());
        expect(res, false);
      }),
    );

    test("Insert bombs level easy test", () {
      Board b = Board(Level.easy);
      for (var element in b.board) {
        if (element.comBomba) expect(element.comBomba, true);
      }
    });

    test("Count bombs in level easy", () {
      Board b = Board(Level.easy);
      int countBombs = 0;
      for (var element in b.board) {
        if (element.comBomba) {
          countBombs += 1;
        }
      }
      expect(countBombs, 10);
    });

    // parameterizedTest(
    //   "adjacencies at the corners of the board",
    //   [
    //     [0, 0],
    //     [0, 8],
    //     [8, 0],
    //     [Level.easy],
    //   ],
    //   p2(
    //     (int line, int column) {
    //       Board b = Board(Level.easy);
    //     },
    //   ),
    // );
  });

  group("Board level medium test", () {
    // teste tamanho do tabuleiro
    test("Set length medium test", () {
      Board b = Board(Level.medium);

      int res = b.board.length;
      expect(res, 160);
    });

    test("Get level test", () {
      Board b = Board(Level.medium);
      String level = b.getLevel();
      expect(level, "MEDIUM");
    });

    parameterizedTest(
      "Coordenada valid level medium test",
      [
        [0, 10],
        [0, 8],
        [5, 5],
        [5, 8],
        [8, 1],
        [8, 6],
        [16, 10],
        [16, 8],
      ],
      p2((int line, int column) {
        Board b = Board(Level.medium);
        c = Coordenada(line, column);
        bool res = c.validaCoordenada(b.getLevel());
        expect(res, true);
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
        [5, -1]
      ],
      p2((int line, int column) {
        Board b = Board(Level.medium);
        c = Coordenada(line, column);
        bool res = c.validaCoordenada(b.getLevel());
        expect(res, false);
      }),
    );

    test("Insert bombs level medium test", () {
      Board b = Board(Level.medium);
      for (var element in b.board) {
        if (element.comBomba) expect(element.comBomba, true);
      }
    });

    test("Count bombs in level medium", () {
      Board b = Board(Level.medium);
      int countBombs = 0;
      for (var element in b.board) {
        if (element.comBomba) {
          countBombs += 1;
        }
      }
      expect(countBombs, 30);
    });
  });

  group("Board level difficult test", () {
    // teste tamanho do tabuleiro
    test("Set length difficult test", () {
      Board b = Board(Level.difficult);

      int res = b.board.length;
      expect(res, 576);
    });

    test("Get level test", () {
      Board b = Board(Level.difficult);
      String level = b.getLevel();
      expect(level, "DIFFICULT");
    });

    parameterizedTest(
      "Coordenada valid level difficult test",
      [
        [0, 10],
        [0, 8],
        [16, 5],
        [5, 8],
        [20, 1],
        [20, 6],
        [24, 10],
        [24, 8],
      ],
      p2((int line, int column) {
        Board b = Board(Level.difficult);
        c = Coordenada(line, column);
        bool res = c.validaCoordenada(b.getLevel());
        expect(res, true);
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
        [5, -1]
      ],
      p2((int line, int column) {
        Board b = Board(Level.difficult);

        c = Coordenada(line, column);
        bool res = c.validaCoordenada(b.getLevel());
        expect(res, false);
      }),
    );

    test("Insert bombs level difficult test", () {
      Board b = Board(Level.difficult);
      b.insertBombs();
      for (var element in b.board) {
        if (element.comBomba) expect(element.comBomba, true);
      }
    });

    test("Count bombs in level difficult", () {
      Board b = Board(Level.difficult);
      int countBombs = 0;
      for (var element in b.board) {
        if (element.comBomba) {
          countBombs += 1;
        }
      }
      expect(countBombs, 100);
    });
  });

  group("Jogada test", () {
    parameterizedTest("Jogada em zona coberta test", [
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
        Board b = Board(Level.easy);
        Zona z = Zona(
          line,
          column,
        );
        Jogada j = Jogada(z, b);
        bool res = j.jogadaEmZonaAberta();
        if (!res) {
          expect(res, equals(false));
        } else {
          expect(res, equals(true));
        }
      },
    ));

    parameterizedTest("Jogada em zona com bomba test", [
      [0, 0],
      [0, 5],
      [0, 8],
      [1, 8],
      [2, 4],
      [4, 7],
      [8, 0],
      [5, 6],
    ], p2(
      (int l, int col) {
        Board b = Board(Level.easy);
        Zona z = Zona(l, col);
        Jogada j = Jogada(z, b);
        bool res = j.jogadaEmZonaComBomba();
        if (res) {
          expect(res, equals(true));
        } else {
          expect(res, equals(false));
        }
      },
    ));

    parameterizedTest("Jogada em zona marcada com bandeira test", [
      [0, 0],
      [0, 5],
      [0, 8],
      [1, 8],
      [2, 4],
      [4, 7],
      [8, 0],
      [5, 6],
    ], p2(
      (int ln, int col) {
        Board b = Board(Level.easy);
        Zona z = Zona(ln, col);
        Jogada j1 = Jogada(z, b);
        j1.c.marcaComBandeira();
        Jogada j2 = Jogada(z, b);
        bool res = j2.jogadaEmZonaComBandeira();
        if (res) {
          expect(res, equals(true));
        } else {
          expect(res, equals(false));
        }
      },
    ));

    parameterizedTest("Jogada em zona já descoberta", [
      [0, 0],
      [0, 5],
      [0, 8],
      [1, 8],
      [2, 4],
      [4, 7],
      [8, 0],
      [5, 6],
    ], p2(
      (int ln, int col) {
        Board b = Board(Level.easy);
        Zona z = Zona(ln, col);
        Jogada j1 = Jogada(z, b);
        j1.c.openZone();
        Jogada j2 = Jogada(z, b);
        bool res = j2.jogadaEmZonaAberta();
        if (res) {
          expect(res, equals(true));
        } else {
          expect(res, equals(false));
        }
      },
    ));

    parameterizedTest("jogada inválida marcar zona já aberta", [
      [0, 0],
      [0, 5],
      [0, 8],
      [1, 8],
      [2, 4],
      [4, 7],
      [8, 0],
      [5, 6],
    ], p2(
      (int ln, int col) {
        Board b = Board(Level.easy);
        Zona z = Zona(ln, col);
        Jogada j1 = Jogada(z, b);
        j1.c.openZone();
        Jogada j2 = Jogada(z, b);
        bool res = j2.jogadaEmZonaAberta();
        if (res) {
          expect(res, equals(true));
        } else {
          expect(res, equals(false));
        }
      },
    ));

    parameterizedTest("Jogava inválida descobrir zona com bandeira", [
      [0, 0],
      [0, 5],
      [0, 8],
      [1, 8],
      [2, 4],
      [4, 7],
      [8, 0],
      [5, 6],
    ], p2(
      (int ln, int col) {
        Board b = Board(Level.easy);
        Zona z = Zona(ln, col);
        Jogada j1 = Jogada(z, b);
        j1.c.marcaComBandeira();
        Jogada j2 = Jogada(z, b);
        bool res = j2.jogadaDescobrirZonaComBandeira();
        if (res) {
          expect(res, equals(true));
        } else {
          expect(res, equals(false));
        }
      },
    ));

    parameterizedTest("Jogada inválida cobrir zona descoberta", [
      [0, 0],
      [0, 5],
      [0, 8],
      [1, 8],
      [2, 4],
      [4, 7],
      [8, 0],
      [5, 6],
    ], p2(
      (int ln, int col) {
        Board b = Board(Level.easy);
        Zona z = Zona(ln, col);
        Jogada j1 = Jogada(z, b);
        j1.c.openZone();
        Jogada j2 = Jogada(z, b);
        bool res = j2.jogadaCobrirComBandeiraZonaDescoberta();
        if (res) {
          expect(res, equals(true));
        } else {
          expect(res, equals(false));
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
    ], p2(
      (int ln, int col) {
        Board b = Board(Level.easy);
        Zona z = Zona(ln, col);
        Jogada j1 = Jogada(z, b);
        j1.c.marcaComBandeira();
        Jogada j2 = Jogada(z, b);
        j2.c.removeBandeira();
        Jogada j3 = Jogada(z, b);
        j3.c.removeBandeira();
        bool res = j3.jogadaDescobrirZonaSemBandeira();
        if (res) {
          expect(res, equals(true));
        } else {
          expect(res, equals(false));
        }
      },
    ));
  });

  group("Game test", () {
    test("", () {});
  });
}

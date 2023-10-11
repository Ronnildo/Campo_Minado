class Coordenada {
  late int _x;
  late int _y;

  Coordenada(int line, int column) {
    _x = line;
    _y = column;
  }

  // ignore: unnecessary_getters_setters
  int get x => _x;
  set x(int x) => _x = x;

  // ignore: unnecessary_getters_setters
  int get y => _y;
  set y(int x) => _y = x;
}

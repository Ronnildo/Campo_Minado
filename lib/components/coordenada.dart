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

  bool validaCoordenada(String level) {
    int pass = 0;
    if (level == "EASY") {
      if (_x >= 0 && _x <= 8 && _y >= 0 && _y <= 8) {
        return true;
      } else {
        return false;
      }
    } else if (level == "MEDIUM") {
      if (_x >= 0 && _x <= 16 && _y >= 0 && _y <= 10) {
        return true;
      }
    } else if (level == "DIFFICULT") {
      if (_x >= 0 && _x <= 24 && _y >= 0 && _y <= 24) {
        return true;
      }
    }
    return false;
  }
}

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

  bool validaCoordenada(int length) {
    int pass = 0;
    if (length == 64) {
      if (_x >= 0 && _x <= 8 && _y >= 0 && _y <= 8) {
        return true;
      } else {
        return false;
      }
    }
    return false;
    // if (_x >= 0 && _x < length && _y >= 0 && _y <= length) {
    //   if (length % pass == 0) {
    //     return true;
    //   } else {
    //     return false;
    //   }
    // } else {
    //   return false;
    // }
  }
}

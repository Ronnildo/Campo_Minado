import 'package:campo_minado/components/board.dart';
import 'package:campo_minado/components/zona.dart';

class Jogada {
  Zona _zona;
  Board _b;
  Jogada(this._zona, this._b);

  get zonaJ => _zona;

  get zona => _zona;
  jogadaRevelarZona() {
    for (var element in _b.board) {
      if (element.line == zona.line && element.column == zona.column) {
        if (!element.comBomba() &&
            !element.aberto() &&
            !element.comBandeira()) {
          element.abrirZona();
          return true;
        }
      }
      return false;
    }
  }

  jogadaMarcarComBandeira() {
    for (var element in _b.board) {
      if (element.line == zona.line && element.column == zona.column) {
        if (!element.aberto() &&
            _b.contagemNumeroDeBandeiras() < _b.insertMines()) {
          element.marcarComBandeira();
          return true;
        }
      }
    }
    return false;
  }

  jogadaDesmarcarZonaComBandeira() {
    for (var element in _b.board) {
      if (element.line == zona.line && element.column == zona.column) {
        if (element.comBandeira() && !element.aberto()) {
          element.desmarcarZonaComBandeira();
          return true;
        }
      }
    }

    return false;
  }

  gameOver() {
    for (var element in _b.board) {
      if (element.comBomba()) {
        return true;
      }
    }
    return false;
  }
}

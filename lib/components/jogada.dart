import 'package:campo_minado/components/board.dart';
import 'package:campo_minado/components/zona.dart';

class Jogada {
  final Zona c;
  final Board t;
  Jogada(
    this.c,
    this.t,
  );

  bool jogadaEmZonaCoberta() {
    if (!c.aberto) {
      return true;
    }
    return false;
  }

  bool jogadaEmZonaAberta() {
    if (c.aberto) {
      return true;
    }
    return false;
  }

  bool jogadaEmZonaComBomba() {
    if (c.comBomba) {
      return true;
    }
    return false;
  }

  bool jogadaEmZonaComBandeira() {
    if (c.bandeira) {
      return true;
    } else {
      return false;
    }
  }

  bool jogadaDescobrirZonaComBandeira() {
    if (c.bandeira) {
      return true;
    }
    return false;
  }

  bool jogadaCobrirComBandeiraZonaDescoberta() {
    if (c.aberto) {
      return true;
    }
    return false;
  }

  bool jogadaDescobrirZonaSemBandeira() {
    if (!c.bandeira) {
      return true;
    }
    return false;
  }
}

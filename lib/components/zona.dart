class Zona {
  int line;
  int column;
  final List<Zona> neighbors = [];

  String marca = "";

  Zona({required this.line, required this.column, required this.marca});

  minar() {
    marca = "*";
  }

  void calcularAdjacentes(Zona neighbor) {
    final positionLine = (line - neighbor.line).abs();
    final positionColumn = (line - neighbor.column).abs();

    if (positionLine == 0 && positionColumn == 0) {
      return;
    }

    if (positionLine <= 1 && positionColumn <= 1) {
      neighbors.add(neighbor);
    }
  }

  abrirZona() {
    if (marca == " ") {
      return;
    }
    marca = " ";
    if (marca == "*") {
      return "*";
    }
    if (vizinhancaSegura) {
      neighbors.forEach((element) => element.abrirZona());
    }
  }

  marcarComBandeira() {
    marca = "B";
  }

  desmarcarZonaComBandeira() {
    if (marca == "B") {
      marca = "_";
    } else {
      return;
    }
  }

  comBomba() {
    if (marca == "*") {
      return true;
    }
    return false;
  }

  aberto() {
    if (marca == " ") {
      return true;
    }
    return false;
  }

  comBandeira() {
    if (marca == "B") {
      return true;
    }
    return false;
  }

  resetGame() {
    marca = "_";
  }

  revealBombs() {
    if (marca == "*") {
      marca = "*";
    }
  }

  bool get vizinhancaSegura {
    return neighbors.every((element) => element.marca != "*");
  }

  bool get resolvido {
    bool minadoEMarcado = comBomba() && comBandeira();
    bool seguroEAberto = !comBomba() && aberto();
    return minadoEMarcado || seguroEAberto;
  }

  int get qtdeMinasVizinhas {
    return neighbors.where((v) => v.comBomba()).length;
  }
}

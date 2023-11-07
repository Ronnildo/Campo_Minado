class Zona {
  final int _line;
  final int _column;
  final List<Zona> neighbors = [];

  bool _aberto = false;
  bool _bandeira = false;
  bool _comBomba = false;
  bool _explosao = false;

  Zona(this._line, this._column);

  get line => _line;

  get column => _column;

  void pumpsAdjacent(Zona neighbor) {
    final positionLine = (_line - neighbor._line).abs();
    final positionColumn = (_line - neighbor._column).abs();

    if (positionLine == 0 && positionColumn == 0) {
      return;
    }

    if (positionLine <= 1 && positionColumn <= 1) {
      neighbors.add(neighbor);
    }
  }

  void openZone() {
    if (_aberto) {
      return;
    }
    _aberto = true;

    if (_comBomba) {
      _explosao = true;
    }

    if (neighborSafe) {
      neighbors.forEach((element) => element.openZone());
    }
  }

  void revealBomb() {
    if (_comBomba) {
      _aberto = true;
    }
  }

  void marcaComBandeira() {
    _bandeira = true;
  }

  void bombInPosition() {
    _comBomba = true;
  }

  void removeBandeira() {
    _bandeira = !_bandeira;
  }

  void resetGame() {
    _aberto = false;
    _bandeira = false;
    _comBomba = false;
    _explosao = false;
  }

  bool get comBomba {
    return _comBomba;
  }

  bool get explosao {
    return _explosao;
  }

  bool get aberto {
    return _aberto;
  }

  bool get bandeira {
    return _bandeira;
  }

  bool get neighborSafe {
    return neighbors.every((v) => !v._comBomba);
  }

  bool get resolvido {
    bool minadoEMarcado = comBomba && bandeira;
    bool seguroEAberto = !comBomba && aberto;
    return minadoEMarcado || seguroEAberto;
  }

  int get qtdeMinasNaVizinhanca {
    return neighbors.where((v) => v.comBomba).length;
  }
}

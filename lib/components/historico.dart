import 'dart:io';

import 'package:campo_minado/components/jogador.dart';

class Historico {
  Jogador _j;
  DateTime _time;

  Historico(this._j, this._time);

  salvarNoHistorico(int second) async {
    var logFile = File("./historico.txt");
    var sink = logFile.openWrite();
    sink.write(
        "Jogador: ${_j.name}; Data: ${_time.day}/${_time.month}/${_time.year}; Duração: ${calcularTempoDePartida(second)}");
    await sink.flush();
    await sink.close();
  }

  calcularTempoDePartida(int second) {
    DateTime finalTime = DateTime.now();
    int tempo = finalTime.second - second;
    return tempo;
  }

  recuperarHistorico() async {
    var arq = File("./historico.txt");
    try {
      var conteudo = await arq.readAsBytes();
      print(conteudo);
    } catch (e) {
      print(e);
    }
  }
}

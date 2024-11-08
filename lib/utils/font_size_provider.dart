import 'package:flutter/material.dart';

class FontSizeProvider with ChangeNotifier {
  double _fontSize = 18.0;  // Tamanho padrão

  double get fontSize => _fontSize;

  // Aumenta o tamanho da fonte
  void increaseFontSize() {
    _fontSize += 2.0; // Ajuste o valor conforme necessário
    notifyListeners(); // Notifica os ouvintes para atualizar os widgets
  }

  // Diminui o tamanho da fonte
  void decreaseFontSize() {
    if (_fontSize > 10.0) {
      _fontSize -= 2.0; // Ajuste o valor conforme necessário
      notifyListeners(); // Notifica os ouvintes para atualizar os widgets
    }
  }
}

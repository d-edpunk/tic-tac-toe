import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class CellState with ChangeNotifier {
  bool? state;

  void changeState() {
    state = !(state ?? false);
    notifyListeners();
  }
}

// ignore_for_file: file_names
import 'package:flutter/cupertino.dart';

class BulbColor extends ChangeNotifier {
  String bulbColor = "#ffd139";
  bool isOn = true;
  String opacity = "1";

  void changeColor(String newColor) {
    bulbColor = newColor;
    notifyListeners();
  }

  void changeOpacity(String newOpacity) {
    opacity = newOpacity;
    notifyListeners();
  }

  void turnOff() {
    isOn = !isOn;
    notifyListeners();
  }
}

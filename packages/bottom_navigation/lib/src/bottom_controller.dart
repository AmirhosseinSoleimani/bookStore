import 'package:flutter/material.dart';

class BottomController extends ChangeNotifier {
  int index;
  int? oldIndex;

  BottomController({this.index = 0});

  jumpTo(int index) {
    oldIndex = this.index;
    this.index = index;
    notifyListeners();
  }
}
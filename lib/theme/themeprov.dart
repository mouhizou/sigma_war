import 'package:flutter/material.dart';
import 'package:sigma_wor/theme/themes.dart';
class themeprov extends ChangeNotifier{
  ThemeData _themeData = bandw;
  ThemeData get themeData => _themeData;
  set themeData (ThemeData themeData){
    _themeData = themeData;
    notifyListeners();
  }
  void setto(int i ){
    switch(i){
      case 0: themeData = violet;
      case 1: themeData = purple;
      case 2: themeData = blue;
      case 3: themeData = golden;
      case 4: themeData = bandw;
    }
  }
}
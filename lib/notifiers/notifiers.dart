import 'package:flutter/material.dart';

class SelectTabNotifier extends ValueNotifier<int>  {
  SelectTabNotifier(int value) : super(value);

  void changeTab(int item) {
    value = item;
    notifyListeners();
  }
  int getTabItem(){
    return value;
  }

}
import 'dart:math';
import 'package:flutter/material.dart';

class UsereChoice extends ChangeNotifier {
  String choisceComplexity = 'easy';
  int result = 0;
  int maxNumber = 9;
  int addNumer = 1;
  List<String> ansversResult = []; // 'n' - none, t = true, f = false
  List<int> a = [];
  List<int> b = [];

  void createData(String complexity) {
    choisceComplexity = complexity;
    if (complexity == 'easy') {
      maxNumber = 9;
      addNumer = 1;
    }
    if (complexity == 'normal') {
      maxNumber = 89;
      addNumer = 10;
    }
    if (complexity == 'hard') {
      maxNumber = 899;
      addNumer = 100;
    }
    a = [];
    b = [];
    for (int i = 0; i < 5; i++) {
      a.add(Random().nextInt(maxNumber) + addNumer);
      b.add(Random().nextInt(maxNumber) + addNumer);
      ansversResult.add('n');
    }
  }

  void setResult(int userResult) {
    result = userResult;
  }
}

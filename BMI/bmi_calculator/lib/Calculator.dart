import 'dart:math';
import 'package:flutter/material.dart';

class Calculator {
  Calculator({this.height, this.weight});

  double _ans;
//private value using (  _  )
  final double height;
  final int weight;
  String calculateBMI() {
    _ans = weight / pow(height, 2);
    return _ans.toStringAsPrecision(3);
  }

  String getResult() {
    if (_ans >= 25)
      return 'OverWeight';
    else if (_ans > 18.5)
      return 'Normal';
    else
      return ' UnderWeight';
  }

  String Interpetation() {
    if (_ans >= 25)
      return 'You are higher than normal body weight. Try to excercise more';
    else if (_ans > 18.5)
      return 'Good job ! You have a normal body Weight, ';
    else
      return 'You have a lower than normal body weight .You can eat bit more.';
  }

  Color symbol() {
    if (_ans >= 25)
      return Colors.red;
    else if (_ans > 18.5)
      return Colors.green;
    else
      return Colors.red;
  }
}

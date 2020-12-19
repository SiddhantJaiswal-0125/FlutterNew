import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'input_page.dart';

void main() => runApp(BMI());

class BMI extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: inputpage(),
      // theme: ThemeData(
      //   primaryColor: Color(0xFF0A0E21),
      //   accentColor: Colors.greenAccent,
      //   scaffoldBackgroundColor: Color(0xFF0A0E21),
      //   textTheme: TextTheme(
      //       bodyText2: TextStyle(fontSize: 50.0, color: Colors.white)),
      // ),
      theme: ThemeData.dark().copyWith(
        primaryColor: Color(0xFF0A0E21),
        scaffoldBackgroundColor: Color(0xFF0A0E21),
      ),
    );
  }
}

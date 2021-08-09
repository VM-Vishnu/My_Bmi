import 'package:bmi/launchPage.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(
    MaterialApp(
      debugShowCheckedModeBanner: false,
      home: LaunchPage(
        bmiValue: " ",
        bmiResult: " ",
      ),
    ),
  );
}

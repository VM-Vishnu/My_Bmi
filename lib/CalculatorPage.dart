import 'dart:math';

class CalculatorPage {
  final weight, height;
  CalculatorPage({required this.weight, required this.height});
  double bmi = 0;
  String bmiValue() {
    bmi = weight / pow(height / 100, 2);

    return bmi.toStringAsFixed(1);
  }

  String bmiResult() {
    String result = "";
    if (bmi < 18.5) {
      result = "UnderWeight";
    } else if (bmi >= 18.5 && bmi < 22.9) {
      result = "Normal Weight";
    } else if (bmi >= 23.0 && bmi < 24.9) {
      result = "OverWeight";
    } else if (bmi >= 25.0 && bmi < 29.9) {
      result = "Moderately Obese";
    } else if (bmi >= 30.0) {
      result = "Severly Obese";
    }
    return result;
  }
}

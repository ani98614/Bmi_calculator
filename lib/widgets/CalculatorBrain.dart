import 'dart:html';
import 'dart:math';

class CalculatorBrain {
  final int height;
  final int weight;
  double _bmi = 0;
  CalculatorBrain({required this.height, required this.weight});
  String calculateBmi() {
    _bmi = weight / pow(height / 100, 2);
    return _bmi.toStringAsFixed(1);
  }

  String getResult() {
    if (_bmi >= 25) {
      return "OverWeight";
    } else if (_bmi > 18.5) {
      return 'Normal';
    } else {
      return 'UnderWeight';
    }
  }

  String getIntepretation() {
    if (_bmi >= 25) {
      return "You have a higher than normal body weight .Try to exersice more";
    } else if (_bmi > 18.5) {
      return "You have a normal body weight . Good job";
    } else {
      return "You have lowwer than normal body weight.You can eat a bit more";
    }
  }
}

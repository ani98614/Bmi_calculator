import 'package:flutter/material.dart';
import 'widgets/BottomButton.dart';

import 'const.dart';
import 'widgets/CalculatorBrain.dart';
import 'widgets/Resuablecard.dart';

class Result extends StatelessWidget {
  final String bmi_result;
  final String resultText;
  final String interpretation;
  const Result(
      {required this.bmi_result,
      required this.resultText,
      required this.interpretation});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(title: Text("BMI CALCLUATOR")),
        body: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Expanded(
                child: Container(
                  child: Text("Your result",
                      textAlign: TextAlign.center, style: kTitleTextStyle),
                ),
              ),
              Expanded(
                flex: 5,
                child: ResuableCard(
                  colour: kActiveCardColour,
                  cardChild: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Text(resultText, style: kResultTextStyle),
                        Text(bmi_result, style: kBMITextStyle),
                        Text(interpretation,
                            style: kResulBodyTextStyle,
                            textAlign: TextAlign.center),
                      ]),
                ),
              ),
              BottomButton(
                  label: "RECALCULATE",
                  ontap: () {
                    Navigator.pop(context);
                    print("RECALCULATING");
                  }),
            ]));
  }
}

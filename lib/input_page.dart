import 'package:bmi_calculator/widgets/CalculatorBrain.dart';
import 'package:bmi_calculator/widgets/Resuablecard.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import 'const.dart';
import 'result_page.dart';
import 'widgets/BottomButton.dart';
import 'widgets/Iconcontent.dart';
import 'widgets/RoundIconButton.dart';

enum Gender { male, female }

class InputPage extends StatefulWidget {
  const InputPage({super.key});

  @override
  State<InputPage> createState() => _InputPageState();
}

class _InputPageState extends State<InputPage> {
  Gender? selectedGender;
  int height = 180;
  int weight = 40;
  int age = 1;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("BMI CALCULATOR"),
        centerTitle: true,
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Expanded(
            child: Row(
              children: [
                Expanded(
                  child: ResuableCard(
                      onpressed: () {
                        setState(() {
                          selectedGender = Gender.male;
                        });
                      },
                      colour: selectedGender == Gender.male
                          ? kActiveCardColour
                          : kInactiveCardColour,
                      cardChild: Iconcontent(
                          name: 'Male', icon: FontAwesomeIcons.mars)),
                ),
                Expanded(
                  child: ResuableCard(
                      onpressed: () {
                        setState(() {
                          selectedGender = Gender.female;
                        });
                      },
                      colour: selectedGender == Gender.female
                          ? kActiveCardColour
                          : kInactiveCardColour,
                      cardChild: Iconcontent(
                          name: 'Female', icon: FontAwesomeIcons.venus)),
                ),
              ],
            ),
          ),
          Expanded(
            child: ResuableCard(
                colour: const Color(0xFF1D1E33),
                cardChild: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Text("Height", style: kLabelTextStyle),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.baseline,
                      textBaseline: TextBaseline.alphabetic,
                      children: [
                        Text("$height", style: kNumberTextStyle),
                        const Text("cm", style: kLabelTextStyle),
                      ],
                    ),
                    SliderTheme(
                      data: SliderTheme.of(context).copyWith(
                        activeTrackColor: Colors.white,
                        inactiveTrackColor: const Color(0xFF8DE98),
                        thumbColor: const Color(0xFFEB1555),
                        overlayColor: const Color(0x29EB1555),
                        thumbShape: const RoundSliderThumbShape(
                            enabledThumbRadius: 15.0),
                        overlayShape:
                            const RoundSliderOverlayShape(overlayRadius: 30.0),
                      ),
                      child: Slider(
                          value: height.toDouble(),
                          min: 120,
                          max: 220,
                          onChanged: (double newvalue) {
                            setState(() {
                              height = newvalue.toInt();
                            });
                            print(newvalue);
                          }),
                    ),
                  ],
                )),
          ),
          Expanded(
            child: Row(children: [
              Expanded(
                child: ResuableCard(
                    colour: kActiveCardColour,
                    cardChild: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text("Weight", style: kLabelTextStyle),
                        Text(weight.toString(), style: kNumberTextStyle),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            RoundIconButton(
                                iconData: FontAwesomeIcons.plus,
                                ontap: () {
                                  setState(() {
                                    weight++;
                                  });
                                }),
                            RoundIconButton(
                                iconData: FontAwesomeIcons.minus,
                                ontap: () {
                                  setState(() {
                                    if (weight > 0) {
                                      weight--;
                                    } else {
                                      weight = 0;
                                    }
                                  });
                                }),
                          ],
                        ),
                      ],
                    )),
              ),
              Expanded(
                child: ResuableCard(
                    colour: const Color(0xFF1D1E33),
                    cardChild: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text("Age", style: kLabelTextStyle),
                        Text('$age', style: kNumberTextStyle),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            RoundIconButton(
                                iconData: FontAwesomeIcons.plus,
                                ontap: () {
                                  setState(() {
                                    age++;
                                  });
                                }),
                            RoundIconButton(
                                iconData: FontAwesomeIcons.minus,
                                ontap: () {
                                  setState(() {
                                    if (age > 1) {
                                      age--;
                                    } else {
                                      age = 1;
                                    }
                                  });
                                }),
                          ],
                        )
                      ],
                    )),
              ),
            ]),
          ),
          BottomButton(
              label: "CALCULATE",
              ontap: () {
                CalculatorBrain calculatorBrain =
                    new CalculatorBrain(height: height, weight: weight);
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => Result(
                            bmi_result: calculatorBrain.calculateBmi(),
                            resultText: calculatorBrain.getResult(),
                            interpretation:
                                calculatorBrain.getIntepretation())));
              }),
              
        ],
      ),
    );
  }
}

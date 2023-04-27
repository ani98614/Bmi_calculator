import 'package:flutter/material.dart';

import '../const.dart';
import '../result_page.dart';

class BottomButton extends StatelessWidget {
  final String label;
  final VoidCallback? ontap;
  const BottomButton({required this.label, this.ontap});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: ontap,
      child: Container(
        alignment: Alignment.center,
        child: Text(label, style: kLargebuttonTextStyle),
        color: kBottomContainerColour,
        margin: EdgeInsets.all(15),
        width: MediaQuery.of(context).size.width,
        height: 80,
      ),
    );
  }
}

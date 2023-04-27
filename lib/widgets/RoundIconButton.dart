import 'package:flutter/material.dart';

class RoundIconButton extends StatelessWidget {
  final IconData iconData;
  final VoidCallback ontap;

  RoundIconButton({required this.iconData, required this.ontap});

  @override
  Widget build(BuildContext context) {
    return RawMaterialButton(
        child: Icon(iconData, color: Colors.white),
        elevation: 6,
        disabledElevation: 6,
        constraints: const BoxConstraints.tightFor(width: 56, height: 56),
        onPressed: ontap,
        shape: const CircleBorder(),
        fillColor: const Color(0xFF4C4F5E));
  }
}

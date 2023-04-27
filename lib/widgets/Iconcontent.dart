import 'package:flutter/material.dart';

import '../const.dart';

class Iconcontent extends StatelessWidget {
  String name;
  IconData icon;
  Iconcontent({required this.name, required this.icon});

  @override
  Widget build(BuildContext context) {
    return Column(mainAxisAlignment: MainAxisAlignment.center, children: [
      Icon(icon, size: 100),
      SizedBox(height: 15),
      Text(name, style: kLabelTextStyle),
    ]);
  }
}
